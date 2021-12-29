require "test_helper"

class XlsFormControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get xls_forms_index_url
    assert_response :success
  end
end
