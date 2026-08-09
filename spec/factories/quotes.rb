FactoryBot.define do
  factory :quote do
    company { nil }
    customer { nil }
    available_on { "2026-08-08" }
    available_duration_in_month { 1 }
    status { 1 }
  end
end
