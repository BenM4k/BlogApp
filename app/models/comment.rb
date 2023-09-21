class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def increment_comments_count
    post = Post.find_by(id: post_id)
    post.increment!(:comments_counter)
  end
end
