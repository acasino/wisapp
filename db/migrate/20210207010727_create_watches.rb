class CreateWatches < ActiveRecord::Migration[5.1]
  def change
    create_table :watches do |t|
      t.string :name
      t.string :dimensions
      t.text :description
      t.float :price
      t.string :avatar
      t.references :brand_id
      t.references :genre_id
      t.references :owner_id

      t.timestamps null: false
    end
  end
end
