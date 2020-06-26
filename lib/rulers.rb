require 'rulers/version'
require 'rulers/routing'
require 'rulers/util'
require 'rulers/dependencies'
require 'rulers/controller'

module Rulers
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, { 'Content-Type' => 'text/html' }, []]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)

      begin
        text = controller.send(act)
      rescue Exception
        error_message = "HTTP 500 error. It's not you, it's us."
        return [500, { 'Content-Type' => 'text/html' }, [error_message]]
      end

      [200, { 'Content-Type' => 'text/html' }, [text]]
    end
  end
end
