class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :groups , dependent: :destroy
    has_many :orders
    has_many :friendships
    # belongs_to :groups
    belongs_to :user_groups
    has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
end
