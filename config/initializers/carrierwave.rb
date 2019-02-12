CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: ENV['AWS_REGION']
  }

  config.fog_public = true

  case Rails.env
  when 'development'
    config.storage :fog
    config.fog_directory = ENV['AWS_S3_BUCKET']
    config.asset_host = ENV['AWS_S3_URL']
  when 'production'
    config.storage :fog
    config.fog_directory = ENV['AWS_S3_BUCKET']
    config.asset_host = ENV['AWS_S3_URL']
  when 'test'
    config.storage :file
  end
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
