# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string
#  surname    :string
#  city       :string
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_ids    :integer          default([]), is an Array
#

FactoryGirl.define do
  factory :user do
    
  end

end
