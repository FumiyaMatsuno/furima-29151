class OrdersController < ApplicationController
  before_action :move_to_new
  before_action :sold



  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      @item.update(sold: 1)
      return redirect_to root_path
    else
      render 'index'
    end
  end


  private

  def order_params
    @item = Item.find(params[:item_id])
    params.require(:order).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency:'jpy'
    )
  end

  def move_to_new
    redirect_to new_user_session_path unless user_signed_in?
  end

  def sold
    @item = Item.find(params[:item_id])
    redirect_to root_path  if (current_user.id == @item.user_id) || (@item.sold == true )
  end

end
