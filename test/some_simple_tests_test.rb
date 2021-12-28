require_relative 'test_helper'
#MiniTest::Reporters.use!

class SomeSimpleTestsTest < ActiveSupport::TestCase

  test "New user creates" do
    User.create(email: "alexey@gmail.com", name: "alexey")
    assert User.find_by(email: "alexey@gmail.com") != nil, "user not created"
  end

  test "User hasmany forms" do
    User.find_or_create_by(email: "alexey@gmail.com", name: "alex").xls_forms.create
    user = User.find_by(email: "alexey@gmail.com", name: "alex")
    form = XlsForm.find_by(user_id: user.id)
    assert user != nil, "user somehow not created"
    assert form != nil, "did not found form with the user id"
  end

end
