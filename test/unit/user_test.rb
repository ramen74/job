require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
   test "create a message" do
      user = User.new
      #make sure we have all the good params.
      user.email = "myemail@fake.com"
      user.password = "fake_password"
      assert user.save
  end
  
end
