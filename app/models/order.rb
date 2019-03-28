# frozen_string_literal: true
class Order < ApplicationRecord
  enum status: {
    waiting: 'waiting',
    finished: 'finished'
  }
  has_one_attached :menu
  validates :menu, presence: true, blob: { content_type: :image } 
  validates :resturant, :category, :user_id, presence: true

  belongs_to :user
  has_many :UserOrderInvitations ,dependent: :delete_all
  has_many :UserOrderParticipations , dependent: :delete_all
  self.per_page = 10
  WillPaginate.per_page = 10

end
