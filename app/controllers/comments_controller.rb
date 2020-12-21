class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.task_id = params[:task_id]
    if @comment.save
      redirect_to root_path
    else
      render "tasks#index"
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
