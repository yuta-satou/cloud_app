class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy]

  
  def index 
    Item.find_each do |item|
      day_count = (item.day_id - Date.today).to_i
      item.update(remaining_days: day_count)
    end
    @items = Item.all
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      if @item.day_id < Date.today
        render :new
      end
      @item.start_amount = 0
      @item.person_num = 0
      @item.remaining_days = (@item.day_id - Date.today).to_i
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

  def show
    @orders = Order.all
    @users = User.all
    @item.remaining_days = (@item.day_id - Date.today).to_i
    @content_truncate = ApplicationController.helpers.strip_tags(@item.content.to_s).gsub(/[\n]/,"").strip.truncate(100)
  end

  def destroy
    if @item.destroy
      return redirect_to root_path
    else
      render :show
    end
  end

  def short_description
    description[0, 9] + '...'
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :sub_title, :content, :target_amount, :start_amount, :day_id, :remaining_days, :tag_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
