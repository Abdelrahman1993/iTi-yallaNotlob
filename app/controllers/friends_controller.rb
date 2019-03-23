class FriendsController < ApplicationController
  def index
    @users = User.all
    @friends = Friendship.all
    @friend = Friendship.new

  end

  def add
  end

  def destroy
    @friend = Friendship.find(params[:id])
      @friend.destroy
    
      redirect_to friends_path
  end

  def create
    @friend = Friendship.new(friend_params)
    @friend.user_id = current_user.id
    # @users = User.find(current_user)
    # @friend = @user.friends.build(friend_params)
    # @friend.user_id = current_user.id
    if @friend.save
      redirect_to user_friends_path(current_user.id)
    end
  end
 
  private
    def friend_params
      params.require(:friendship).permit(:friend_id)
    end

end
