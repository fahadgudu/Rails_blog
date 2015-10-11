# == Schema Information
#
# Table name: content_views
#
#  id         :integer          primary key
#  title      :string
#  type       :text
#  body       :text
#  author     :string
#  start_time :string
#  surname    :text
#  city       :text
#  created_at :datetime
#  updated_at :datetime
#  tag_ids    :integer          is an Array
#

FactoryGirl.define do
  factory :content_view do
    
  end

end
