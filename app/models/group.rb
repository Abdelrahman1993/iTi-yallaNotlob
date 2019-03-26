class Group < ApplicationRecord
    has_many :users
    validates :name, presence: true
    validates :name, uniqueness: { scope: :user_id } 
end
