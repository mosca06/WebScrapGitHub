FactoryBot.define do
  factory :user do
    email { Faker::Internet.email } # Gera um email aleatório
    password { '123456' }
    password_confirmation { '123456' }
  end
end
