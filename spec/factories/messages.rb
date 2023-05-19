FactoryBot.define do
  factory :message do
    content { Faker::Lorem.words }

    association :user, factory: :user
    association :room, factory: :room
  end
end
