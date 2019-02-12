class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  process resize_to_limit: [1000, 720]

  version :thumb do
    process resize_to_fill: [150, 150]
  end

  def store_dir
    'uploads/photos/'
  end

  def extension_white_list
    %w[jpg jpeg gif png]
  end
end
