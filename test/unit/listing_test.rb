require 'test_helper'


class ListingTest < ActiveSupport::TestCase
  
  #some validation tests
  test "should not save listing with no description" do
    listing = Listing.new
    assert !listing.save
  end
  
  #you must be  logged in....
  test "should fail to save if there is no user logged in" do
    #listing = Listing.new
    #assert !listing.save
  end
  
  #basic  case
   test "user can create a new listing" do
      #listing = Listing.new
      #assert listing.save
  end
  
end
