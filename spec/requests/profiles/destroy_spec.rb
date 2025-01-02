# frozen_string_literal: true

require 'rails_helper'

describe '/profiles' do
  let(:user) { User.create(email: 'mail@mail.com', password: '123456') }
  let(:profile) { Profile.create(name: 'Old Name', user: user) }

  before(:each) do
    login_as(user, scope: :user)
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
