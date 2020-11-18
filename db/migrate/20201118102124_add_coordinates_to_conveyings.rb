class AddCoordinatesToConveyings < ActiveRecord::Migration[6.0]
  def change
    add_column :conveyings, :latitude, :float
    add_column :conveyings, :longitude, :float
  end
end
