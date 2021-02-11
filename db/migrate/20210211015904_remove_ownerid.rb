class RemoveOwnerid < ActiveRecord::Migration[5.2]
  def change
    remove_column :watches, :owner_id
  end
end
