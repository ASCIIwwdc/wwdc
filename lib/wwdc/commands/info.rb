command :info do |c|
  c.syntax = 'wwdc info [SESSION]'
  c.summary = 'Get information about a session by its number'
  c.description = ''

  c.action do |args, options|
    say_error "Missing session number" and abort unless @number = (Integer(args.first) rescue nil)

    session = get(path: "/2013/sessions/#{@number}")

    describe session
  end
end

alias_command :session, :info
