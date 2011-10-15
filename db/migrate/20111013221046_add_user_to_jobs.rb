class AddUserToJobs < ActiveRecord::Migration

#adding user_id to jobs so we can track who made the job...

  def self.up
    add_column :listings, :user_id, :string
  end
  
  def self.down
    remove_column :listings, :user_id
  end

end
