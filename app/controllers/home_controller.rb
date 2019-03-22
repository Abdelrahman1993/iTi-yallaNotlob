class HomeController < ApplicationController
    def home
        # @orders = Order.all
        # @orders = Order.find(:all, :order => "id desc").
        # @orders = Order.all( :order => "id desc").reverse
        @orders = Order.all.order("id desc")
        # ().order("id desc").limit(4).order("id asc")

        @friends = Friendship.all
        @users = User.all
    end
end
