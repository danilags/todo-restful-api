# spec/factories/todos.rb
# model factories which will provide the test data.

FactoryBot.define do
  factory :todo do
    title { Faker::Lorem.word }
    created_by { Faker::Number.number(12) }
  end
end
