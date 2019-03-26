# frozen_string_literal: true

class FriendsController < ApplicationController
  def index
    @users = User.all
    @friends = Friendship.all
    @friend = Friendship.new
  end

  def add; end

  def destroy
    @friend = Friendship.find(params[:id])
    @friend.destroy

    redirect_to friends_path
  end

  def create
    # if (User.where(email: friend_params[:friend_id]).as_json[0]["id"])
    # @selectedUserId = User.where(email: friend_params[:friend_id]).as_json[0]["id"]
    # else
    #   abort("this is no a user")
    # end

    users = params[:users].split(',')
    unless users.empty?
      users.each do |user|
        if user != current_user.id
          @friend = Friendship.new(user_id: current_user.id, friend_id: user)
          @friend.save
        end
      end
      redirect_to user_friends_path(current_user.id) if @friend.save
      # @selectedUserId = User.where(email: friend_params[:friend_id]).as_json[0]['id']

      # @allFriends = Friendship.where(user_id: current_user.id).as_json
      # debugger
      #
      # @flag = true
      # if current_user.id != @selectedUserId
      #   @allFriends.each do |friend|
      #     if friend["friend_id"] == @selectedUserId
      #       @flag = false

      #     else
      #       @flag = true

      #     end
      #   end
      #   if @flag
      #     @friend = Friendship.new(:user_id => current_user.id, :friend_id => @selectedUserId)
      #   end

      # end

      redirect_to user_friends_path(current_user.id) if @friend.save
      end
  end

  private

  def friend_params
    params.require(:friendship).permit(:friend_id)
  end
end
