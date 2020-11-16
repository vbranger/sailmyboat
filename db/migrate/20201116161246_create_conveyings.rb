class CreateConveyings < ActiveRecord::Migration[6.0]
  def change
    create_table :conveyings do |t|
      t.string :boat_name
      t.string :boat_type
      t.string :start_location
      t.string :arival_location
      t.date :arrival_date
      t.date :start_date
      t.integer :duration
      t.references :user, null: false, foreign_key: true
      t.integer :price
      t.integer :capacity
      t.boolean :booked, default: false

      t.timestamps
    end
  end
end
