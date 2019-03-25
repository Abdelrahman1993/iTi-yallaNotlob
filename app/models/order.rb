# frozen_string_literal: true
class Order < ApplicationRecord
  enum status: {
    waiting: 'waiting',
    finished: 'finished'
  }
  has_one_attached :menu
  validates :menu, presence: true, blob: { content_type: :image } 
  validates :resturant, :category, :menu, :user_id, presence: true
end
