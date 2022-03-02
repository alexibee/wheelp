class RemoveAvailabilityFromServices < ActiveRecord::Migration[6.1]
  def change
    remove_column :services, :availability
  end
end
