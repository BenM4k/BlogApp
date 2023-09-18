class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true
  belongs_to :author class_name: 'User'

  def increment_comments_count
    post = Post.find_by(id: post_id)
    post.increment!(:comments_counter)
  end
end
