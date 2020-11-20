class PagesController < ApplicationController
  def home
    @last_three_conveyings = Conveying.last(3)
  end

  def dashboard
    @user = current_user
    @conveyings = Conveying.where(user_id: @user.id)
    @bookings = Booking.where(user_id: @user.id)


    @today = Date.today
    @upcoming_conveyings = Conveying.where(user_id: @user.id, booked: true).select { |conveying| conveying.arrival_date > @today }
    # @upcoming_conveyings = Conveying.joins(:bookings).where(conveyings: {user_id: @user.id, booked: true}, "bookings.start_time > #{@today}")
    @pending_conveyings = Conveying.where(user_id: @user.id, booked: false) 
    @past_conveyings_booked = Conveying.where(user_id: @user.id, booked: true).select { |conveying| conveying.bookings[0].end_time < @today }
    @past_conveyings_not_booked = Conveying.where(user_id: @user.id, booked: false).select { |conveying| conveying.arrival_date < @today }
    @past_conveyings = @past_conveyings_booked + @past_conveyings_not_booked
  end
end
