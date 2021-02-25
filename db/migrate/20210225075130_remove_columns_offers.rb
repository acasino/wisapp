class RemoveColumnsOffers < ActiveRecord::Migration[5.2]
  def change
    remove_column :offers, :transaction_id 
    remove_column :offers, :accepted 
    remove_column :offers, :timestamp  
    remove_column :offers, :wanted_id  
  end
end
