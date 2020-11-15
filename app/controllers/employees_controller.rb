class EmployeesController < ApplicationController
    before_action :set_employee, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource
    
    def index
      @employees = Employee.all
    end
  
    def show
    end
  
    def new
      @employee = Employee.new
    end
  
    def edit
    end
  
    def create
      @employee = Employee.new(employee_params)
  
      respond_to do |format|
        if @employee.save
          format.html { redirect_to @employee, notice: 'Created!' }
          format.json { render :show, status: :created, location: @employee }
        else
          format.html { render :new }
          format.json { render json: @employee.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @employee.update(employee_params)
          format.html { redirect_to @employee, notice: 'Updated!' }
          format.json { render :show, status: :ok, location: @employee }
        else
          format.html { render :edit }
          format.json { render json: @employee.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @employee.destroy
      respond_to do |format|
        format.html { redirect_to employees_url, notice: 'Destroyed!' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_employee
        @employee = Employee.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def employee_params
        params.require(:employee).permit(:name, :document, :type_document, :type_contract)
      end
  end
  