class EmployeesController < ApplicationController
    
    before_action :current_employee, only: [:edit, :update, :show]
    
    def index
        @employees = Employee.all
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
            flash[:errors] = employee.errors.full_messages
            redirect_to new_employee_path
        end
    end

    def edit
        @dogs = Dog.all
    end

    def update
        @employee.assign_attributes(employee_params)
        if @employee.valid?
            @employee.save
            redirect_to @employee
        else
            flash[:errors] = @employee.errors.full_messages
            redirect_to edit_employee_path
        end
    end

    def show
    end

    private
    
    def current_employee
        @employee = Employee.find(params[:id])
    end
    
    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url)
    end
end
