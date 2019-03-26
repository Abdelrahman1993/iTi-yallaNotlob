class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

       
 


         
    has_many :groups
    has_many :orders
    has_many :friends, foreign_key: :user_id,class_name: "Friendship"

    has_many :UserOrderInvitations
    has_many :UserOrderParticipations

    has_many :friendships
    # belongs_to :groups
    # belongs_to :user_groups
    has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"


    def self.new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end
    
    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name   # assuming the user model has a name
        user.image = auth.info.image # assuming the user model has an image
        # user.skip_confirmation!
      end
    end


    # def self.create_from_provider_data(provider_data)
    #   where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
    #     user.email = provider_data.info.email
    #     user.password = Devise.friendly_token[0, 20]
    #     user.skip_confirmation!
    #   end
    # end

    # def self.from_omniauth(auth)
    #   # Either create a User record or update it based on the provider (Google) and the UID   
    #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    #     user.token = auth.credentials.token
    #     user.expires = auth.credentials.expires
    #     user.expires_at = auth.credentials.expires_at
    #     user.refresh_token = auth.credentials.refresh_token
    #   end
    # end
end
