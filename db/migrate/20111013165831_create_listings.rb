class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.string :company
      t.text :description
      t.timestamps
    end
  end
end
