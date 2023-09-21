class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  def increment_post_counter
    user = User.find(author_id)
    user.increment!(:posts_counter)
  end

  def five_recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end
end
