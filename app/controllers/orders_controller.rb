# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id).paginate(:page => params[:page], :per_page => 8) # this will be replaced by logged in user id
    p @orders
    @joined = UserOrderParticipation
    @invited = UserOrderInvitation

    @allNotifications=fun(current_user)[0..4] ;
  end

  def new
    @order_invitation = UserOrderInvitation.new
    @order = Order.new

    @allNotifications=fun(current_user)[0..4] ;

  end

  def create
    @order = Order.new
    @order.resturant = params[:restaurantName]
    @order.category = params[:category]
    @order.status = 'waiting'
    @order.user_id = current_user.id
    invited_users = []
    suppress(Exception) do
      @order.menu = params[:order][:menu]
    end
    if (! (params[:users].empty?))
    if @order.save
      order_id = @order.id
      users = params[:users].split(',')
      users.each do |user|
        invited_users.push(user.to_i)
      end
      invited_users.uniq!
      invited_users.each do |user|
        invited_user = UserOrderInvitation.new
        invited_user.order_id = order_id
        invited_user.user_id = user
        invited_user.save
      end
      redirect_to orders_path
      # end
    else
      render :new
    end
  else
    $OrderError="Please insert some friends"
    redirect_to new_order_path
  end
  end

  def destroy
    @orderItem = UserOrderParticipation.find(params[:id])
    @orderItem.destroy
    redirect_to orders_path
    end

  def update
    @order = Order.find params[:id]
    @order.update(status: 'finished')
    redirect_to orders_path
  end

  def show
    # params.require(:order).permit(:resturant, :category, :menu, :status, :user_id)
    # @order = Order.find(params[:id])
    @order = UserOrderParticipation.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
    end

  def update
    @order = Order.find params[:id]
    @order.update(status: 'finished')
    redirect_to orders_path
    end
  private

  def invitOrder_params
    params.require(:orderInvited).permit(:id)
  end
end
