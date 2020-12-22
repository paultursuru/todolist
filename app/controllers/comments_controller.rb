class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    authorize @comment
    @comment.task_id = params[:task_id]
    if @comment.save
      redirect_to root_path
    else
      @tasks_by_deadlines = policy_scope(Task).order(deadline: :asc)
      @tasks_by_priorities = policy_scope(Task).order(priority: :desc)
      @task = Task.new
      render "tasks/index"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment

    @comment.destroy
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
