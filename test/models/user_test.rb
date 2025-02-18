require "test_helper"

class UserTest < ActiveSupport::TestCase
  fixtures :users

  def setup
    @user = User.new(
      email_address: "test@example.com",
      password: "password",
      password_confirmation: "password",
      first_name: "john",
      last_name: "doe",
      birth_date: "2000-01-01"
    )
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "email should be normalized" do
    @user.email_address = " TEST@EXAMPLE.COM "
    @user.save
    assert_equal "test@example.com", @user.reload.email_address
  end

  test "first name should be titleized" do
    @user.first_name = " john "
    @user.save
    assert_equal "John", @user.reload.first_name
  end

  test "last name should be titleized" do
    @user.last_name = " doe "
    @user.save
    assert_equal "Doe", @user.reload.last_name
  end

  test "birth date should be converted to date" do
    @user.birth_date = "2000-01-01"
    @user.save
    assert_equal Date.parse("2000-01-01"), @user.reload.birth_date
  end

  test "should have many sessions" do
    assert_respond_to @user, :sessions
  end

  test "should have many wish_lists" do
    assert_respond_to @user, :wish_lists
  end

  test "should have many friendships" do
    assert_respond_to @user, :friendships
  end

  test "should have many gifts" do
    assert_respond_to @user, :gifts
  end

  test "should have many owned_gifts" do
    assert_respond_to @user, :owned_gifts
  end
end
