class ItemsController < ApplicationController
  def index 
    @items = Item.all
    @item = Item.find(3)
  end

  def new
    @item = Item.new
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

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :sub_title, :content, :target_amount, :start_amount, :day_id, :tag_id)
  end

end
