class Offer < ActiveRecord::Base
    belongs_to :user
    belongs_to :watch

    before_save :default_values
    def default_values
        self.status = 'Pending' if self.status.nil?
    end
    
end
