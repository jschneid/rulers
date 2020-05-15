require_relative 'test_helper'

class TestApp < Rulers::Application
end

class RulersAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get '/'

    assert last_response.ok?
    body = last_response.body
    assert body['Hello']
  end

  def test_sum
    get '/?args=2,2,3,3'

    assert last_response.ok?
    body = last_response.body
    assert body['Sum of the given arguments: 10']
  end

  def test_sum__no_args
    get '/'

    assert last_response.ok?
    body = last_response.body
    assert_nil body['Sum of the given arguments']
  end
end
