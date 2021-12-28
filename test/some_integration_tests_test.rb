require_relative 'test_helper.rb'

class SomeIntegrationTest < ActionDispatch::IntegrationTest
  test "First page loads" do
    https!
    get '/xls_forms/index'
    assert_response :success
  end

  test "Default params pass" do
    get xls_forms_index_path, params: {
      name: 'alexey',
      email: 'alexey@gmail.com',
      file: File.open("#{Rails.root.to_s}/storage/testfile.csv")
    }
    assert_response :success
  end
end