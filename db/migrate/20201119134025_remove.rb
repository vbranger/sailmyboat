class Remove < ActiveRecord::Migration[6.0]
  def change
    remove_column :conveyings, :duration, :integer
  end
end
