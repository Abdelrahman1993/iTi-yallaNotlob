class OrdersController < ApplicationController
    def index

    end
    def show
        @order = Order.find(params[:id])
    end

    private
    def order_params
        params.require(:order).permit(:resturant, :category, :menu, :status, :user_id)
    end
end
