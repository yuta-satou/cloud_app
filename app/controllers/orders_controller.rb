class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    pay_item
    @order.save
    @item.start_amount = @item.start_amount + @order.price
    @item.save

    return redirect_to root_path
  end

  private

  def order_params
    @item = Item.find(params[:item_id])
    params.require(:order).permit(:price).merge(user_id: current_user.id, item_id: @item.id,token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
