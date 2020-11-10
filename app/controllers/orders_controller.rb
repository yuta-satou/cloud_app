class OrdersController < ApplicationController

  def new
    if user_signed_in?
      @order = Order.new
      @item = Item.find(params[:item_id])
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @order = Order.new(order_params)
    price_id = params[:price_id]
    @order.price = price_id
    if @order.valid?
      pay_item
      @order.save
      item_count
      return redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    @item = Item.find(params[:item_id])
    params.require(:order).permit(:price).merge(user_id: current_user.id, item_id: @item.id, token: params[:token], price_id: params[:price_id])

  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @order.price,
      card: order_params[:token], 
      currency: 'jpy' 
    )
  end

  def item_count
    @item = Item.find(params[:item_id])
    @item.start_amount = @item.start_amount + @order.price
    @item.person_num += 1
    @item.save
  end

end
