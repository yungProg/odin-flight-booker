class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flights.first
    @passengers = @booking.passengers
  end
  def new
    @booking = Booking.new(flight_id: params[:flight_id])
    @number_of_passengers = params[:number_of_passengers].to_i

    @flight = Flight.find(params[:flight_id])
    @number_of_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)


    if @booking.save
      redirect_to @booking
    else
      @number_of_passengers = params[:number_of_passengers].to_i
      @flight = Flight.find(@booking.flight_id)
      render :new
      # puts "+++++++++++++++++++++++"
      # puts @booking.flight_id
    end
  end

  def booking_params
    params.expect(booking: [ :flight_id, passengers_attributes: [ [ :flight_id, :name, :email ] ]  ])
    # params.require(:booking).permit(:flight_id, passengers_attributes: [ :name, :email ])
  end
end
