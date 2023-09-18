class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user, counter_cache: true

  def increment_post_counter
    user = User.find(author_id)
    user.increment!(:posts_counter)
  end

  def five_recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end
end
