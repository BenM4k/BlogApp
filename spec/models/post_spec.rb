require 'rails_helper'

describe Post, type: :model do
  subject { Post.create(title: 'Title', text: 'Text', likes_counter: 0, comments_counter: 0, author_id: 1) }

  context 'When Testing new post validity' do
    it 'should be valid' do
      expect(subject).to be_valid
    end

    it 'should have a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'should have a title of less than 250 characters' do
      subject.title = 'a' * 251
      expect(subject).to_not be_valid
    end

    it 'should have a numeric likes counter greater than or equal to 0' do
      subject.likes_counter = nil
      expect(subject).to_not be_valid
    end

    it 'should have a numeric comments counter greater than or equal to 0' do
      subject.comments_counter = nil
      expect(subject).to_not be_valid
    end
  end

  context 'When testing user methods' do
    it 'Should return the last five post of a user' do
      comment1 = Comment.create(user_id: 1, post_id: subject.id, text: 'Comment 10')
      comment2 = Comment.create(user_id: 1, post_id: subject.id, text: 'Comment 11')
      comment3 = Comment.create(user_id: 1, post_id: subject.id, text: 'Comment 12')
      comment4 = Comment.create(user_id: 1, post_id: subject.id, text: 'Comment 13')
      comment5 = Comment.create(user_id: 1, post_id: subject.id, text: 'Comment 14')

      result = subject.five_recent_comments

      expect(result).to eq([comment5, comment4, comment3, comment2, comment1])
    end

    it 'Should increment the post count of a user' do
      user = User.create(name: 'Tester2', posts_counter: 0)

      counter = user.posts_counter

      post = Post.new(title: 'Title', text: 'Text', likes_counter: 0, comments_counter: 0, author_id: user.id)

      post.increment_post_counter

      updated_user = User.find(post.author_id)

      expect(updated_user.posts_counter).to eq(counter + 1)
    end
  end
end
