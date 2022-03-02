class EvaluationsController < ApplicationController
  def new
    find_booking
    @evaluation = Evaluation.new
  end

  def create
    find_booking
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.user = current_user
    @evaluation.booking = @booking
    if @evaluation.save
      redirect_to booking_evaluation_path(@booking, @evaluation)
    else
      render :new
    end
  end

  def show
    @user = current_user
    @evaluation = Evaluation.find(params[:id])
  end

  def find_booking
    @booking = Booking.find(params[:booking_id])
  end

  private

  def evaluation_params
    params.require(:evaluation).permit(:comment)
  end

end
