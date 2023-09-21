require 'rails_helper'

describe Like, type: :model do
  subject { Like.new(user_id: 1, post_id: 3) }
  # replace user_id and post_id with valid user and post ids

  context 'When testing likes' do
    it 'Should increment the likes counter of a post' do
      post = Post.find(subject.post_id)
      likes_counter = post.comments_counter

      subject.increment_likes_count
      updated_post = Post.find(subject.post_id)
      expect(updated_post.likes_counter).to eq(likes_counter + 1)
    end
  end
end
