class PagesController < ApplicationController
  def home
    @last_three_conveyings = Conveying.last(3)
  end

  def dashboard
    @user = current_user
    @conveyings = Conveying.where(user_id: @user.id)
    @bookings = Booking.where(user_id: @user.id)
  end
end
