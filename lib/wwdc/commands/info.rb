command :info do |c|
  c.syntax = 'wwdc info [SESSION] [YEAR]'
  c.summary = 'Get information about a session by its number'
  c.description = ''

  c.action do |args, options|
    say_error "Missing session number" and abort unless @number = (Integer(args.first) rescue nil)
    @year = (Integer(args[1]) rescue nil) || Date.today.strftime('%Y')

    session = get(path: "/#{@year}/sessions/#{@number}")

    describe session
  end
end

alias_command :session, :info
