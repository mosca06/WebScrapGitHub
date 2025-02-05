# frozen_string_literal: true

require 'rails_helper'

describe '/profiles' do
  let(:user) { create(:user) }
  before(:each) do
    login_as(user, scope: :user)
  end
  describe 'success' do
    it 'POST /' do
      mock_from_file('mosca06')

      params = { profile: { name: 'mosca06' } }
      post '/profiles', params: params
      expect(response).to have_http_status(:found)
      expect(response).to have_http_status(:found)
      expect(Profile.where(name: params[:profile][:name]).size).to eq(1)
    end
  end
  describe 'failure' do
    it 'POST /' do
      params = { profile: { name: '' } }
      post '/profiles', params: params
      expect(Profile.where(name: params[:profile][:name]).size).to eq(0)
    end
    it 'POST /' do
      allow_any_instance_of(Webscrap::GitHub).to receive(:open_link)
        .and_raise(OpenURI::HTTPError.new('404 Not Found', StringIO.new))

      params = { profile: { name: '3rf23425' } }
      post '/profiles', params: params

      expect(Profile.where(name: params[:profile][:name]).size).to eq(0)
    end
  end
end
