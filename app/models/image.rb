class Image < Asset
  self.table_name = "assets"
  mount_uploader :data, ImageUploader, mount_on: :filename
end
