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

    respond_to do |format|
      if @booking.save
      PassengerMailer.with(booking: @booking).confirmation_email.deliver_later

      format.html { redirect_to @booking, notice: "Flight successfully booked" }
      format.json { render @booking, status: created, location: @booking }

      else
        @number_of_passengers = params[:number_of_passengers].to_i
        @flight = Flight.find(@booking.flight_id)
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def booking_params
    params.expect(booking: [ :flight_id, passengers_attributes: [ [ :flight_id, :name, :email ] ]  ])
    # params.require(:booking).permit(:flight_id, passengers_attributes: [ :name, :email ])
  end
end
