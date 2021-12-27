require_relative 'test_helper'
#MiniTest::Reporters.use!

class SomeSimpleTestsTest < ActiveSupport::TestCase
  test "New user creates" do
    User.create(email: "alexey@gmail.com", name: "alexey")
    assert User.find_by(email: "alexey@gmail.com") != nil
    
  end
end