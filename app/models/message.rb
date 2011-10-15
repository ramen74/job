class Message < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :listing
  
  validates :message,  :presence => true
  
end
