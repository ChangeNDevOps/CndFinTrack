FactoryBot.define do
  factory :tax_return_expense do
    tax_return { nil }
    expense { nil }
  end
end
