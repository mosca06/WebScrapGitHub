require 'rails_helper'

RSpec.describe 'Dashboard' do
  let(:user) { User.create(email: 'mail@mail.com', password: '123456') }
  before(:each) do
    login_as(user, scope: :user)
  end
  describe 'User Visit' do
    it 'Sees Dashboard' do
      visit '/users/dashboard'
      expect(page).not_to have_content('Email')
      expect(page).not_to have_content('Password')
      expect(page).not_to have_content('Log in')
      expect(page).to have_content('Sign Out')
    end
  end
end
