class ConveyingsController < ApplicationController

  def new
    @conveying = Conveying.new
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
    params.require(:conveying).permit(:boat_name, :boat_type, :start_location, :arrival_location, :start_date, :arrival_date, :duration, :price, :capacity, :owner_id, :photo)
  end
end
