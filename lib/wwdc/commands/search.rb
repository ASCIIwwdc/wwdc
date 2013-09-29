command :search do |c|
  c.syntax = 'wwdc search [QUERY]'
  c.summary = 'Find sessions containing the specified search terms'
  c.description = ''

  c.action do |args, options|
    @query = args.join(" ")
    say_error "Missing session number" and abort if @query.empty?

    json = get(path: "search", query: {q: @query})

    json['results'].each do |result|
      describe result
    end
  end
end

alias_command :'?', :search
alias_command :query, :search
