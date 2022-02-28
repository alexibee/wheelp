class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :bio
      t.string :address
      t.integer :price
      t.date :availability

      t.timestamps
    end
  end
end
