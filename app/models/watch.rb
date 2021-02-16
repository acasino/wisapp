class Watch < ActiveRecord::Base
    mount_uploader :avatar, AvatarUploader
    has_many :userwatches
    has_many :users, through: :userwatches
    validates :name, presence: true
    validates :description, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 0}
    validates :brand, presence: true
    validates :genre, presence: true
end
