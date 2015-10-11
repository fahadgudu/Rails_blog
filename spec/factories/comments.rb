# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_id   :integer
#  commentable_type :string
#  author           :string
#  body             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

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
