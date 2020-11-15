class CompaniesController < ApplicationController
    before_action :set_company, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource
    
    def index
      @companies = Company.all
    end
  
    def show
    end
  
    def new
      @company = Company.new
    end
  
    def edit
    end
  
    def create
      @company = Company.new(company_params)
  
      respond_to do |format|
        if @company.save
          format.html { redirect_to @company, notice: 'Created!' }
          format.json { render :show, status: :created, location: @company }
        else
          format.html { render :new }
          format.json { render json: @company.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @company.update(company_params)
          format.html { redirect_to @company, notice: 'Updated!' }
          format.json { render :show, status: :ok, location: @company }
        else
          format.html { render :edit }
          format.json { render json: @company.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @company.destroy
      respond_to do |format|
        format.html { redirect_to companies_url, notice: 'Destroyed!' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_company
        @company = Company.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def company_params
        params.require(:company).permit(:name, :document, :type_document, :cnae)
      end
  end
  