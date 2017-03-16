require 'test_helper'

class DansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dan = dans(:one)
  end

  test "should get index" do
    get dans_url
    assert_response :success
  end

  test "should get new" do
    get new_dan_url
    assert_response :success
  end

  test "should create dan" do
    assert_difference('Dan.count') do
      post dans_url, params: { dan: { first_song_id: @dan.first_song_id, integer: @dan.integer, integer: @dan.integer, level: @dan.level, name: @dan.name, photo: @dan.photo, second_song_id: @dan.second_song_id, third_song_id: @dan.third_song_id } }
    end

    assert_redirected_to dan_url(Dan.last)
  end

  test "should show dan" do
    get dan_url(@dan)
    assert_response :success
  end

  test "should get edit" do
    get edit_dan_url(@dan)
    assert_response :success
  end

  test "should update dan" do
    patch dan_url(@dan), params: { dan: { first_song_id: @dan.first_song_id, integer: @dan.integer, integer: @dan.integer, level: @dan.level, name: @dan.name, photo: @dan.photo, second_song_id: @dan.second_song_id, third_song_id: @dan.third_song_id } }
    assert_redirected_to dan_url(@dan)
  end

  test "should destroy dan" do
    assert_difference('Dan.count', -1) do
      delete dan_url(@dan)
    end

    assert_redirected_to dans_url
  end
end
