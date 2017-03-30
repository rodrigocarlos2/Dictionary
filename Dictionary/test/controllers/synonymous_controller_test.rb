require 'test_helper'

class SynonymousControllerTest < ActionDispatch::IntegrationTest
  setup do
    @synonymou = synonymous(:one)
  end

  test "should get index" do
    get synonymous_url
    assert_response :success
  end

  test "should get new" do
    get new_synonymou_url
    assert_response :success
  end

  test "should create synonymou" do
    assert_difference('Synonymou.count') do
      post synonymous_url, params: { synonymou: {  } }
    end

    assert_redirected_to synonymou_url(Synonymou.last)
  end

  test "should show synonymou" do
    get synonymou_url(@synonymou)
    assert_response :success
  end

  test "should get edit" do
    get edit_synonymou_url(@synonymou)
    assert_response :success
  end

  test "should update synonymou" do
    patch synonymou_url(@synonymou), params: { synonymou: {  } }
    assert_redirected_to synonymou_url(@synonymou)
  end

  test "should destroy synonymou" do
    assert_difference('Synonymou.count', -1) do
      delete synonymou_url(@synonymou)
    end

    assert_redirected_to synonymous_url
  end
end
