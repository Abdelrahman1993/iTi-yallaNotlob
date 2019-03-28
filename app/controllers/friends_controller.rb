# frozen_string_literal: true

class FriendsController < ApplicationController
  def index
    @users = User.all
    @friends = Friendship.all
    @friend = Friendship.new
    @allNotifications=fun(current_user)[0..4] ;

  end

  def add; end

  def destroy
    @friend = Friendship.find(params[:id])
    @friend.destroy

    redirect_to friends_path
  end

  def create

    users = params[:users].split(',')
    if !users.empty?
      users.each do |user|
        if user != current_user.id
          @friend = Friendship.new(user_id: current_user.id, friend_id: user)
         
          if(! @friend.save)
            $FriendError=[]
            $FriendError.push( @friend.errors.full_messages[0].to_s);
          end
        end
      end
      else
        $FriendError.push("Email Field is empty")
      end
      redirect_to user_friends_path(current_user.id)

  end

  private

  def friend_params
    params.require(:friendship).permit(:friend_id)
  end
end
