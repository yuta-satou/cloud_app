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
    pay_item
    if @order.valid?
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

  def item_count
    @item = Item.find(params[:item_id])
    @item.start_amount = @item.start_amount + @order.price
    orders = Order.all
    # @item.person_num += 1
    
    orders.each do |order|
      if order.user_id == @order.user_id
        @item.person_num += 1
      end
    end
    @item.save
  end


end
