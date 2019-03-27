class Group < ApplicationRecord
    belongs_to :user
    has_many :users , dependent: :delete_all
    validates :name, presence: true
    validates :name, uniqueness: { scope: :user_id } 
end
