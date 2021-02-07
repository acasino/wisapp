class CreateUserwatches < ActiveRecord::Migration[5.1]
  def change
    create_table :userwatches do |t|
      t.references :user_id
      t.references :watch_id

      t.timestamps null: false
    end
  end
end
