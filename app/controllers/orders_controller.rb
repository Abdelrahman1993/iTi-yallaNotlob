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
      @orderInvited = UserOrderInvitation.group(:user_id).where('user_id <> ?', current_user.id).where(order_id: 1)
      @orderPartic = UserOrderParticipation
                   .where(order_id: 1)
                   .group(:user_id)
                   .where('user_id <> ?', current_user.id)



    end



    def destroy

      @orderItem = UserOrderParticipation.find(params[:id])
      @orderItem.destroy
      redirect_to orders_path, id:params[:order_id]
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


    #
    def invitOrder_params
      params.require(:orderInvited).permit(:id)
    end

end
