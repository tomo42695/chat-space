FactoryGirl.define do

  factory :message do
    text                  "hello world"
    image                 "This is an image"
    user_id               "1"
    group_id              "1"
  end

end
