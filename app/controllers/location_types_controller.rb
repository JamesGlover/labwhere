class LocationTypesController < ApplicationController

  before_action :location_types, only: [:index]
  before_action :set_location_type, except: [:index, :new, :create]

  def index
  end

  def new
    @location_type = LocationType.new
  end

  def create
    @location_type = LocationType.new(location_type_params)
    if @location_type.save
      redirect_to location_types_path, notice: "Location type successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @location_type.update_attributes(location_type_params)
      redirect_to location_types_path, notice: "Location type successfully updated"
    else
      render :edit
    end
  end

  def show
    @location_type = current_resource
  end

  def destroy
    notice = @location_type.destroy ? "Location type successfully deleted" : "Unable to delete Location type"
    redirect_to location_types_path, notice: notice
  end

protected

  def location_types
    @location_type ||= LocationType.ordered
  end

  helper_method :location_types

private

  def set_location_type
    @location_type = current_resource
  end

  def current_resource
    @current_resource ||= LocationType.find(params[:id]) if params[:id]
  end

  def location_type_params
    params.require(:location_type).permit(:name)
  end

end
