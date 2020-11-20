class BookingsController < ApplicationController

  def index
    @bookings_as_renter = current_user.bookings
  end

# def show
#   @conveying = Conveying.find(params[:conveying_id])
#   @booking = @conveying.booking
# end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @conveying = Conveying.find(params[:conveying_id])
    @booking.conveying = @conveying
    authorize @booking
    if @booking.save
      redirect_to conveying_path(@conveying), notice: "Your booking created !"
    else
      render 'conveyings/show'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to dashboard_path, notice: "You booking was deleted !"
  end

  def accept
    @booking = Booking.find(params[:booking_id])
    authorize @booking
    @booking.update(validated: true)
    @booking.conveying.update(booked: true)
    redirect_to dashboard_path, notice: "Skipper booked!"
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :user_id, :conveying_id)
  end
end
