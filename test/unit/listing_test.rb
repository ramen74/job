require 'test_helper'


class ListingTest < ActiveSupport::TestCase
  
  test "create a listing" do
    listing = Listing.new
    #make sure we have all the good params including the association
    listing.title = "a job"
    listing.description = "a good job"
    listing.company = "a great company"
    listing.user = users(:cat)
    assert listing.save
  end
  
  test "edit a message" do
    listing = listings(:one)
    id = listing.id
    listing.title = "edited title"
    listing.save
    edited_listing = Listing.find(id)
    assert_equal(edited_listing.title, "edited title")
  end
  
end
