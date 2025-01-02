# frozen_string_literal: true

require 'rails_helper'

describe '/profiles' do
  let(:user) { User.create(email: 'mail@mail.com', password: '123456') }
  before(:each) do
    login_as(user, scope: :user)
  end
  describe 'success' do
    it 'POST /' do
      params = { profile: { name: 'teste' } }
      post '/profiles', params: params
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
      params = { profile: { name: '3rf23425' } }
      post '/profiles', params: params
      expect(Profile.where(name: params[:profile][:name]).size).to eq(0)
    end
  end
end
