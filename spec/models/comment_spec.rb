require 'rails_helper'

describe Comment, type: :model do
  subject { Comment.new(user_id: 1, post_id: 3) }
  # replace user_id and post_id with valid user and post ids

  context 'When testing comments' do
    it 'Should increment the comment counter of a post' do
      post = Post.find(subject.post_id)
      comments_counter = post.comments_counter

      subject.increment_comments_count
      updated_post = Post.find(subject.post_id)
      expect(updated_post.comments_counter).to eq(comments_counter + 1)
    end
  end
end
