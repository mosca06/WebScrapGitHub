# frozen_string_literal: true

require 'rails_helper'

describe '/profiles' do
  let(:user) { User.create(email: 'mail@mail.com', password: '123456') }
  let(:profile) { Profile.create(name: 'Old Name', user: user) }

  before(:each) do
    login_as(user, scope: :user)
  end
  describe 'success' do
    it 'PATCH /update' do
      patch "/profiles/#{profile.id}", params: { profile: { name: 'New Name' } }

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(profile_path(profile))
    end
  end
  describe 'failure' do
    it 'PATCH /update' do
      patch "/profiles/#{profile.id}", params: { profile: { name: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(profile.reload.name).to eq('Old Name')
    end
  end
end
