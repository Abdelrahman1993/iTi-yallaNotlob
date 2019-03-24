class UserOrderParticipationController < ApplicationController


  def index
    @orderParticipation = UserOrderParticipation.where(order_id: params[:order_id])
    @addOrder = UserOrderParticipation.new
    @orderInvited = UserOrderInvitation.group(:user_id).where('user_id <> ?', current_user.id).where(order_id: params[:order_id])
    @orderPartic = UserOrderParticipation
                       .where(order_id: params[:order_id])
                       .group(:user_id)
                       .where('user_id <> ?', current_user.id)
    # @addOrder = UserOrderParticipation.new
  end

  def destroy
  @orderItem = UserOrderParticipation.find(params[:id])
  @orderItem.destroy
  # redirect_to orders_user_order_participation_path;
  end
  def deleteUserInvited

  end

  def create
  @addOrder = UserOrderParticipation.new


  @addOrder.user_id = current_user.id
  @addOrder.item = params[:item]
  @addOrder.order_id = params[:order_id]
  @addOrder.price = params[:price]
  @addOrder.amount = params[:amount]
  @addOrder.comment = params[:comment]
  puts @addOrder
  if @addOrder.save
    redirect_to "/orders/" + params[:order_id] + "/orderdata"
  end
end
  private
  def addOrder_params
    params.require(:addOrder).permit(:item,:comment,:price,:amount)
        # .permit(:name,:user_id)
    # params.require(:addOrder).permit(:item,:comment,:price,:amount)
  end


end
