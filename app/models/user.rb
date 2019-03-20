class User < ApplicationRecord
    has_many :groups
    has_many :orders
    has_many :friends, foreign_key: :friend_id,class_name: "UserFriend"

end
