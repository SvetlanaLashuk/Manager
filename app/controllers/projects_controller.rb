class ProjectsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_project, only: [ :show, :edit, :update, :destroy ]

  def index
    @projects = Project.all
  end

  def show; end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, success: 'The project is successfully created'
    else
      render :new, danger: 'The project isn\'t created'
    end
  end

  def edit; end

  def update
    if @project.update_attributes(project_params)
      redirect_to @project, success: 'The project is successfully updated'
    else
      render :edit, danger: 'The project isn\'t updated'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, success: 'The project is successfully deleted'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    #для фильтрации параметров
    # в параметрах обязательно должен присутствовать один из параметров projects, в котором разрешены след поля
    params.require(:project).permit(:name, :summary, :start_date, :end_date)
  end
end