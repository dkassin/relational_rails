class MountainRangesController < ApplicationController
  def index
    @mountain_ranges = MountainRange.all 
  end

  def new
  end

  def create
    mountain_range = MountainRange.new({
      name: params[:mountain_ranges][:name],
      has_ski_resort: params[:mountain_ranges][:has_ski_resort],
      included_states: params[:mountain_ranges][:included_states]
      })

    mountain_range.save

    redirect_to '/mountain_ranges'
  end
end
