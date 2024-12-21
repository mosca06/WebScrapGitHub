require 'rails_helper'

RSpec.describe 'Homepage' do
  describe 'Visitor Visit' do
    it 'Sees a Greeting' do
      visit '/'
      expect(page).to have_content('Ola')
    end
  end
end
