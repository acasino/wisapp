class Offer < ActiveRecord::Base
    belongs_to :user
    has_many :watches, through: :users
    # validates :sender_offer_price, presence: true, numericality: {greater_than: 0}
    # validates :transaction_id, presence: true
    # validates :status, presence: true, inclusion: {in: ["Pending", "Complete", "Accepted", "Rejected"], message: "Must be one of: Pending, Complete, Accepted, Rejected."}
    # validates :sender, presence: true
    # validates :receiver, presence: true
    # validates :wanted, presence: true
    # validate :future_timestamp?

    # def future_timestamp?
    #     if self.timestamp > DateTime.now
    #         self.errors.add :timestamp, "Cannot be in the future."
    #     end
    # end
end
