class User < ApplicationRecord
  has_many :post
  has_many :like
  has_many :comment

  def three_recent_posts
    Post.where(author_id: id).order(created_at: :desc).limit(3)
  end
end
