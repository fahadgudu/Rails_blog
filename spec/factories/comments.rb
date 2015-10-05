FactoryGirl.define do
  factory :comment do
    author "User"
    body "Content"
    commentable_type "Post"

    factory :invalid_comment do
      content nil
    end
  end

end
