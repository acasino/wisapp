class User < ActiveRecord::Base
    has_many :userwatches
    has_many :watches, through: :userwatches
    has_many :genres, through: :watches
    has_many :brands, through: :watches
    has_many :initiated_offers, class_name: "Offer", foreign_key: "sender_id" 
    has_many :received_offers, class_name: "Offer", foreign_key: "receiver_id" 
    has_secure_password
    validates :password, length: {in: 10..100}, confirmation: true#, on: :create
end
