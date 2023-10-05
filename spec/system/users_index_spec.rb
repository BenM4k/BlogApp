require 'rails_helper'

describe 'a specification' do
  before(:all) do
    Comment.delete_all
    Post.delete_all
    User.delete_all
    @tom = User.create(name: 'Tom', photo: 'https://placehold.co/200x133', bio: 'Teacher from Mexico.',
                       posts_counter: 0)
    Post.create(author: @tom, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
    @users = User.all
  end

  it 'description' do
    visit users_path
    expect(page).to have_content('Users Page')
    expect(page).to have_content('Tom')
  end

  it 'description' do
    visit users_path
    click_link 'show user'
    expect(page).to have_current_path("/users/#{@tom.id}")
  end
end
