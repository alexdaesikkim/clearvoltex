require 'test_helper'

class UserTest < ActiveSupport::TestCase
  puts "HI"
  should allow_value("ASDFASDF").for(:username) 
  should_not allow_value("ASDF").for(:username)
  test "example" do
  	user = User.new
  	assert_not user.save, "User save without required fields"
  end


end
