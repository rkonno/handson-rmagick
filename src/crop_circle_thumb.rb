require 'RMagick'

root = File.expand_path('..', __dir__)

thumb_width  = 150
thumb_height = 150

# thumbnailを読み込む
former_img = Magick::ImageList.new("#{root}/img/thumbnail.jpg")
# thumbnailをリサイズ（150x150）
resized_img = former_img.resize(thumb_width, thumb_height)

# マスクの元になる丸い素材を読み込む
mask_circle_img = Magick::ImageList.new("#{root}/img/mask_circle.png")

# thumbnailを丸い素材でマスキング処理
circle_thumb_img = resized_img.composite(mask_circle_img, Magick::CenterGravity, Magick::CopyOpacityCompositeOp)

# 保存する
circle_thumb_img.write("#{root}/export/resized_thumb.png")

