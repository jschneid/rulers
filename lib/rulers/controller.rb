require 'erubis'

module Rulers
  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end

    def controller_name
      klass = self.class
      klass = klass.to_s.gsub /Controller$/, ''
      Rulers.to_underscore klass
    end

    def render(view_name, locals = {})
      filename = File.join 'app', 'views', controller_name, "#{view_name}.html.erb"
      template = File.read filename

      # Add ability for the view to use the controller's instance variables
      instance_variables.each do |ivar|
        locals[ivar] = instance_variable_get(ivar)
      end

      eruby = Erubis::Eruby.new(template)
      eruby.result locals
    end
  end
end
