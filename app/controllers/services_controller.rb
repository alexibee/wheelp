class ServicesController < ApplicationController
  def index
    @search = params["search"]
    if @search.present? && @search["search_info"] != ""
      if current_user.expert


      @result = @search["search_info"]
      @services = Service.search_by_bio(@result)
      # id = current_user.id
      # users_services = Service.where(user_id: id)
      # @services = overall_search - users_services
    else
      @services = Service.all
      id = current_user.id
      if Service.find_by(user_id: id)
        @message = "These are the services you have:"
      else
        @message = "You can add your service to this list by creating a service"
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

  private

  def service_params
    params.require(:service).permit(:title, :price, :bio, :photo, :address)
  end
end
