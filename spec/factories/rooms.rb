FactoryBot.define do
  factory :room do
    name { Faker::Name.middle_name  }
    video_url { "https://www.youtube.com/watch?v=FkZlBznlUew" }
    views { 5 }
  end
end
