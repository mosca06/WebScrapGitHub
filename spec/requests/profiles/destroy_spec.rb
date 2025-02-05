# frozen_string_literal: true

require 'rails_helper'

describe '/profiles' do
  before do
    mock_from_file('mosca06')
  end

  let(:profile) { create(:profile, name: 'mosca06') }

  before(:each) do
    login_as(profile.user, scope: :user)
  end
  describe 'success' do
    it 'DELETE /' do
      delete "/profiles/#{profile.id}"

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(profiles_path)
      expect(Profile.where(name: profile.name).size).to eq(0)
    end
  end
end
