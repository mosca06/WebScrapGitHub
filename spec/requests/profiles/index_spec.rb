# frozen_string_literal: true

require 'rails_helper'

describe '/profiles' do
  let(:user) { create(:user) }

  before(:each) do
    login_as(user, scope: :user)
  end
  describe 'success' do
    it 'GET /' do
      mock_from_file('mosca06')
      profile1 = create(:profile, name: 'mosca06', user:)

      mock_from_file('xitarps')
      profile2 = create(:profile, name: 'xitarps', user:)

      get '/profiles'
      expect(response.body).to include(profile1.name, profile2.name)
    end
  end
end
