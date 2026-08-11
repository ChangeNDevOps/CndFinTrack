FactoryBot.define do
  factory :tax_yearly do
    company { nil }
    start_at { "2026-08-08" }
    tax_return_duration_in_month { 1 }
    tps_rate { "9.99" }
    tvq_rate { "9.99" }
  end
end
