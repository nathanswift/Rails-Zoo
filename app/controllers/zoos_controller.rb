class ZoosController < ApplicationController
  before_action :set_zoo, only: [:show, :update, :edit, :destroy]
    
  def index
    @zoos = Zoo.all
  end

  def show
  end

  def new
    @zoo = Zoo.new
  end

  def edit
  end

  def create
    @zoo = Zoo.new(zoo_params)
    
    if @zoo.save
      redirect_to zoos_path
    else
      render :new
    end
  end

  def update
    if @zoo.update(zoo_params)
      redirect_to @zoo  
    else
      render :edit
    end
  end

  def destroy
    @zoo.destroy
    redirect_to zoos_path  
  end

  private

  def set_zoo
    @zoo = Zoo.find(params[:id])  
  end

  def zoo_params
    params.require(:zoo).permit(:name)  
  end
end
