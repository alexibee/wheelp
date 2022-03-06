class EvaluationsController < ApplicationController
  before_action :find_booking, only: %i[new create]

  def new
    @evaluation = Evaluation.new
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.user = current_user
    @evaluation.booking = @booking
    if @evaluation.save
      redirect_to service_booking_path(@booking)
    else
      render :new
    end
  end

  def show
    @user = current_user
    @evaluation = Evaluation.find(params[:id])
  end

  private

  def find_booking
    @booking = Booking.find(params[:booking_id])
  end

  def evaluation_params
    params.require(:evaluation).permit(:photo, :video, :document, :comment)
  end
end
