FactoryGirl.define do

  factory :message do
    body         "Hello"
    image        {File.open(File.join(Rails.root, '/spec/fixtures/files/test.jpg'))}
    group_id     "2"
    user_id      "1"
  end
end
