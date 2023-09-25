class PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.where(author_id: @user.id)
  end

  def show; end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
