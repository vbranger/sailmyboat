class ConveyingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]
  def index
    @conveyings = policy_scope(Conveying).order(created_at: :desc)
  end

  def show
    @conveying = Conveying.find(params[:id])
    authorize @conveying
  end

  def new
    @conveying = Conveying.new
    authorize @conveying
  end

  def create
    @conveying = Conveying.new(conveying_params)
    if @conveying.save!
      redirect_to @conveying, notice: "Conveying was created"
    else
      render :new
    end
  end

  private

  def conveying_params
    params.require(:conveying).permit(:boat_name, :boat_type, :start_location, :arrival_location, :start_date, :arrival_date, :duration, :price, :capacity, :owner_id, photos: [])
  end
end
