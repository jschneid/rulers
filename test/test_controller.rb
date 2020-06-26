require_relative 'test_helper'

class ExemplarController < Rulers::Controller
  def initialize(env)
    super(env)

    @my_ivar = 'my sample instance variable value';
  end
end

class RulersAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def test_controller_name
    my_controller = ExemplarController.new({})
    assert_equal 'exemplar', my_controller.controller_name
  end

  # Note: Not sure yet how to test the render method since it does
  # things with the filesystem.

end
