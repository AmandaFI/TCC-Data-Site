require "test_helper"

class Api::SubjectControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_subject_index_url
    assert_response :success
  end

  test "should get show" do
    get api_subject_show_url
    assert_response :success
  end

  test "should get create" do
    get api_subject_create_url
    assert_response :success
  end

  test "should get update" do
    get api_subject_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_subject_destroy_url
    assert_response :success
  end
end
