require 'rails_helper'

describe User, type: :model do
  subject { User.new(name: 'Tester 2', posts_counter: 0) }

  context 'When Testing new user validity' do
    it 'should be valid' do
      expect(subject).to be_valid
    end

    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have a numeric post counter greater than or equal to 0' do
      subject.posts_counter = nil
      expect(subject).to_not be_valid
    end
  end

  context 'When testing user methods' do
    it '' do
      post1 = Post.create(title: 'title_test', likes_counter: 0, comments_counter: 0, author_id: 1)
      post2 = Post.create(title: 'title_test2', likes_counter: 0, comments_counter: 0, author_id: 1)
      post3 = Post.create(title: 'title_test2', likes_counter: 0, comments_counter: 0, author_id: 1)

      user = User.find(1)

      result = user.three_recent_posts

      expect(result).to eq([post3, post2, post1])
    end
  end
end
