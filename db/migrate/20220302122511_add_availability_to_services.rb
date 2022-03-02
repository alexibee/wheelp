class AddAvailabilityToServices < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :availability, :date, array: true, default: []
  end
end
