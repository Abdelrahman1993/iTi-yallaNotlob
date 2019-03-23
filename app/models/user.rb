class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :groups 
    has_many :orders
    has_many :friendships
    has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
end
