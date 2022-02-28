class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.references :user, null: false, foreign_key: true
      t.string :bio
      t.string :address
      t.integer :price
      t.date :availability

      t.timestamps
    end
  end
end
