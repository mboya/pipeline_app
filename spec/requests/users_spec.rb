require 'rails_helper'

RSpec.describe "Users API", type: :request do
  # Initialize test data
  let!(:users) { FactoryBot.create_list(:user, 10) }
  let(:user_id) { users.first.id }

  # Test suite for GET /users
  describe "GET /users" do
    # make HTTP get request before each example
    before { get '/users' }

    it 'returns all users' do
      # Note: JSON.parse(response.body) vs response.parsed_body
      expect(JSON.parse(response.body)['data'].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /users/:id
  describe 'GET /users/:id' do
    before { get "/users/#{user_id}" }

    context 'when the record exists' do
      it 'returns the user' do
        expect(JSON.parse(response.body)['data']['id']).to eq(user_id.to_s)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:user_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        #shoulda matchers can help with json body matchers
        expect(JSON.parse(response.body)['errors'][0]['title']).to match("Record not found")
      end
    end
  end
end
