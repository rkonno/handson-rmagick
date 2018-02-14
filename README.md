# handson_rmagick

質問箱のような動的に質問票（画像）を生成することを目標として、[rmagick](https://github.com/rmagick/rmagick)をさわる。

### 動作環境

環境構築は、[macOS に RMagick をインストールする - Qiita](https://qiita.com/niwasawa/items/1144f20a9f2de4b76977)を参考にしている。

```bash
$ ruby -v
ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-darwin16]


$ sw_vers
ProductName:	Mac OS X
ProductVersion:	10.12.6
BuildVersion:	16G1212


$ /usr/local/opt/imagemagick@6/bin/convert --version
Version: ImageMagick 6.9.9-34 Q16 x86_64 2018-01-22 http://www.imagemagick.org
Copyright: © 1999-2018 ImageMagick Studio LLC
License: http://www.imagemagick.org/script/license.php
Features: Cipher DPC Modules
Delegates (built-in): bzlib freetype jng jpeg ltdl lzma png tiff xml zlib


$ gem list | grep rmagick
rmagick (2.16.0)
```

### 素材リンク

- フォント
    - [あんずいろapricot×colorフリー写真素材・手書きフォント・人物写真素材](http://www8.plala.or.jp/p_dolce/)