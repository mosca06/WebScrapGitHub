require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }

    it 'is expected to validate that scoped by \'name\', \'user_id\'' do
      user = create(:user)
      user2 = create(:user)
      profile = create(:profile, name: 'teste', user: user)
      profile2 = build(:profile, name: 'teste', user: user)
      profile3 = build(:profile, name: 'teste', user: user2)

      expect(profile).to be_valid
      expect(profile2).not_to be_valid
      expect(profile3).to be_valid
    end
  end
end
