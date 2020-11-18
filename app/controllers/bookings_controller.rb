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
  if @booking.save
    redirect_to conveying_path(@conveying), notice: "Booking was created"
  else
    render :new
  end
end

# def edit
#   @booking = Booking.find(params[:conveying_id])
# end

# def update
#   @booking = Booking.find(params[:conveying_id])
#   @booking.update(booking_params)
#   redirect_to booking_path(@booking)
# end

# def destroy
#   @booking = Booking.find(params[:conveying_id])
#   @booking.destroy
#   redirect_to conveying_path(@booking.conveying)
# end

private

def booking_params
  params.require(:booking).permit(:start_time, :end_time, :user_id, :conveying_id)
end

end
