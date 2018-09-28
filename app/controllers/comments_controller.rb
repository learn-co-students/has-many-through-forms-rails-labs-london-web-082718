class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    redirect_to comment.post
  end


  def unique_users
    @comment = Comment.find(params[:id])
    unique_users = @comment.users.pluck(:user).uniq
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
