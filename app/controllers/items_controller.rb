class ItemsController < ApplicationController
  def index 
    
  end


  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      return redirect_to root_path
    else
      render :new
    end
  end

  def show

  end

  private

  def item_params
    params.require(:item).permit(:title, :sub_title, :text, :target_amount, :days, :tag)
  end

end
