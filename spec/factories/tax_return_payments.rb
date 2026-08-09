FactoryBot.define do
  factory :tax_return_payment do
    tax_return { nil }
    payment { nil }
  end
end
