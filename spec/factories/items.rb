# spec/factories/items.rb
# model factories which will provide the test data.

FactoryBot.define do 
  factory :item do
    name { Faker::StarWars.caracter }
    done false
    todo_id nil
  end
end
