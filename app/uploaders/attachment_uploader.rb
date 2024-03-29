# encoding: utf-8

class AttachmentUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.assetable_id}"
  end

  def extension_white_list
    %w(doc txt pdf)
  end

end
