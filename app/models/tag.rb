# == Schema Information
#
# Table name: tags
#
#  id   :integer          not null, primary key
#  name :string
#  slug :string
#

class Tag < ActiveRecord::Base
  validates_presence_of :slug
  validates :name, length: { in: 2..20 }, presence: true
  validates :slug, uniqueness: true
  def to_param
    slug
  end
end
