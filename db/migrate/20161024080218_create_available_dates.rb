class CreateAvailableDates < ActiveRecord::Migration
  def change
    create_table :available_dates do |t|
    	t.date :unavailable_date
    	t.integer :listing_id
      t.timestamps null: false
    end
  end
end
