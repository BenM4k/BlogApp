require 'rails_helper'

describe 'a specification' do
  before(:all) do
    Comment.delete_all
    Post.delete_all
    User.delete_all
    @tom = User.create(name: 'Tom', photo: 'https://placehold.co/200x133', bio: 'Teacher from Mexico.',
                       posts_counter: 0)
    @first_post = Post.create(author: @tom, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                              likes_counter: 0)
    @posts = Post.all
  end

  it 'has users posts' do
    visit "/users/#{@tom.id}/posts"
    expect(page).to have_content(@tom.name.to_s)
  end

  it 'description' do
    visit "/users/#{@tom.id}/posts"
    expect(page).to have_selector("img[src='https://placehold.co/200x133']")
  end

  it 'has users posts' do
    visit "/users/#{@tom.id}/posts"
    click_link 'show post'
    expect(page).to have_content(@first_post.title.to_s)
  end

  it 'description' do
    visit "/users/#{@tom.id}/posts"
    expect(page).to have_content(@tom.posts_counter)
  end

  it 'description' do
    visit "/users/#{@tom.id}/posts"
    expect(page).to have_content(@first_post.text)
  end

  it 'description' do
    visit "/users/#{@tom.id}/posts"
    expect(page).to have_content(@first_post.comments_counter)
  end

  it 'description' do
    visit "/users/#{@tom.id}/posts"
    expect(page).to have_content(@first_post.likes_counter)
  end

  it 'description' do
    visit "/users/#{@tom.id}/posts"
    post_per_page = 10
    pages = (@posts.length / post_per_page).ceil
    (1..pages).each do |page|
      expect(page).to have_content(page)
    end
  end

  it 'description' do
    visit "/users/#{@tom.id}/posts"
    @first_post.five_recent_comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end
end
