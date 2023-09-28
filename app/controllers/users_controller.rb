class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  def index
    @users = User.all
  end

  def show; end

  private

  def set_user
    @user = User.find(params[:id])
    @posts = Post.where(author_id: @user.id)
  end
end