require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @user.courses.create(id: 1, name: "blank", major_id: 1)
    # byebug
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user:  { email: "berkowitzadi@gmail.com", first_name: "bob", last_name: "bdjkfsdjf", university_id: @user.university_id, username: @user.username, password: "foobar", password_confirmation: "foobar" } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { email: "ber@gmail.com", first_name: ":mfff", last_name: "mfsdfsd", university_id: @user.university_id, username: @user.username, password: "foobar", password_confirmation: "foobar" } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
