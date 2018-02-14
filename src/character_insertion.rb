require 'RMagick'

root = File.expand_path('..', __dir__)

img = Magick::ImageList.new("#{root}/img/message_card.png")
scaled_img = img.scale(600, 400)

row_text = "あのイーハトーヴォのすきとおった風、夏でも底に冷たさをもつ青いそら、うつくしい森で飾られたモリーオ市、郊外のぎらぎらひかる草の波。 またそのなかでいっしょになったたくさんのひとたち、ファゼーロとロザーロ、羊飼のミーロや、顔の赤いこどもたち、地主のテーモ、山猫博士のボーガント・デストゥパーゴなど、いまこの暗い巨きな石の建物のなかで考えていると、みんなむかし風のなつかしい青い幻燈のように思われます。"

font = "#{root}/fonts/APJapanesefont.ttf"
draw = Magick::Draw.new

split_text_size = 23
insert_text = row_text.scan(/.{1,#{split_text_size}}/).join("\n")

draw.annotate(scaled_img, 0, 0, 0, -25, insert_text) do
  self.font      = font
  self.fill      = 'black'
  self.stroke    = 'transparent'
  self.pointsize = 28
  self.gravity   = Magick::CenterGravity
end

scaled_img.write("#{root}/export/char_insertion.png")

