class PagesController < ApplicationController
  def home
    @last_three_conveyings = Conveying.last(3)
  end
end
