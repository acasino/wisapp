class Watch < ActiveRecord::Base
    has_many :userwatches
    has_many :users, through: :userwatches
    belongs_to :genre 
    belongs_to :brand
    validates :name, presence: true
    validates :description, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 0}
    validates :brand, presence: true
    validates :genre, presence: true
    validates :owner, presence: true
end
