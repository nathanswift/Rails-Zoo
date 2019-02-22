class AnimalsController < ApplicationController
  before_action :set_zoo
  before_action :set_animal, only: [:show, :edit, :update, :destroy]
  
  def index
    @animals = @zoo.animals
  end

  def show
  end

  def new
    @animal = @zoo.animals.new
  end

  def edit
  end

  def create
    @animal = @zoo.animals.new(animal_params)
    
    if @animal.save
      redirect_to [@zoo, @animal]
    else
      render :new
    end
  end

  def update
    @animal.update(animal_params)
    redirect_to [@zoo, @animal]  
  else
    render :edit
  end

  def destroy
    @animal.destroy
    redirect_to zoo_animals_path  
  end

  private

  def set_zoo
    @zoo = Zoo.find(params[:zoo_id])  
  end

  def set_animal
    @animal = Animal.find(params[:id])  
  end

  def animal_params
    params.require(:animal).permit(:name, :species, :age)  
  end
end
