class User < ApplicationRecord
  has_many :post
  has_many :like
  has_many :comment

  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  def three_recent_posts
    Post.where(author_id: id).order(created_at: :desc).limit(3)
  end
end
