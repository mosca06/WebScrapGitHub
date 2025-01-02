# frozen_string_literal: true

require 'rails_helper'

describe '/profiles' do
  let(:user) { User.create(email: 'mail@mail.com', password: '123456') }
  let(:profile) { Profile.create(name: 'mosca06', user: user) }

  before(:each) do
    login_as(user, scope: :user)
  end
  describe 'success' do
    it 'PATCH /update' do
      patch "/profiles/#{profile.id}", params: { profile: { name: 'xitarps' } }

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(profile_path(profile))
    end
  end
  describe 'failure' do
    it 'PATCH /update' do
      patch "/profiles/#{profile.id}", params: { profile: { name: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(profile.reload.name).to eq('mosca06')
    end
  end
end
