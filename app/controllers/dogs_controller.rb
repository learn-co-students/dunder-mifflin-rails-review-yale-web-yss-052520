class DogsController < ApplicationController

    def index 
        @dogs = Dog.sort_dogs 
    end 

    def show 
        @dog = current_dog 
    end 

    def current_dog
        Dog.find(params[:id]) 
    end 

    def dog_params 
        params.require(:dog).permit(:age, :name, :breed) 
    end 
end
