class EmployeesController < ApplicationController
    before_action :find_employee, only: [:show, :edit, :update]
    
    def show 
    end

    def index 
        @employees = Employee.all
    end

    def edit
        @dogs = Dog.all
    end
    
    def update 
        @employee.update(employee_params)

        if @employee.valid?
            redirect_to @employee
        else
            redirect_to "/employees/edit"
        end
    end
    
    def new 
        @employee = Employee.new
        @dogs = Dog.all
    end

    def create

        employee = Employee.new(employee_params)
    
        if employee.valid?
            employee.save
            redirect_to employee
        else
            @dogs = Dog.all
            @employee = employee
            # byebug 
            # redirect_to "/employees/new"
            render "/employees/new"
        end
    end

    private
        # redirect_to @employee
    def find_employee
        @employee = Employee.find(params[:id])
    end

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end
end








