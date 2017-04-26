require 'test_helper'

class DifficultyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  should have_many(:userstats)
  should have_many(:comments)
  test "Testing user_score" do
  end

  test "Testing user_clear" do
  end

  test "Testing tag_to_string" do
  end
end
