class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    def fun(current_user)


    
    @allInfo = [];
    @keys = [];
    @allNotifications = [];
    @counter=0

    @myInvitaions = UserOrderInvitation.where(user_id: current_user.id)
      @myInvitaions.each do |invitation|
      @key = invitation.order.created_at.to_i;
      @allInfo.push({
      "type" => "inv",
      "name" => invitation.order.user.name,
      "order_id" => invitation.order.id ,
      "category" => invitation.order.category,
      "restaurant" => invitation.order.resturant,
      "key" => @key})
      @keys.push(@key);
    end


    current_user.orders.each do |order|
      order.UserOrderParticipations.each do |participation|
      @key = order.created_at.to_i;
      @allInfo.push({
      "type" => "join",
      "name" => participation.user.name,
      "order_id" => participation.order.id ,
      "key" => @key})
      @keys.push(@key);
      end
    end

    @newkeys = @keys.sort.reverse
    @newkeys.each do |key|
      @allInfo.each do |info|
        if key == info['key']
          @allNotifications.push(info);
        end
      end
    end

return @allNotifications


    end

    protected

         def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation)}
         end

         
end