require 'test_helper'

class CatalogControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success

    assert_select 'h2.card-title', Product.count
    assert_select 'h2.card-title', Product.first.title
    assert_select '.card-footer', /\d+,\d+ €/
  end
end
