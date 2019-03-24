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
    @user = User.where.not(id: current_user.id)
    @group = Group.where(user_id: current_user.id)
  end

  def create
    @order = Order.new
    @order_invitation = UserOrderInvitation.new
    groups = params[:groups].split(',')
    users = params[:users].split(',')
    
    p "==============================="
    p users
    p groups
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


end
