class PostImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  process resize_to_limit: [400, 400]

  version :thumb do
    process resize_to_fill: [399, 285]
  end

  version :thumb_mini do
    process resize_to_fill: [225, 150]
  end

  def store_dir
    'uploads/images/'
  end

  def extension_white_list
    %w[jpg jpeg gif png]
  end

  def filename
    "image-#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.uuid)
  end

end
