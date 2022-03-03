class ServicesController < ApplicationController
  def index
    if current_user.expert
      redirect_to dashboard_path
    else
      @search = params["search"]
      if @search.present? && @search["address"] != ""
        @services = Service.near(@search["address"], 10)
        if @search["search_info"] != "" && !@services.nil?
          @result_words = @services.search_by_bio_title(@search["search_info"])
          @only_locations = @services - @result_words
          @services = @result_words + @only_locations
        elsif @services.nil?
          @services = Service.search_by_bio_title(@search["search_info"])
        end
      elsif @search.present? && @search["address"] == ""
        @services = Service.search_by_bio_title(@search["search_info"])
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
