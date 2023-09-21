require 'rails_helper'

describe Like, type: :model do
  context 'When testing Likes' do
    it 'Should increment the likes counter of a post' do
      user = User.create(name: 'Tester', posts_counter: 0)
      post = Post.create(title: 'Test', likes_counter: 0, comments_counter: 0, author_id: user.id)
      like = Like.create(user_id: user.id, post_id: post.id)

      like.increment_likes_count

      post.reload

      expect(post.likes_counter).to eq(1)
    end
  end
end
