class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_params, only: [:show, :edit, :update]
  def index
    @items = Item.includes(:user).order(id: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

def edit
  if current_user.id != @item.user_id
    redirect_to root_path
  end 
end

def update
  if @item.update(item_params)
    redirect_to item_path(@item.id)
  else
    render :edit
  end
end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :description, :category_id, :condition_id, :ship_cost_id, :prefecture_id, :ship_date_id, :image).merge(user_id: current_user.id)
  end

  def find_params
    @item = Item.find(params[:id])
  end
end
