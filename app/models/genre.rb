# class Genre < ActiveRecord::Base
#     has_many :watches
#     has_many :brands, through: :watches 
#     has_many :users, through: :watches
#     validates :name, presence: true, uniqueness: true
# end
