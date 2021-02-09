class RenameWatchColumns < ActiveRecord::Migration[5.2]
  def change
    change_table :watches do |t|
      t.rename :brand_id, :brand
      t.rename :genre_id, :genre
    end
  end
end
