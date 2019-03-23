# frozen_string_literal: true

  class OrdersController < ApplicationController
    def index
      @orders = Order.where(user_id: current_user.id) # this will be replaced by logged in user id
      @joined = UserOrderParticipation
      @invited = UserOrderInvitation

    end

    def show
      @orderParticipation = UserOrderParticipation.where(order_id: params[:id])
      @addOrder = UserOrderParticipation.new


    end

    def create
      @addOrder = UserOrderParticipation.new(addOrder_params)

      @addOrder.user_id=1
      @addOrder.save
      redirect_to orders_path
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

  def order_params
    params.require(:order).permit(:resturant, :category, :menu, :status, :user_id)
    @orders = Order.where(user_id: 3) # this will be replaced by logged in user id
    @joined = UserOrderParticipation
    @invited = UserOrderInvitation
  end

    def addOrder_params
      params.require(:addOrder).permit(:item,:comment,:price,:amount)
    end

end
