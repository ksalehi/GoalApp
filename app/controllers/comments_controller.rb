class CommentsController < ApplicationController
  def new
    @comment = Comment.new

  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      if @comment.commentable_type == "User"

        redirect_to user_url(@comment.commentable)
      else
        redirect_to goal_url(@comment.commentable)
      end
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
  end
end
