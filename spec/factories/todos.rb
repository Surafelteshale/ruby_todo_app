require 'faker'
  

FactoryBot.define do
  factory :todo do
    task { Faker::Lorem.word }
    is_completed {true}
  end
end
