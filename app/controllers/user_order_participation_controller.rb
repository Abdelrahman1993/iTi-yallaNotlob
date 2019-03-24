class UserOrderParticipationController < ApplicationController


  def index
    @orderParticipation = UserOrderParticipation.where(order_id: params[:order_id])
    @addOrder = UserOrderParticipation.new
    @orderInvited = UserOrderInvitation.group(:user_id).where('user_id <> ?', current_user.id).where(order_id: params[:order_id])
    @orderPartic = UserOrderParticipation
                       .where(order_id: params[:order_id])
                       .group(:user_id)
                       .where('user_id <> ?', current_user.id)
  end

def destroy

  @orderItem = UserOrderParticipation.find(params[:id])
  @orderItem.destroy
  redirect_to order_orderdata_path;
  end

  def create
  @addOrder = UserOrderParticipation.new(addOrder_params)

  @addOrder.user_id=1
  @addOrder.save
  redirect_to orders_path
end
  private
  def addOrder_params
    params.require(:addOrder).permit(:item,:comment,:price,:amount)
  end


end
