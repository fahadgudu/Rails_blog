FactoryGirl.define do
  factory :event do
    title "Test Event"
    body "Body"
    author "Admin"
    start_time "Never"

    factory :invalid_event do
      body nil
    end
  end

end
