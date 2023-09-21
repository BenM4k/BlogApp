require 'rails_helper'

describe Comment, type: :model do
  context 'When testing comments' do
    it 'Should increment the comment counter of a post' do
      user = User.create(name: 'Tester', posts_counter: 0)
      post = Post.create(title: 'Test', likes_counter: 0, comments_counter: 0, author_id: user.id)
      comment = Comment.create(user_id: user.id, post_id: post.id)

      comment.increment_comments_count

      post.reload

      expect(post.comments_counter).to eq(1)
    end
  end
end
