FactoryBot.define do

  factory :user do
    sequence(:email) {|n| "person#{n}@example.com"}
    first_name 'Carmen'
    last_name 'Martinez'
    username 'Calamusa'
    password 'password11'
    password_confirmation 'password11'
  end

  factory :product do
    sequence(:name) {|n| "Wine#{n}"}
    maker 'Montauk Vineyards'
    location 'Montauk, Long Island'
    year '2012'
    association :user, factory: :user

  end

  # factory :attachment do
  #    after :create do |b|
  #      b.update_column(:wine_photo, "foo/bar/baz.png")
  #    end
  #  end

  factory :review do
    sequence(:title) {|n| "For the #{n} time this is a good wine!"}
    body 'I mean I have it with cheese, steak, shrimp, and of course pizza!'
    association :user, factory: :user
    association :product, factory: :product
  end

end
