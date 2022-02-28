class AddUserToService < ActiveRecord::Migration[6.1]
  def change
    add_reference :services, :user, null: false, foreign_key: true
  end
end
