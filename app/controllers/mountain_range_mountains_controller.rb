class MountainRangeMountainsController < ApplicationRecord
  def index
    @mountain = Mountain.select(params[:mountain_range_id])
  end 
end
