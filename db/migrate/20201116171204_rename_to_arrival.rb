class RenameToArrival < ActiveRecord::Migration[6.0]
  def change
    rename_column :conveyings, :arival_location, :arrival_location
  end
end
