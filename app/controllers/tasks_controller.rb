class TasksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]

  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, success: 'The task is successfully created'
    else
      render :new, danger: 'The task isn\'t created'
    end
  end

  def edit; end

  def update
    if @task.update_attributes(task_params)
      redirect_to @task, success: 'The task is successfully updated'
    else
      render :edit, danger: 'The task isn\'t updated'
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, success: 'The task is successfully deleted'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status, :project_id, :user_id)
  end
end