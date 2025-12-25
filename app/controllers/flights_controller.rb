class FlightsController < ApplicationController
  def index
    @departure_airports = Flight.all.map { |flight| [ flight.departure_airport.airport_code, flight.id ] }
    @arrival_airports = Flight.all.map { |flight| [ flight.arrival_airport.airport_code, flight.id ] }
    @number_of_passengers = [ [ 1, 1 ], [ 2, 2 ], [ 3, 3 ], [ 4, 4 ] ]
    @departure_dates = Flight.all.map { |flight| [ flight.start_datetime.to_date, flight.start_datetime ] }
  end
end
