class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]
  def index
    @posts = Post.all
    @users = User.all
  end

  def new
    @posts = Post.new
  end

  def create
    @posts = Post.new(user_helper)
    @posts.user_id = current_user.id
    if @posts.save
      redirect_to posts_path
    else
      flash.now.alert = 'Error!'
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    @owner = current_user
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def user_helper
    params.require(:post).permit(:title, :text)
  end
end
