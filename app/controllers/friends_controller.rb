class FriendsController < ApplicationController
  def index
    @friends = Friendship.all
  end

  def add
  end

  def destroy
    @friend = Friendship.find(params[:id])
      @friend.destroy
    
      redirect_to friends_path
  end
end
