json.photos @photos do |photo|
  json.id    photo.id
  json.url   photo.image.url
  json.thumb photo.image.url(:thumb)
end
