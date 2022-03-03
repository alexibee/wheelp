class ServicesController < ApplicationController
  def index
    if current_user.expert
      redirect_to dashboard_path
    else
      @search = params["search_location"]
      @search_words = params["search"]
      if @search.present? && @search["location"] != ""
        @services = Service.near(@search["location"], 10)
        if @search_words.present? && @search_words["search_info"] != ""
          @result_words = @services.search_by_bio_title(@search_words["search_info"])
          @services_words = @services - @result_words
          @services = @result_words + @services_words
        end
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
