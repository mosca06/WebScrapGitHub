# frozen_string_literal: true

require 'rails_helper'

describe '/profiles' do
  let(:user) { User.create(email: 'mail@mail.com', password: '123456') }
  before(:each) do
    login_as(user, scope: :user)
  end
  describe 'success' do
    it 'GET /new' do
      get '/profiles/new'
      expect(response.body).to include('<label for="profile_name">name</label>')
    end
  end
end
