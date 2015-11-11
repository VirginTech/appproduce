class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :show]
  
  def show
    @user = current_user
    @comments = @user.comments
  end
  
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "コメントが投稿されました！!"
      redirect_to current_user
    else
      render 'top_pages/top'
    end
  end
  
  def destroy
    
  end
  
  private
  def comment_params
    params.require(:comment).permit(:product_id,:comment)
  end
  
end
