class ServicesController < ApplicationController
  def index
    if current_user.expert
      redirect_to dashboard_path
    else
      @search = params["search"]
      if @search.present? && @search["search_info"] != ""
        @result = @search["search_info"]
        @services = Service.search_by_bio_and_title(@result)
      else
        @services = Service.all
      end
    end
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
    if @service.save
      redirect_to service_path(@service)
    else
      render :new
    end
  end

  def wheelpers
    @services = Service.all
  end

  private

  def service_params
    params.require(:service).permit(:title, :price, :bio, :photo, :address)
  end
end
