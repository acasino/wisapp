class ChangeType < ActiveRecord::Migration[5.2]
  def change
    change_column :watches, :brand, :string
    change_column :watches, :genre, :string
  end
end
