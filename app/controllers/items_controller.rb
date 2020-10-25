class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  def index 
    @items = Item.all
    @item = Item.find(1)
  end

  def new
    if user_signed_in?
      @item = Item.new
      value = Item.find(1)
      # サンプル本文を出力する
      @item.content = value.content
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    @item.start_amount = 0
    if @item.valid?
      @item.save
      return redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      return redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :sub_title, :content, :target_amount, :start_amount, :day_id, :tag_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
