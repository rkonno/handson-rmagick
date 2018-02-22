require 'RMagick'

root = File.expand_path('..', __dir__)

def synthesis_text(img, text, font, split_text_size=12)
  draw = Magick::Draw.new
  prepared_text = text.scan(/.{1,#{split_text_size}}/).join("\n")

  draw.annotate(img, 0, 0, 110, -50, prepared_text) do
    self.font      = font
    self.fill      = 'black'
    self.stroke    = 'transparent'
    self.pointsize = 23
    self.gravity   = Magick::CenterGravity
  end
end

def synthesis_image(img, cover_image)
  margin_top = 145
  margin_left = 70

  img.composite!(cover_image, margin_left, margin_top, Magick::OverCompositeOp)
end

# テキストや画像を載せる元となる画像の読み込み
img = Magick::ImageList.new("#{root}/img/message_card_ver2.png")
compound_image = img.scale(600, 400)

# テキストを合成する処理
raw_text = "あのイーハトーヴォのすきとおった風、夏でも底に冷たさをもつ青いそら、うつくしい森で飾られたモリーオ市、郊外のぎらぎらひかる草の波。 "
font = "#{root}/fonts/APJapanesefont.ttf"
synthesis_text(compound_image,raw_text, font)

# 画像を合成する処理
thumb_img = Magick::ImageList.new("#{root}/export/resized_thumb.png")
synthesis_image(compound_image, thumb_img)

# 合成された画像を出力
compound_image.write("#{root}/export/char_and_image_insertion.png")

