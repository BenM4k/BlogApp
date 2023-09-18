class Like < ApplicationRecord
  belongs_to :post, counter_cache: true

  def increment_comments_count
    post = Post.find_by(id: post_id)
    post.increment!(:comments_counter)
  end
end
