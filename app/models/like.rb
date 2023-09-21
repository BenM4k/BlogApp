class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def increment_likes_count
    post = Post.find_by(id: post_id)
    post.increment!(:likes_counter)
  end
end
