command :open do |c|
  c.syntax = 'wwdc open [SESSION] [YEAR]'
  c.summary = 'Open your browser to the Apple Developer Center to view session slides and video'
  c.description = ''

  c.action do |args, options|
    say_error "Missing session number" and abort unless @number = (Integer(args.first) rescue nil)
    @year = (Integer(args[1]) rescue nil) || Date.today.strftime('%Y')

    session = get(path: "/#{@year}/sessions/#{@number}") do |response|
      url = response.headers['Link'].scan(/\<(.+)\>/).flatten.first
      `open "#{url}"`
    end
  end
end

alias_command :video, :open
alias_command :slides, :open
