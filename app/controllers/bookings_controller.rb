class BookingsController < ApplicationController
  before_action :set_service, only: %i[show new create]
  before_action :set_booking, only: %i[show update]

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
      @message = "You don't have any bookings at this time" if @bookings.nil?
    end
  end

  def show
    @user = current_user
    @review = Review.new
    @marker = {
      lat: @booking.latitude,
      lng: @booking.longitude,
      info_window: render_to_string(partial: "map_info_window", locals: { booking: @booking })
      # image_url: helpers.asset_url("REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS") if we have image
    }
    @chatroom = Chatroom.find(@booking.chatroom.id) if @booking.chatroom
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
      redirect_to dashboard_path(anchor: "booking-#{@booking.id}")
    else
      render :new
    end
  end

  def update
    @booking.state = params[:state]
    if @booking.save && @booking.state == 1
      @chatroom = Chatroom.create(name: "Evaluation request ##{@booking.id}", user_id: current_user.id, booking_id: @booking.id)
      redirect_to dashboard_path(anchor: "request-#{@booking.id}")
    elsif @booking.save && @booking.state == -1
      redirect_to dashboard_path
    else
      flash[:notice] = "We weren't able to do that"
    end
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
                                    :additional_details)
  end
end
