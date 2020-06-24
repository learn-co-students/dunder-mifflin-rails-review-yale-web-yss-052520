class EmployeesController < ApplicationController
    
    before_action :get_employee, only: [:show, :edit, :update]
    
    def index
        @employees = Employee.all
    end
    
    def show
    end
    
    def new
        @employee = Employee.new
        @dogs = Dog.all
    end
    
    def edit
        @dogs = Dog.all
    end
    
    def create
        @employee = Employee.new
        @employee.assign_attributes(strong_params)
        
        if @employee.valid?
            @employee.save
            redirect_to employee_path(@employee)
        else
            redirect_to new_employee_path
        end
    end
    
    def update
        @employee.assign_attributes(strong_params)
        
        if @employee.valid?
            @employee.save
            redirect_to employee_path(@employee)
        else
            redirect_to edit_employee_path(@employee)
        end
    end
    
    private
    
    def get_employee
        @employee = Employee.find(params[:id])
    end
    
    def strong_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id)
    end
    
end
