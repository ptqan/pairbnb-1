class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
    	t.string :name
    	t.string :description
    	t.string :tags
    	t.string :room_type
    	t.integer :beds
    	t.integer :user_id
    end
  end
end
