class Group < ApplicationRecord
    belongs_to :user
    validates :name, presence: true
    validates :name, uniqueness: { scope: :user_id } 
end
