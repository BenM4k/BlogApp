class UsersController < ApplicationController
  before_action :set_user
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(author_id: params[:id])
  end

  private

  def set_user; end
end
