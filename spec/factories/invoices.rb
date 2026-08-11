FactoryBot.define do
  factory :invoice do
    quote { nil }
    invoiced_on { "2026-08-08" }
    due_on { "2026-08-08" }
  end
end
