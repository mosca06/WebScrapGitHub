# frozen_string_literal: true

require 'rails_helper'

describe '/profiles' do
  let(:profile) { create(:profile, name: 'mosca06') }

  before(:each) do
    login_as(profile.user, scope: :user)
  end
  describe 'success' do
    it 'PATCH /update' do
      mock_from_file('xitarps')

      patch "/profiles/#{profile.id}", params: { profile: { name: 'xitarps' } }
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(profile_path(profile))
      expect(profile.reload.name).to eq('xitarps')
    end
  end
  describe 'failure' do
    it 'PATCH /update' do
      mock_from_file('mosca06')

      patch "/profiles/#{profile.id}", params: { profile: { name: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(profile.reload.name).to eq('mosca06')
      expect(profile.reload.name).to eq('mosca06')
    end
  end
end
