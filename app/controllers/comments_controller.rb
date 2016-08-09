class CommentsController < ApplicationController
  before_action :load_post
  before_action :ensure_logged_in, only: [:create, :edit, :destroy]

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.update_attributes(comment_params)
      flash[:notice] = 'The comment has been updated.'
      redirect_to post_path(@post)
    else
      flash[:notice] = 'The comment was not updated successfully.'
      redirect_to post_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def load_post
    @post = Post.find(params[:post_id])
  end
end
