# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string
#  start_time :string
#  body       :text
#  author     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city       :text             default("Nowhere")
#  tag_ids    :integer          default([]), is an Array
#

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
