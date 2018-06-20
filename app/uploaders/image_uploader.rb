class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  process resize_to_limit: [400, 400]

  version :thumb do
   process :resize_to_fill => [315, 225]
  end

  def store_dir
    "uploads/images/"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
