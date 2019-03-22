class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :groups
    has_many :orders
    has_many :friends, foreign_key: :friend_id,class_name: "UserFriend"

end
