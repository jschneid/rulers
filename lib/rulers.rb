require 'rulers/version'
require 'rulers/array'

module Rulers
  class Application
    def call(env)
      [200, { 'Content-Type' => 'text/html' },
       ['Hello from Jon\'s implementation of Ruby on Rulers!']]
    end
  end
end
