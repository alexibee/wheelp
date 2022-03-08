class AddCategoryToService < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :category, :string
  end
end
