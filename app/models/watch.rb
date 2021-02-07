class Watch < ActiveRecord::Base
    has_many :userwatches
    has_many :users, through: :userwatches
    belongs_to :genre 
    belongs_to :brand
end
