require 'rails_helper'

RSpec.describe 'Homepage' do
  describe 'User Visit' do
    it 'Sees a Greeting' do
      visit '/'
      expect(page).to have_content('Ola')
    end
  end
end
