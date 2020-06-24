class EmployeesController < ApplicationController
    before_action :current_employee, only: [:show]

    def index
        @employees = Employee.all
    end

    def show
        current_employee
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
        # @dog = Dog.new
    end

    def create
        # byebug
        employee = Employee.new(employees_params)
        if employee.valid?
            employee.save
            redirect_to employee_path(employee)
        else
            flash[:errors] = employee.errors.full_messages
            redirect_to "/employees/new"
        end
    end

   private 

    def employees_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :office, :img_url, :title, :dog_id) #strong_params
    end

    
    def current_employee
        @employee = Employee.find(params[:id])
    end
end
