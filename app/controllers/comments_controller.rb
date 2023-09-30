class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    post = Post.find(params[:post_id])
    new_comment = post.comments.build(comments_params)
    new_comment.user_id = current_user.id

    respond_to do |c|
      if new_comment.save
        new_comment.increment_comments_count
        c.html { redirect_to user_post_url(current_user.id, post.id) }
      else
        c.html { render 'posts/show' }
      end
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:text)
  end
end
