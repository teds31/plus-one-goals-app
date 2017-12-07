FactoryBot.define do

  factory :task do
    sequence(:task) {|n| "task#{n}"}
  end

end
