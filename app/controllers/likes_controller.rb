class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = current_user
    new_like = @post.likes.build(user_id: @user.id)

    respond_to do |c|
      new_like.increment_likes_count if new_like.save
      c.html { redirect_to user_post_url(current_user.id, @post.id) }
    end
  end
end
