class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to :index
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :description, :category_id, :condition_id, :ship_cost_id, :prefecture_id, :ship_date_id).merge(user_id: current_user)
  end

end
