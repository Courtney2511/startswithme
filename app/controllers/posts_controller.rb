class PostsController < ApplicationController
  #Module that lets us delete redundant folders. (Scroll down to "destory" method for more information)
  require 'fileutils'

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.image = params[:file]
    @post.user = current_user
    if @post.save
      redirect_to posts_url
    else
      render :new
    end
    # binding.pry
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
    ## Automatically deletes the folder with the name of the post ID being deleted, in the "/public/uploads/post/image/" directory
    FileUtils.remove_dir "#{Rails.root}/public/uploads/post/image/#{@post.id}", true
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:post, :body, :user_id, :image)
  end
end
