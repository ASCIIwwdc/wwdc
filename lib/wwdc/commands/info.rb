command :info do |c|
  c.syntax = 'wwdc info SESSION'
  c.summary = 'Get information about a session by its number and year'
  c.option '-y', '--year YEAR', 'WWDC Year'

  c.action do |args, options|
    determine_session!(args, options)
    determine_year!(args, options)

    @session = get(path: "/#{@year}/sessions/#{@number}")

    describe @session
  end
end

alias_command :session, :info
