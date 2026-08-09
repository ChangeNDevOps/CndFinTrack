FactoryBot.define do
  factory :customer do
    company { nil }
    address1 { "MyString" }
    address2 { "MyString" }
    zip { "MyString" }
    country_code { "MyString" }
    province_code { "MyString" }
    city { "MyString" }
    prefix { "MyString" }
    status { 1 }
  end
end
