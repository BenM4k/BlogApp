require 'rails_helper'

describe 'a specification' do
  before(:all) do
    Comment.delete_all
    Post.delete_all
    User.delete_all
    @tom = User.create(name: 'Tom', photo: 'https://placehold.co/200x133', bio: 'Teacher from Mexico.',
                       posts_counter: 0)
    @lilly = User.create(name: 'Lilly', photo: 'https://placehold.co/200x133', bio: 'Teacher from Congo.',
                         posts_counter: 0)
    Post.create(author: @tom, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
    @users = User.all
  end

  it 'description' do
    visit users_path
    expect(page).to have_content('Users Page')
  end

  it 'description' do
    visit users_path
    expect(page).to have_content('Tom')
  end

  it 'description' do
    visit users_path
    expect(page).to have_content('Lilly')
  end

  it 'description' do
    visit users_path
    expect(page).to have_content("Posts: #{@tom.posts_counter}")
  end

  it 'description' do
    visit users_path
    click_link "show #{@tom.name}"
    expect(page).to have_current_path("/users/#{@tom.id}")
  end

  it 'description' do
    visit users_path
    @users.each do
      expect(page).to have_selector("img[src='https://placehold.co/200x133']")
    end
  end
end
