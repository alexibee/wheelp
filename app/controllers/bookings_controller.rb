class BookingsController < ApplicationController
  before_action :set_service, only: %i[show new create]

  def index
    @user = current_user
    if @user.expert
      @service = Service.find_by(user_id: @user.id)
      @bookings = @service.bookings
    else
      @bookings = Booking.where(user_id: @user.id)
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @user = current_user
    @booking = Booking.new
  end

  def create
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.user_id = @user.id
    @booking.service_id = @service.id
    if @booking.save
      redirect_to service_booking_path(@service, @booking)
    else
      render :new
    end
  end

  private

  def set_service
    @service = Service.find(params[:service_id])
  end

  def booking_params
    params.require(:booking).permit(:date, :vehicle_address)
  end
end
