class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.references :sender_id
      t.references :receiver_id
      t.float :sender_offer_price
      t.datetime :timestamp
      t.string :transaction_id
      t.string :status
      t.references :wanted_id
      t.boolean :accepted

      t.timestamps null: false
    end
  end
end
