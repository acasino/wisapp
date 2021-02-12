class AddWatchId < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :watch_id, :integer
  end
end
