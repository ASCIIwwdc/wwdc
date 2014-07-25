command :search do |c|
  c.syntax = 'wwdc search [QUERY]'
  c.summary = 'Find sessions containing the specified search terms'
  c.option '-y', '--year YEAR', 'WWDC Year'

  c.action do |args, options|
    determine_query!(args, options)
    determine_year!(args, options) if options.year

    @results = get(path: "search", query: {q: @query, year: @year})['results']

    say_warning "No results" and abort if @results.empty?

    describe *@results
  end
end

alias_command :'?', :search
alias_command :query, :search
