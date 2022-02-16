class RestaurantsController < ApplicationController
  before_action :set_param, only: [ :create ]
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(set_param)
    @restaurant.save
    if @restaurant.save
      redirect_to restaurant_path(@restaurant.id)
    else
      render :new
    end
  end

  private

  def set_param
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
