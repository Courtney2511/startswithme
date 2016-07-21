class CommentsController < ApplicationController
  before_action :load_post
  before_action :ensure_logged_in, only: [:create, :destroy]

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post), notice: 'Comment created successfully'
    else
      render 'posts/show'
    end
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end

  def load_post
    @post = Post.find(params[:post_id])
  end
end
