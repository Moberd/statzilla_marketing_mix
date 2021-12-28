require_relative 'test_helper'
#MiniTest::Reporters.use!

class SomeSimpleTestsTest < ActiveSupport::TestCase

  test "assert true" do
    assert true
  end

  test "New user creates" do
    User.create(email: "alexey@gmail.com", name: "alexey")
    assert User.find_by(email: "alexey@gmail.com") != nil, "user not created"
  end

  test "User hasmany forms" do
    user = User.find_or_create_by(email: "alexey@gmail.com", name: "alex")
    user.xls_forms.create
    user.xls_forms.create
    assert user != nil, "user somehow not created"
    assert XlsForm.find_by(user_id: user.id) != nil
    assert XlsForm.first.id != XlsForm.last.id, "did not found two forms with the same user id"
  end

end
