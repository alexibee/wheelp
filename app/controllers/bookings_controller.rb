class BookingsController < ApplicationController
  before_action :set_service, only: %i[show new create]
  before_action :set_booking, only: %i[show edit update]

  def index
    @user = current_user
    if @user.expert
      @service = Service.find_by(user_id: @user.id)
      if @service.nil?
        @message = "Please create your services profile to receive bookings"
      else
        @bookings = @service.bookings
      end
    else
      @bookings = Booking.where(user_id: @user.id)
      if @bookings.nil?
        @message = "You don't have any bookings at this time"
      end
    end
  end

  def show
    @user = current_user
    @review = Review.new
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

  def update
    @booking.update(booking_params)
  end

  private

  def set_service
    @service = Service.find(params[:service_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date,
                                    :vehicle_brand,
                                    :vehicle_address,
                                    :vehicle_model,
                                    :vehicle_year,
                                    :vehicle_contact,
                                    :vehicle_url,
                                    :additional_details,
                                    :state)
  end
end
