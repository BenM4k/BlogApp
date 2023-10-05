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

    end

    it "has users posts" do
        visit "/users/#{@tom.id}/posts"
        expect(page).to have_content("#{@tom.name}'s posts page")
    end

    it "has users posts" do
        visit "/users/#{@tom.id}/posts"
        click_link 'show post'
        expect(page).to have_content("#{@first_post.title}")
    end
end
