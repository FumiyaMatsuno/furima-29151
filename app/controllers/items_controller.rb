class ItemsController < ApplicationController
  before_action :move_to_new, except: [:index]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      return redirect_to root_path
    else
      render "new"
    end
  end


  private

  def move_to_new
    redirect_to new_user_session_path unless user_signed_in?
  end


  def item_params
    params.require(:item).permit(:name, :description, :postage_id, :price, :category_id, :sipping_day_id, :condition_id, :prefecture_id, :image, :sold).merge(user_id: current_user.id)
  end
end