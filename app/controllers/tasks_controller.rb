class TasksController < ApplicationController
  def index
    @tasks_by_deadlines = policy_scope(Task).order(deadline: :asc)
    @tasks_by_priorities = policy_scope(Task).order(priority: :desc)
    @tasks_counter = @tasks_by_priorities.count

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
      @tasks_by_deadlines = policy_scope(Task).order(deadline: :asc)
      @tasks_by_priorities = policy_scope(Task).order(priority: :asc)
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
