require 'rails_helper'

RSpec.describe 'Dashboard' do
  describe 'Visitor Visit' do
    it 'Redirects to Login' do
      visit '/users/dashboard'
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
      expect(page).to have_content('Log in')
      expect(page).not_to have_content('Sign Out')
    end
  end
end
