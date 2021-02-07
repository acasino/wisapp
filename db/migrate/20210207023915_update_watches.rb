class UpdateWatches < ActiveRecord::Migration[5.2]
  def change
    change_table :watches do |t|
      t.rename :brand_id_id, :brand_id
      t.rename :genre_id_id, :genre_id
      t.rename :owner_id_id, :owner_id
    end
  end
end

