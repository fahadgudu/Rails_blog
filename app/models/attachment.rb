class Attachment < Asset
  self.table_name = "assets"
  mount_uploader :data, AttachmentUploader, mount_on: :filename
end