class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path
    else
      render "tasks#index"
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :deadline)
  end
end
