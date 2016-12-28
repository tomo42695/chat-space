FactoryGirl.define do
  factory :message do
    text                  { Faker::Hipster.sentence }
    image                 { Faker::Placeholdit.image  }
    user_id               { Faker::Number.digit }
    group_id              { Faker::Number.digit }
  end
end
