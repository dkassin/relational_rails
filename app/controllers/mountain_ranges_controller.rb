class MountainRangesController < ApplicationController
  def index
    @mountain_ranges = MountainRanges.all
  end

  def new
  end

  def create
    mountain_range = MountainRanges.new({
      name: params[:mountain_ranges][:name],
      has_ski_resort: params[:mountain_ranges][:has_ski_resort],
      included_states: params[:mountain_ranges][:included_states]
      })

    mountain_range.save

    redirect_to '/mountain_ranges'
  end

  def show
    @mountain_range = MountainRanges.find(params[:id])
  end
end
