class EmployeesController < ApplicationController

    before_action :current_employee, only: [:edit, :update]

    def index 
        @employees = Employee.all 
    end 

    def show 
        @employee = current_employee 
    end 

    def new 
        @employee = Employee.new 
        @dogs = Dog.all 
    end 

    def create 
        @employee = Employee.new(employee_params)
        if @employee.valid? 
            @employee.save 
            redirect_to employee_path(@employee) 
        else 
            flash[:errors] = @employee.errors.full_messages 
            redirect_to new_employee_path  
        end 
    end 

    def edit 
        @employee = current_employee 
        @dogs = Dog.all 
    end 

    def update 
        @employee.update(employee_params)
        if @employee.valid? 
            @employee.save 
            redirect_to employee_path(@employee) 
        else 
            flash[:errors] = @employee.errors.full_messages 
            # redirect_to "/employees/#{@employee.id}/edit"
            redirect_to edit_employee_path(@employee)
        end 
    end 

    def current_employee
        @employee = Employee.find(params[:id]) 
    end 
    
    def employee_params 
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :image_url, :dog_id) 
    end
end
