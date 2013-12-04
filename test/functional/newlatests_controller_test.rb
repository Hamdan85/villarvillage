# -*- encoding : utf-8 -*-
require 'test_helper'

class NewlatestsControllerTest < ActionController::TestCase
  setup do
    @newlatest = newlatests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:newlatests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create newlatest" do
    assert_difference('Newlatest.count') do
      post :create, newlatest: { content: @newlatest.content, title: @newlatest.title }
    end

    assert_redirected_to newlatest_path(assigns(:newlatest))
  end

  test "should show newlatest" do
    get :show, id: @newlatest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @newlatest
    assert_response :success
  end

  test "should update newlatest" do
    put :update, id: @newlatest, newlatest: { content: @newlatest.content, title: @newlatest.title }
    assert_redirected_to newlatest_path(assigns(:newlatest))
  end

  test "should destroy newlatest" do
    assert_difference('Newlatest.count', -1) do
      delete :destroy, id: @newlatest
    end

    assert_redirected_to newlatests_path
  end
end
