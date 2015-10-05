FactoryGirl.define do
  factory :post do
    title "Title"
    body "Body"
    author "User"

    factory :invalid_post do
      body nil
    end
  end

end
