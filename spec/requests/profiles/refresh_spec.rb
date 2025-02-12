# frozen_string_literal: true

require 'rails_helper'

describe '/profiles' do
  let(:profile) { create(:profile, name: 'mosca06') }

  before(:each) do
    login_as(profile.user, scope: :user)
  end
  describe 'success' do
    it 'PATCH /refresh' do
      mock_from_file('mosca06_refresh')

      expect do
        patch "/profiles/#{profile.id}/refresh"
      end.to change { profile.reload.following_count }.from(128).to(821)
      expect(response).to redirect_to(profiles_path)
    end
  end
  describe 'failure' do
    it 'PATCH /refresh' do
      mock_from_file('mosca06')

      expect do
        patch "/profiles/#{profile.id}/refresh"
      end.not_to change { profile.reload.following_count }.from(128)
      expect(response).to redirect_to(profiles_path)
    end
  end
end
