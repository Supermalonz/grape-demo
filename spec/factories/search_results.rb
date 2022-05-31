FactoryBot.define do
  factory :search_result do
    keyword
    header { 'Apple Official Thailand' }
    url { 'https://www.apple.com/th/' }
    is_ads { true }
  end

  trait :ads do
    is_ads { true }
  end

  trait :nonads do
    is_ads { false }
  end
end
