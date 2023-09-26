require 'rails_helper'

describe 'GET /users' do
  context '' do
    it 'Should have the right response status' do
      get('/users')

      expect(response.status).to eq(200)
    end

    it 'Should render the correct template' do
      get '/users'

      expect(response).to be_successful
    end

    it 'Should have the right placeholder' do
      get '/users'

      expect(response.body).to include('Users Page')
    end
  end
end
