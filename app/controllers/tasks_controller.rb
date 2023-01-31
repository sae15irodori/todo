class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end
  
  def edit
    @task = get_id
  end
  
  def update
    task = get_id
    task.update(task_params)
    redirect_to tasks_path
  end
  
  def destroy
    @task = get_id
    @task.destroy
    redirect_to tasks_path
  end
  
  
  private
  
  def task_params
    params.require(:task).permit(:title)
  end
  
  def get_id
    Task.find(params[:id])
  end
end
