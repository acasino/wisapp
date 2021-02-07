class Userwatch < ActiveRecord::Base
    belongs_to :user
    belongs_to :watch 
    validates :user, presence: true
    validates :watch, presence: true
end
