class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_url
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])

    if current_user
      @comment = @post.comments.build
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = 'The post has been updated'
      redirect_to post_path
    else
      flash[:notice] = 'The post was not updated successfully.'
      redirect_to post_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:post, :body, :user_id)
  end
end
