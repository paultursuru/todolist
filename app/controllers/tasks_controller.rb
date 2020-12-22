class TasksController < ApplicationController
  before_action :set_task, except: [:index, :create]
  def index
    @tasks = policy_scope(Task)
    @tasks_by_deadlines = @tasks.order(deadline: :asc)
    @tasks_by_priorities = @tasks.order(priority: :desc)

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

  def update
    authorize @task
    @task.update(task_params)
    if @task.save
      redirect_to root_path
    else
      @tasks_by_deadlines = policy_scope(Task).order(deadline: :asc)
      @tasks_by_priorities = policy_scope(Task).order(priority: :asc)
      @comment = Comment.new
      render :index
    end
  end

  def mark_as_done
    authorize @task
    @task.done!
    redirect_to root_path
  end

  def mark_as_cancelled
    authorize @task
    @task.cancelled!
    redirect_to root_path
  end

  def mark_as_todo
    authorize @task
    @task.todo!
    redirect_to root_path
  end

  def mark_as_very_urgent
    authorize @task
    @task.very_urgent!
    redirect_to root_path
  end

  def mark_as_urgent
    authorize @task
    @task.urgent!
    redirect_to root_path
  end

  def mark_as_normal
    authorize @task
    @task.normal!
    redirect_to root_path
  end


  def destroy
    authorize @task

    @task.destroy
    redirect_to root_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :deadline)
  end
end
