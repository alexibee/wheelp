class ServicesController < ApplicationController
  def index
    if current_user.expert
      redirect_to dashboard_path
    else
      @search = params["service"]
      if @search.present? && @search["address"] != ""
        @services = Service.near(@search["address"], 20)
        @message = "No experts within 20 km of this location" if @services.empty?
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
    @search = params["search"]
    if @search.present? && @search["search_info"] != ""
      @services = Service.search_by_bio_title(@search["search_info"])
      @message = "Search returned no results" if @services.empty?
    else
      @services = Service.all
    end
  #   @services = Service.all
  # elsif @search["address"] != ""

  #         if  "" && !@services.empty?
  #           @result_words = @services.search_by_bio_title(@search["search_info"])
  #           @only_locations = @services - @result_words
  #           @services = @result_words + @only_locations
  #         elsif @services.empty?
  #           @message = "No experts within 20 km of this location"
  #         end
  #       else
  #         @services = Service.search_by_bio_title(@search["search_info"])
  #       end
  #     else
  #       @services = Service.all
  #     end
  #   end
  # end

  end

  private

  def service_params
    params.require(:service).permit(:title, :price, :bio, :photo, :address)
  end
end
