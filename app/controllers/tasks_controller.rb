class TasksController < ApplicationController
  def index
    @tasks = policy_scope(Task).order(deadline: :desc)
    @task = Task.new
    @comment = Comment.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    authorize @task

    if @task.save
      redirect_to root_path
    else
      @tasks = policy_scope(Task).order(deadline: :desc)
      @comment = Comment.new
      render :index
    end
  end

  def destroy
    @task = Task.find(params[:id])
    authorize @task

    @task.destroy
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :deadline)
  end
end
