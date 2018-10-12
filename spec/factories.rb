FactoryBot.define do
  factory :user do
    username { "Pekka" }
    password { "Foobar1" }
    password_confirmation { "Foobar1" }
  end

  factory :user2, class: User do
    username { "Toni" }
    password { "Foobar1" }
    password_confirmation { "Foobar1" }
  end

  factory :brewery do
    name { "anonymous" }
    active { true }
    year { 1900 } 
  end

  factory :beer do
    name { "anonymous" }
    style
    brewery # olueeseen liittyvä panimo luodaan brewery-tehtaalla
  end

  factory :style do
    name { "lager" }
    description { "lager is tasty" }
  end

  factory :rating do
    beer # reittaukseen liittyvä olut luodaan beer-tehtaalla
    user
    score { 4 }
  end
end
