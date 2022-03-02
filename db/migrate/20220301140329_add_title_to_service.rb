class AddTitleToService < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :title, :string
  end
end
