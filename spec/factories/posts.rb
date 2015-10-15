# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  author     :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_ids    :integer          default([]), is an Array
#  settings   :hstore           default({}), not null
#

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
