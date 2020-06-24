class EmployeesController < ApplicationController
    before_action :current_employee, only: [:show, :edit, :update, :destroy]
    
    def index
        @employees = Employee.all
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
            render 'new'
        end
    end

    def edit
        @dogs = Dog.all
    end

    def update
        # byebug
        @employee.assign_attributes(employee_params)
        if @employee.valid?
            @employee.save
            redirect_to employee_path(@employee)
        else
            render 'edit'
        end
    end

    def destroy
        @employee.destroy
        redirect_to employees_path
    end


    def show
    end

    private

    def employee_params
        params.require(:employee).permit([:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id])
    end

    def current_employee
        @employee = Employee.find(params[:id])
    end

end