require 'test_helper'

class MessagesControllerTest < ActionController::TestCase

  
  test "should get a new listing" do
    sign_in users(:cat)
    #new requires a listing if so we pas it along in a post
    post(:new,:id => listings(:one).id)
    assert_response :success
  end
  
  test "job poster should see thier messages for thier job listing" do
    sign_in users(:cat)
    get :index_by_current_user
    
    assert_not_nil assigns(:listings)
    assert_equal(2, assigns(:messages).size)    
  end
  
  test "job poster should see no messages if no messages" do
    sign_in users(:cat)
    get :index_by_current_user
    
    assert_not_nil assigns(:listings)
    assert_equal(2, assigns(:messages).size)    
  end
  
  test "replier should see no messages if no listing where made" do
    sign_in users(:pig)
    get :index_by_current_user
    
    #check to make sure the messages is an empty Array... i.e. there are no messages..
    assert_equal(Array.new,assigns(:messages))    
  end
  
end
