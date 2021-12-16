require "test_helper"

class XlsFormControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get xls_form_index_url
    assert_response :success
  end
end
