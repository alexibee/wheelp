class ReviewsController < ApplicationController
  def create
    @user = current_user
    @booking = Booking.find(params[:booking_id])
    @service = @booking.service
    @review = Review.new(review_params)
    @review.user_id = @user.id
    @review.booking_id = @booking.id
    if @review.save
      redirect_to service_booking_path(@service, @booking)
    else
      render 'bookings/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
