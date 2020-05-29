require 'rulers/version'
require 'rulers/array'
require 'rulers/routing'

module Rulers
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, { 'Content-Type' => 'text/html' }, []]
      end

      env['PATH_INFO'] = '/home/index' if env['PATH_INFO'] == '/'

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

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
