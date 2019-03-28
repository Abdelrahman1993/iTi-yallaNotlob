class NotificationsController < ApplicationController
  def index

    @allNotifications=fun(current_user) ;

  end
end

