class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
    	t.string :name
    	t.string :description
        t.string :property_type
        t.integer :beds
        t.integer :guests
        t.string :country
        t.integer :bathrooms
    	t.integer :user_id
    end
  end
end
