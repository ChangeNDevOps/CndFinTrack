FactoryBot.define do
  factory :expense do
    compagny { nil }
    supplier { nil }
    amount { "9.99" }
    taxable { false }
    invoiced_on { "2026-08-08" }
    paid_on { "2026-08-08" }
  end
end
