class MountainRangeMountainsController < ApplicationController
  def index
    @mountain_range = MountainRange.find(params[:id])
    @mountains = @mountain_range.mountains
    if params[:sort]
      @mountains = @mountains.sorted
    elsif params[:elevation_count].present?
      @mountains = @mountains.elevation_threshold(params[:elevation_count])
    else
      @mountains
    end
  end

  def new
    @mountain_range = MountainRange.find(params[:id])
  end

  def create
    @mountain_range = MountainRange.find(params[:id])
    mountain = Mountain.new({
      name: params[:name],
      volcanic: params[:volcanic],
      elevation: params[:elevation],
      mountain_range_id: @mountain_range.id
      })

    mountain.save
    redirect_to "/mountain_ranges/#{@mountain_range.id}/mountains"
  end
end
