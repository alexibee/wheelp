class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    # we need `user_id` to associate service with corresponding user?
    @user = current_user
    @service.user = @user
    @service.rating = 1.0
    if @service.save!
      redirect_to service_path(@service)
    else
      render :new
    end
  end

  private

  def service_params
    params.require(:service).permit(:title, :price, :description)
  end
end
