class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def index
  end

  def new
  end
end
