class UserOrderParticipationController < ApplicationController

  def index
    @prevlige = UserOrderInvitation.where(order_id: params[:order_id],user_id: current_user.id);
    @orderOwner = Order.find_by(id: params[:order_id],user_id: current_user.id);

    # if (@orderOwner.nil? || @prevlige.nil?)
    #   puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    # else
    #   redirect_to "/404.html"
    # end

    @orderParticipation = UserOrderParticipation.where(order_id: params[:order_id])
    @order=Order.find(params[:order_id])
    @addOrder = UserOrderParticipation.new
    @orderInvited = UserOrderInvitation.where(order_id: params[:order_id])
    $ErrorOrder="";

    @orderPartic = UserOrderParticipation
                 .where(order_id: params[:order_id])
                 .select(:user_id).distinct
    @orderImg = Order.find(params[:order_id])

    @allNotifications=fun(current_user)[0..4] ;


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
