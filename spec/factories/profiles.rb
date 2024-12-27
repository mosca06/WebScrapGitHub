FactoryBot.define do
  factory :profile do
    name { Faker::Name.name }
    user { create(:user) }
  end
end
