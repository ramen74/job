class Listing < ActiveRecord::Base
  
  has_many :messages
  belongs_to :user

    validates :title,  :presence => true
    validates :company, :presence => true
    validates :description, :presence => true
    validates :user_id, :presence => true
    
end
