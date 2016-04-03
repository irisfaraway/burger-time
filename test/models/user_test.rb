require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(username: "abc123", display_name: "Hamburgler")
  end

  test "should be valid" do
    assert @user.valid?    
  end

  test "username should be present" do
    @user.username = "   "
    assert_not @user.valid?
  end

  test "usernames should be unique" do
    duplicate_user = @user.dup
    duplicate_user.username = @user.username.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

end
