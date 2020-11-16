class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :conveying, null: false, foreign_key: true
      t.date :start_time
      t.date :end_time
      t.boolean :validated, default: false

      t.timestamps
    end
  end
end
