class User < ApplicationRecord
    has_many :groups
    has_many :orders
    # I have no idea wtf is this
    has_and_belongs_to_many :friendships,
    class_name: "User", 
    join_table:  :friendships, 
    foreign_key: :user_id, 
    association_foreign_key: :friend_user_id
end
