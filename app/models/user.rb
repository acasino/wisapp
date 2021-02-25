class User < ActiveRecord::Base
    has_many :userwatches
    has_many :watches, through: :userwatches
    has_many :initiated_offers, class_name: "Offer", foreign_key: "sender_id" 
    has_many :received_offers, class_name: "Offer", foreign_key: "receiver_id" 
    
    has_secure_password

    validates :password, length: {in: 8..100}, confirmation: true#, on: :create
    validates :username, uniqueness: true, length: {in: 3..30}, exclusion: {in: %w(admin superadmin user)}
    validates :email, presence: true, uniqueness: true, format: {with: /\A(?<username>[^@\s]+)@((?<domain_name>[-a-z0-9]+)\.(?<domain>[a-z]{2,}))\z/i}
end
