# == Schema Information
#
# Table name: tags
#
#  id   :integer          not null, primary key
#  name :string
#  slug :string
#

FactoryGirl.define do
  factory :tag do
    name "Test"
    slug "test"

    factory :invalid_tag do
      name nil
    end
  end

end
