class RenameOffers < ActiveRecord::Migration[5.2]
  def change
    change_table :offers do |t|
      t.rename :sender_id_id, :sender_id
      t.rename :receiver_id_id, :receiver_id
      t.rename :wanted_id_id, :wanted_id
    end  
  end
end 
