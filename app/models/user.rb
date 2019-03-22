class User < ApplicationRecord
    has_many :groups
    has_many :orders
    has_many :friendships
    has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
end
