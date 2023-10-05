require 'rails_helper'

describe "a specification" do
    before(:all) do
        Comment.delete_all
        Post.delete_all
        User.delete_all
        @tom = User.create(name: 'Tom', photo: 'https://placehold.co/200x133', bio: 'Teacher from Mexico.',
                           posts_counter: 0)
    end

    it 'description' do
        visit "/users/#{@tom.id}"
        expect(page).to have_content("#{@tom.name}")
        expect(page).to have_content("#{@tom.bio}")
    end
end
