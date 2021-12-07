class MountainRangesController < ApplicationController
  def index
    @mountain_ranges = MountainRange.sort_range
  end

  def new
  end

  def create
    mountain_range = MountainRange.new({
      name: params[:name],
      has_ski_resort: params[:has_ski_resort],
      included_states: params[:included_states]
      })

    mountain_range.save

    redirect_to '/mountain_ranges'
  end

  def show
    @mountain_range = MountainRange.find(params[:id])
  end

  def edit
    @mountain_range = MountainRange.find(params[:id])
  end
  def update
    mountain_ranges = MountainRange.find(params[:id])
    mountain_ranges.update({
      name: params[:name],
      has_ski_resort: params[:has_ski_resort],
      included_states: params[:included_states]
      })

    mountain_ranges.save
    redirect_to "/mountain_ranges/#{mountain_ranges.id}"
  end

  def destroy
    mountain_range = MountainRange.find(params[:id])
    mountain_range.destroy

    redirect_to "/mountain_ranges"
  end

end
