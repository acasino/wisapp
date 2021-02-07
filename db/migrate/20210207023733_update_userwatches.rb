class UpdateUserwatches < ActiveRecord::Migration[5.2]
  def change
    change_table :userwatches do |t|
      t.rename :user_id_id, :user_id
      t.rename :watch_id_id, :watch_id
    end
  end
end