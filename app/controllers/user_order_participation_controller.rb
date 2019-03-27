class UserOrderParticipationController < ApplicationController


  def index
    @orderParticipation = UserOrderParticipation.where(order_id: params[:order_id])
    # debugger
    @order=Order.find(params[:order_id])
    @addOrder = UserOrderParticipation.new
    @orderInvited = UserOrderInvitation.where(order_id: params[:order_id])
                      # .where('user_id <> ?',UserOrderParticipation.where(order_id: params[:order_id],))
    # .where('user_id <> ?', current_user.id)
    # .group(:user_id)

    @orderPartic = UserOrderParticipation
                       .where(order_id: params[:order_id])
                       .group(:user_id)
                       # .where('user_id <> ?', current_user.id)
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
    @orderStatus = Order.find(params[:order_id])
    # $ErrorOrder=[]
    if @orderStatus.status == 'waiting'
        @addOrder = UserOrderParticipation.new
        @addOrder.user_id = current_user.id
        @addOrder.item = params[:item]
        @addOrder.order_id = params[:order_id]
        @addOrder.price = params[:price]
        @addOrder.amount = params[:amount]
        @addOrder.comment = params[:comment]

        if !@addOrder.save
          $ErrorOrder =@addOrder.errors.full_messages
        end
    else
      $ErrorOrder ="this order is done 1000 hana w shfa";
    end
    redirect_to order_user_order_participation_index_path;

  end


  private
  def addOrder_params
    params.require(:addOrder).permit(:item,:comment,:price,:amount)
  end
end
