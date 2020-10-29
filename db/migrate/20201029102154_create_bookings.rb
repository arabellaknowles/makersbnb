class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings, force: :cascade do |t|
      t.integer :guest_id
      t.integer :space_id
      t.date :start_date
      t.date :end_date
    end
  end
end
