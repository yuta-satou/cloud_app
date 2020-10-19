class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    @item.target_amount = @item.target_amount + @order.price
    @item.save
    return redirect_to root_path
  end

  private

  def order_params
    @item = Item.find(params[:item_id])
    params.require(:order).permit(:price).merge(user_id: current_user.id, item_id: @item.id)
  end

end
