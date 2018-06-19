class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  process resize_to_limit: [400, 400]
  process :crop

  version :thumb do
   process :crop
   process :resize_to_limit => [180, 150]
  end

  def crop
    manipulate! do |img|
      gravity = Magick::CenterGravity # 中央から切り取る。
      crop_w = img.columns
      crop_h = img.rows
      # 画像のサイズが縦横違った場合は小さい方に合わせてトリミングする。
      if img.rows <= img.columns
       crop_w = img.rows
      else
       crop_h = img.columns
      end
      img.crop!(gravity, crop_w, crop_h)
      img = yield(img) if block_given?
      img
    end
  end

  def store_dir
    "uploads/images/"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
