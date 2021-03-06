class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_params_user_confirm

  def index
    if Purchase.exists?(item_id: params[:item_id])
      redirect_to root_path
    end
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else  
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :address_line, :building, :telephone).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def find_params_user_confirm
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
