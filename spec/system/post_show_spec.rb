require 'rails_helper'

describe "a specification" do
    before(:all) do
        Comment.delete_all
        Post.delete_all
        User.delete_all
        @tom = User.create(name: 'Tom', photo: 'https://placehold.co/200x133', bio: 'Teacher from Mexico.',
                           posts_counter: 0)
        @first_post = Post.create(author: @tom, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                                  likes_counter: 0)
        @lilly = User.create(name: 'Lilly', photo: 'https://placehold.co/200x133', bio: 'Teacher from Poland.',
                             posts_counter: 0)
        @second_post = Post.create(author: @lilly, title: 'Hi Word!', text: 'Lets talk', comments_counter: 0,
                                   likes_counter: 0)
        @users = User.all
        @posts = Post.all
    end

    it 'description' do
        visit "/users/#{@tom.id}/posts/#{@first_post.id}"
        expect(page).to  have_content("#{@first_post.title}")
    end
end