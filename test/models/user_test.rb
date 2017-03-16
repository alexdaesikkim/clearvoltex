require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "example" do
  	user = User.new
  	assert_not user.save, "User save without required fields"
  end
end
