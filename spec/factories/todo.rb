require 'date'
FactoryBot.define do
  factory :todo do
    title{"sample"}
    detail{"sample text"}
    date{Date.today}
    end
end