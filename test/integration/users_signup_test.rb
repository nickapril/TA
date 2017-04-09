require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:michael)
    @user.courses.create(id: 1)
  end
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { first_name:  "",
      									                 last_name:   "",
                                         email: "user@invalid",
                                         username: "",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
  end
  
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { first_name:  "Abe",
                                         last_name:   "Shlabe",
                                         email: "user@example.com",
                                         username: "acdc",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    # User.all.first.courses.create(id: 2)
    # User.all.first.courses.create(id: 1) #used so that 'users/show works bc it need course with id 2'
    assert_template 'users/show'
    assert is_logged_in?
  end
end
