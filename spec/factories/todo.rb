FactoryBot.define do
  factory :todo do
    title { 'sample' }
    detail { 'sample text' }
    date { Time.current }
  end
end