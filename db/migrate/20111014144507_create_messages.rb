class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :message
      t.string :user_id
      t.string :listing_id

      t.timestamps
    end
  end
end
