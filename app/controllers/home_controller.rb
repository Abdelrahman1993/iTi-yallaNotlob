class HomeController < ApplicationController
    def home

        @lastOrder = Order.where(user_id: current_user.id).order("id asc").last(5)

        @orderFriend = Order.where(
            user_id: Friendship.select("friend_id")
            .where(user_id: current_user.id)
        ).order("id asc").last(4)

        @users = User.all

        @allNotifications=fun(current_user)[0..4] ;
    
    end
    
end
