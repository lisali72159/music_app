class BandsController < ApplicationController

  def new
    @band = Band.new
    render :new
  end

  def index
    @bands = Band.all
  end

  def create
    # debugger
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)

    else
      flash.now[:errors] = "Enter a valid band."
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def show
    @band = Band.find(params[:id])
  end

  def update
    
    band = Band.find(params[:id])
    band.update(band_params)
  end

  def destroy
    @band = Band.find(params[:id])
    if @band
      band.destroy
    else 
      flash.now[:errors] = "Oh no! Band not found!"
    end
  end

  private
  
  def band_params
    params.require(:band).permit(:name)
  end

  
end
