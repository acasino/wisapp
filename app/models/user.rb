class User < ActiveRecord::Base
    has_many :userwatches
    has_many :watches, through: :userwatches
    has_many :genres, through: :watches
    has_many :brands, through: :watches
    has_many :offers 
end
