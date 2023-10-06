class PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.where(author_id: @user.id)
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

  def destroy
    @post = Post.find(params[:id])
    @comments = @post.comments
    @likes = @post.likes
    @comments.each(&:destroy)
    @likes.each(&:destroy)
    @post.destroy

    redirect_to user_posts_url(current_user.id), notice: 'Post was successfully destroyed!'
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
