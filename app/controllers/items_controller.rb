class ItemsController < ApplicationController
  before_action :move_to_new, except: [:index, :create, :show]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.user_id == current_user.id
      return redirect_to item_path(@item.id)
    end
  end

  private

  def move_to_new
    redirect_to new_user_session_path unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:name, :description, :postage_id, :price, :category_id, :sipping_day_id, :condition_id, :prefecture_id, :image, :sold).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
