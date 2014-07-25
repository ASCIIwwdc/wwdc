command :open do |c|
  c.syntax = 'wwdc open [SESSION]'
  c.summary = 'Open your browser to the Apple Developer Center to view session slides and video'
  c.option '-y', '--year YEAR', 'WWDC Year'

  c.action do |args, options|
    determine_session!(args, options)
    determine_year!(args, options)

    @session = get(path: "/#{@year}/sessions/#{@number}") do |response|
      url = response.headers['Link'].scan(/\<(.+)\>/).flatten.first
      `open "#{url}"`
    end
  end
end

alias_command :video, :open
alias_command :slides, :open
