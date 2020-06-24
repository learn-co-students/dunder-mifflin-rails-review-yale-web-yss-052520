class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end


    def new
        @employee = Employee.new()  
        @dogs = Dog.all
    end

    def create

        # byebug
        employee = Employee.new(employee_params)
        @dogs = Dog.all
        # byebug

        if employee.valid?
            employee.save
            # redirect_to "/employees/#{employee.id}"
            redirect_to employee_path(employee)
        else
            flash[:errors] = employee.errors.full_messages
            redirect_to "employees/new"
        end
    end

    def edit
        @employee = Employee.find(params[:id])
        @dogs = Dog.all
    end

    def update
        @employee = Employee.find(params[:id])
        @employee.update(employee_params)
        redirect_to employee_path(@employee)        
    end

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :title, :alias, :office, :img_url, :dog_id)
    end

end
