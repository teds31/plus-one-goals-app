FactoryBot.define do

  factory :goal do
    sequence(:wish) {|n| "Goal#{n}"}
    outcome 'Able to buy a Tesla Roadster'
    obstacle "Don't have enough money"
  end

end
