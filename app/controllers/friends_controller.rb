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
    # if (User.where(email: friend_params[:friend_id]).as_json[0]["id"])
    # @selectedUserId = User.where(email: friend_params[:friend_id]).as_json[0]["id"]
    # else
    #   abort("this is no a user")
    # end
    
    @selectedUserId = User.where(email: friend_params[:friend_id]).as_json[0]["id"]
    
    @allFriends = Friendship.where(user_id: current_user.id).as_json
    # debugger
    # 
    @flag = true
    if current_user.id != @selectedUserId
      @allFriends.each do |friend|
        if friend["friend_id"] == @selectedUserId
          @flag = false
        
        else
          @flag = true
          
        end 
      end
      if @flag
        @friend = Friendship.new(:user_id => current_user.id, :friend_id => @selectedUserId)
      end

    end
    

    
    if @friend.save
      redirect_to user_friends_path(current_user.id)
    end
  end
 
  private
    def friend_params
      params.require(:friendship).permit(:friend_id)
    end

end
