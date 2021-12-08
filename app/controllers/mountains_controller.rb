class MountainsController < ApplicationController
  def index
    @mountains = Mountain.volcanic_only
  end

  def new
  end

  def show
    @mountain = Mountain.find(params[:id])
  end

  def edit
    @mountain = Mountain.find(params[:id])
  end

  def update
    mountain = Mountain.find(params[:id])
    mountain.update(mountain_params)
    redirect_to "/mountains/#{mountain.id}"
  end

  def destroy
    mountain = Mountain.find(params[:id])
    mountain.destroy

    redirect_to "/mountains"
  end


  private

  def mountain_params
    params.permit(:name, :volcanic, :elevation)
  end

end
