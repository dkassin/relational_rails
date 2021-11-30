class MountainsController < ApplicationController
  def index
    @mountains = Mountain.all
  end

  def new
  end

  def create
    mountain = Mountain.new({
      name: params[:mountains][:name],
      volcanic: params[:mountains][:volcanic],
      elevation: params[:mountains][:elevation]
      })

    mountain.save

    redirect_to '/mountains'
  end

  def show
    @mountain = Mountain.find(params[:id])
  end

end
