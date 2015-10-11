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

require 'rails_helper'

RSpec.describe ContentView, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
