# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id) # this will be replaced by logged in user id
    @joined = UserOrderParticipation
    @invited = UserOrderInvitation
  end

  def new
    @order_invitation = UserOrderInvitation.new
    @order = Order.new
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
    if @order.save
      order_id = @order.id
      groups = params[:groups].split(',')
      groups.each do |group|
        user_groups = UserGroup.select('user_id').where(group_id: group).as_json
        user_groups.each do |user|
          invited_users.push(user['user_id'])
        end
      end
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
      p '=====================:'
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
