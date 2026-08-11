FactoryBot.define do
  factory :supplier do
    company { nil }
    name { "MyString" }
    address1 { "MyString" }
    address2 { "MyString" }
    zip { "MyString" }
    country_code { "MyString" }
    province_code { "MyString" }
    city { "MyString" }
    prefix { "MyString" }
    status { 1 }
    taxable { false }
  end
end
