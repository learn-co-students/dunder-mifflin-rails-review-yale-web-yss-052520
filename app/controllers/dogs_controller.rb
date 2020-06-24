class DogsController < ApplicationController

    before_action :get_dog, only: :show

    def index
        @dogs = Dog.all
    end

    def sorted_index
        @dogs = Dog.all.sort_by{|dog| dog.employee_count}.reverse
    end
    
    def show
    end

    private

    def get_dog
        @dog = Dog.find(params[:id])
    end
    
    # def post_params(*args)
    #     params.require(:post).permit(*args)
    # end

end
