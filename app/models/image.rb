# == Schema Information
#
# Table name: assets
#
#  id             :integer          not null, primary key
#  assetable_id   :integer
#  assetable_type :string
#  filename       :text
#  content_type   :string
#  type           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Image < Asset
  self.table_name = "assets"
  mount_uploader :data, ImageUploader, mount_on: :filename
end
