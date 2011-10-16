require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  #Test that a user see the right posts 
  
   test "create a message" do
      message = Message.new
      #make sure we have all the good params including the associations
      message.message = "oh my message"
      message.listing = listings(:one)
      message.user = users(:dog)
      assert message.save
  end
  
end
