# frozen_string_literal: true

require 'rails_helper'

describe '/profiles' do
  let(:user) { User.create(email: 'mail@mail.com', password: '123456') }
  before(:each) do
    login_as(user, scope: :user)
  end
  describe 'success' do
    it 'GET /' do
      profile1 = create(:profile, user: user)
      profile2 = create(:profile, user: user)
      get '/profiles'
      expect(response.body).to include(profile1.name, profile2.name)
    end
  end
end
