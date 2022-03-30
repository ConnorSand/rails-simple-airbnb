class FlatsController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.all
  end

  def show
    # @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.save
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
    # @task = Task.find(params[:id])
  end

  def updated
    # @task = Task.find(params[:id])
    @flat.update(flat_params)
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :edit
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def find_id
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end
