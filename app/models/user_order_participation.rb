class UserOrderParticipation < ApplicationRecord
  belongs_to :user
  belongs_to :order

  validates :item, :price, :amount, presence: true
  validates :item, format: { with: /\A[a-zA-Z0-9]+\z/,
                                    message: "pleas : no special characters " }
  validates_inclusion_of :price, :in => 3..99
  validates_inclusion_of :amount, :in => 1..100
  validates :amount, numericality: { only_integer: true }
end
