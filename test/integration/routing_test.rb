#encoding: utf-8
require File.expand_path('../../test_helper', __FILE__)
require File.expand_path('../../support/integration_helper', __FILE__)

class RoutingTest < integration_test_suite_parent_class

  include RouteTranslator::TestHelper

  def test_set_locale_from_params
    config_default_locale_settings 'en'

    get '/es/dummy'
    assert_equal 'es', @response.body
    assert_response :success
  end

  def test_mounted_apps_work_with_correct_path
    get 'dummy_mounted_app'
    assert_equal "Good", @response.body
    assert_response :success
  end

end
