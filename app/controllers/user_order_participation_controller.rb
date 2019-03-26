class UserOrderParticipationController < ApplicationController


  def index
    @orderParticipation = UserOrderParticipation.where(order_id: params[:order_id])
    @order=Order.find(params[:order_id])
    @addOrder = UserOrderParticipation.new
    @orderInvited = UserOrderInvitation.group(:user_id).where('user_id <> ?', current_user.id).where(order_id: params[:order_id])
    @orderPartic = UserOrderParticipation
                       .where(order_id: params[:order_id])
                       .group(:user_id)
                       .where('user_id <> ?', current_user.id)
    @orderImg = Order.find(params[:order_id])

  end

  def destroy
  @orderItem = UserOrderParticipation.find(params[:id])
  @orderItem.destroy
  redirect_to order_user_order_participation_index_path;
  end

  def deleteUserInvited
    @friendInv = UserOrderInvitation.where(user_id: params[:id])
    @friendInv.destroy(params[:orderId])
    redirect_to order_user_order_participation_index_path;
  end

  def create
  @addOrder = UserOrderParticipation.new
  @addOrder.user_id = current_user.id
  @addOrder.item = params[:item]
  @addOrder.order_id = params[:order_id]
  @addOrder.price = params[:price]
  @addOrder.amount = params[:amount]
  @addOrder.comment = params[:comment]
    if @addOrder.save
      redirect_to "/orders/" + params[:order_id] + "/orderdata"
    end
  end

  private
  def addOrder_params
    params.require(:addOrder).permit(:item,:comment,:price,:amount)
  end
end
