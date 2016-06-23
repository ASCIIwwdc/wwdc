require 'excon'
require 'json'
require 'rubygems/text'

module WWDC
  YEARS = (2010..2016)

  module Helpers
    include Gem::Text

    def get(options = {}, &block)
      response = client.get(options)
      say_error "Error #{response.status}" and abort unless response.status == 200

      yield response if block_given?

      JSON.parse(response.body)
    end

    def describe(*sessions)
      enable_paging if sessions.length > 5

      sessions.each do |session|
        puts %{\033[1mWWDC #{session['year']}\033[0m}
        puts %{\033[1mSession #{session['number']}: "#{session['title']}"\033[0m}
        puts
        puts format_text(session['description'], 80)
        puts
      end
    end

    private

    def determine_session!(args = [], options = {})
      @number = (Integer(args.first).nonzero? rescue nil)
      say_error "Missing session number" and abort unless @number
    end

    def determine_year!(args = [], options = {})
      @year = (Integer(options.year).nonzero? rescue nil) || YEARS.last
      say_error "Invalid year: #{@year}" and abort unless YEARS.include?(@year)
    end

    def determine_query!(args = [], options = {})
      @query = args.join(" ")
      say_error "Missing query" and abort if @query.empty?
    end

    def client
      @client ||= Excon.new('http://asciiwwdc.com', headers: {'Accept' => "application/json"})
    end
  end
end
