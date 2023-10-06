require 'rails_helper'

describe 'a specification' do
  before(:all) do
    Comment.delete_all
    Post.delete_all
    User.delete_all
    @tom = User.create(name: 'Tom', photo: 'https://placehold.co/200x133', bio: 'Teacher from Mexico.',
                       posts_counter: 0)
    @post = Post.create(author: @tom, title: 'First Post', text: 'This is my first post', comments_counter: 0,
                        likes_counter: 0)
    @post1 = Post.create(author: @tom, title: 'Second Post', text: 'This is my second post', comments_counter: 0,
                         likes_counter: 0)
    @post2 = Post.create(author: @tom, title: 'Third Post', text: 'This is my third post', comments_counter: 0,
                         likes_counter: 0)
  end

  it 'description' do
    visit "/users/#{@tom.id}"
    expect(page).to have_content(@tom.name)
  end

  it 'description' do
    visit "/users/#{@tom.id}"
    expect(page).to have_content(@tom.bio)
  end

  it 'description' do
    visit "/users/#{@tom.id}"
    expect(page).to have_selector("img[src='https://placehold.co/200x133']")
  end

  it 'description' do
    visit "/users/#{@tom.id}"
    expect(page).to have_content(@tom.posts_counter)
  end

  it 'description' do
    visit "/users/#{@tom.id}"
    expect(page).to have_content('See all posts')
  end

  it 'description' do
    visit "/users/#{@tom.id}"
    expect(page).to have_content('First Post')
    expect(page).to have_content('Second Post')
    expect(page).to have_content('Third Post')
  end

  it 'description' do
    visit "/users/#{@tom.id}"
    click_link 'See all posts'
    expect(page).to have_current_path("/users/#{@tom.id}/posts")
  end
end
