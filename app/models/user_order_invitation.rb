class UserOrderInvitation < ApplicationRecord
  belongs_to :users
  belongs_to :order
end
