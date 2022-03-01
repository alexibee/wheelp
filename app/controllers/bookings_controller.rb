class BookingsController < ApplicationController
  def new
    @user = current_user
    @service = Service.find(params[:service_id])
    @booking = Booking.new
  end

  def create
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :vehicle_address)
  end
end
