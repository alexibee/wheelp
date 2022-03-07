class AddBookingToChatrooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :chatrooms, :booking, null: false, foreign_key: true
  end
end
