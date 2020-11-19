class Change < ActiveRecord::Migration[6.0]
  def up
    change_column :conveyings, :capacity, :string
  end

  def down
    change_column :conveyings, :capacity, :integer
  end
end
