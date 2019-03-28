class UserOrderInvitation < ApplicationRecord
  belongs_to :user
  belongs_to :order
  validates :user_id, presence: true
end
