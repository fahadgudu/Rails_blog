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

class ContentView < ActiveRecord::Base
  self.table_name = "content_views"
  self.primary_key = "id"

  scope :any_tags, -> (tags) { where('tag_ids && ARRAY[?]', Array.wrap(tags).map(&:to_i)) }
  scope :recently, -> { order(created_at: :desc) }

  def readonly?
    return true
  end

  def before_destroy
    raise ActiveRecord::ReadOnlyRecord
  end
end
