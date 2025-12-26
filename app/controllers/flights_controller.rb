class FlightsController < ApplicationController
  def index
    @departure_airports = Flight.all.map { |flight| [ flight.departure_airport.airport_code, flight.departure_airport.id ] }
    @arrival_airports = Flight.all.map { |flight| [ flight.arrival_airport.airport_code, flight.arrival_airport.id ] }
    @number_of_passengers = [ [ 1, 1 ], [ 2, 2 ], [ 3, 3 ], [ 4, 4 ] ]
    @departure_dates = Flight.all.map { |flight| [ flight.start_datetime.to_date, flight.start_datetime ] }

    @queried_flights = Flight.where("departure_airport_id = :dai AND arrival_airport_id = :aai AND number_of_passengers = :nop AND start_datetime >= :sd", dai: params[:departure_airport], aai: params[:arrival_airport], nop: params[:number_of_passengers], sd: params[:start_datetime])
  end
end
