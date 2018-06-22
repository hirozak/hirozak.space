class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  process resize_to_limit: [700, 500]

  def store_dir
    "uploads/photos/"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
