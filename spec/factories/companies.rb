FactoryBot.define do
  factory :company do
    team { nil }
    name { "MyString" }
    tps_id { "MyString" }
    tvq_id { "MyString" }
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
