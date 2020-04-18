class BookingsController < ApplicationController

  def new
    @venues = Venue.all
  end

  def search
    @venue = Venue.find(params[:venue])
    @seats = Seat.best_seat(params[:seats], @venue)
  end
end
