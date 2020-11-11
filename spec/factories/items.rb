FactoryBot.define do
  factory :item do
    title {"abe"}
    sub_title {"kkkgmail"} 
    target_amount {100000} 
    day_id { Faker::Date.between(from: '2014-09-23', to: '2014-09-25') }
    remaining_days {20}
  end
end
