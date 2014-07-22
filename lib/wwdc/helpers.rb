require 'excon'
require 'json'

module WWDC
  module Helpers
    def get(options = {}, &block)
      response = client.get(options)
      say_error "Error #{response.status}" and abort unless response.status == 200

      yield response if block_given?

      JSON.parse(response.body)
    end

    def describe(session)
      puts %{\033[1m#{session['number']}: "#{session['title']}"\033[0m}
      puts session['description']
      puts
    end

    private

    def client
      @client ||= Excon.new('http://asciiwwdc.com', headers: {'Accept' => "application/json", 'Cache-Control' => "no-cache"})
    end
  end
end
