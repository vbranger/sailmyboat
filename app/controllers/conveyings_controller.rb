class ConveyingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]

  def index
    @conveyings = policy_scope(Conveying).order(created_at: :desc)
    # the `geocoded` scope filters only conveyings with coordinates (latitude & longitude)
    @markers = @conveyings.geocoded.map do |conveying|
      {
        lat: conveying.latitude,
        lng: conveying.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { conveying: conveying })
      }
    end
  end

  def show
    @conveying = Conveying.find(params[:id])
    authorize @conveying
    @booking = Booking.new
    if @conveying.geocoded?
      @marker = {
          lat: @conveying.latitude,
          lng: @conveying.longitude
        }
    end
  end

  def new
    @conveying = Conveying.new
    authorize @conveying
  end

  def create
    @conveying = Conveying.new(conveying_params)
    @conveying.user = current_user
    authorize @conveying

    if @conveying.save
      redirect_to @conveying, notice: "Conveying was created"
    else
      render :new
    end
  end

  def edit
    @conveying = Conveying.find(params[:id])
    authorize @conveying
  end

  def update
    @conveying = Conveying.find(params[:id])
    authorize @conveying
    @conveying.update(conveying_params)
    redirect_to @conveying, notice: "Conveying was updated"
  end

  def destroy
    @conveying = Conveying.find(params[:id])
    authorize @conveying
    @conveying.destroy
    redirect_to dashboard_path, notice: "Conveying was deleted"
  end

  private

  def conveying_params
    params.require(:conveying).permit(:boat_name, :boat_type, :start_location, :arrival_location, :start_date, :arrival_date, :duration, :price, :capacity, :owner_id, photos: [])
  end
end
