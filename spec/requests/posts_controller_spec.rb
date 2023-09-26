require 'rails_helper'

describe 'GET /posts' do
  context '' do
    let!(:u) { User.create(name: 'Tester', posts_counter: 0) }

    it 'Should have the right response status' do
      get "/users/#{u.id}/posts"

      expect(response.status).to eq(200)
    end
    it 'Should render the correct template' do
      get "/users/#{u.id}/posts"

      expect(response).to be_successful
    end
    it 'Should have the right placeholder' do
      get "/users/#{u.id}/posts"

      expect(response.body).to include("#{u.name}'s posts page")
    end
  end
end
