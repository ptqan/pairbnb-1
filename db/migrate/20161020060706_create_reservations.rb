class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
    	t.integer :user_id
    	t.integer :listing_id
    	t.datetime :check_in
    	t.datetime :check_out
    	t.timestamps null: false
    end
  end
end
