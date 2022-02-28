class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.string :vehicle_brand
      t.string :vehicle_model
      t.string :vehicle_year
      t.string :vehicle_address
      t.string :vehicle_contact
      t.string :vehicle_url
      t.string :additional_details

      t.timestamps
    end
  end
end
