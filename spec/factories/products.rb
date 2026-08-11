FactoryBot.define do
  factory :product do
    company { nil }
    name { "MyString" }
    description { "MyString" }
    unit_price { "9.99" }
    status { 1 }
  end
end
