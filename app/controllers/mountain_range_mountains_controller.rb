class MountainRangeMountainsController < ApplicationController
  def index
    @mountain_range = MountainRange.find(params[:id])
    @mountains = @mountain_range.mountains
  end
end
