FactoryBot.define do
  factory :payment do
    invoice { nil }
    amount { "9.99" }
    paid_on { "2026-08-08" }
  end
end
