class CreateBrands < ActiveRecord::Migration[5.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :avatar
      t.text :profile

      t.timestamps null: false
    end
  end
end
