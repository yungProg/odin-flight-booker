class PassengerMailer < ApplicationMailer
  default from: "myfirst@mailer.com"
  def confirmation_email
    @passengers = params[:booking].passengers
    @url = flights_url
    @passengers.each do |passenger|
      @passenger = passenger
      mail(to: passenger.email, subject: "Flight booking confirmation")
    end
  end
  def confirmation_email_console
    @passengers = params[:passengers]
    @url = flights_url
    @passengers.each do |passenger|
      @passenger = passenger
      mail(to: @passenger.email, subject: "Flight booking confirmation")
    end
  end
end
