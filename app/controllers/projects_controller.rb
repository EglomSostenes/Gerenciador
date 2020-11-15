class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource
    
    def index
      @q = Project.ransack(params[:q])
      @projects = filter_collection(@q)
    end
  
    def show
    end
  
    def new
      @project = Project.new
    end
  
    def edit
    end
  
    def create
      @project = Project.new(project_params)
  
      respond_to do |format|
        if @project.save
          format.html { redirect_to @project, notice: 'Created!' }
          format.json { render :show, status: :created, location: @project }
        else
          format.html { render :new }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @project.update(project_params)
          format.html { redirect_to @project, notice: 'Updated!' }
          format.json { render :show, status: :ok, location: @project }
        else
          format.html { render :edit }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @project.destroy
      respond_to do |format|
        format.html { redirect_to projects_url, notice: 'Destroyed!' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_project
        @project = Project.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def project_params
        params.require(:project).permit(:name, :justification, :goals, :cost, :alliance_id)
      end

      def filter_collection(projects)
        projects.result.includes(:alliance, :alliance)
      end
  end
  