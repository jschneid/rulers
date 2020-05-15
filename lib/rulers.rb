require 'rulers/version'
require 'rulers/array'

module Rulers
  class Application
    def call(env)
      # Get the comma-separated numeric values of the "args" query string key, if there was one.
      # e.g. "http://localhost:3001/?args=1,2,3" will yield [1,2,3]
      args = Rack::Utils.parse_nested_query(env['QUERY_STRING'])['args']&.split(',')&.map(&:to_i)

      message = "<p>Hello from Jon's implementation of Ruby on Rulers!</p>"

      unless args.nil?
        message += "<p>The provided arguments were: #{args.pretty_print}</p>"
        message += "<p>Sum of the given arguments: #{args.sum}</p>"
        message += "<p>Product of the given arguments: #{args.multiply}</p>"
      end

      [200, { 'Content-Type' => 'text/html' }, [message]]
    end
  end
end
