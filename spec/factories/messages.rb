FactoryGirl.define do

  factory :message do
    body         { Faker::Lorem.sentence}
    image        {File.open(File.join(Rails.root, '/spec/fixtures/files/test.jpg'))}
  end

  trait :with_user_and_group do
    user
    group
  end
end
