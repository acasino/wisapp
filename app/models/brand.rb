class Brand < ActiveRecord::Base
    has_many :watches 
    has_many :genres, through: :watches
    has_many :users, through: :watches
    validates :name, presence: true, uniqueness: true
end
