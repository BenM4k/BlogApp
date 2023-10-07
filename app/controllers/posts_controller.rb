class PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = @user.posts.includes(:comments)
  end

  def new
    @post = Post.new
  end

  def show; end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to user_post_url(current_user.id, @post.id), notice: 'Post was successfully created!'
    else
      flash.now[:alert] = 'Post could not be created!'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
