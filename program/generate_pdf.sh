#!/bin/bash

# プログラムのディレクトリに移動
cd /Users/toyowata/dev/arm-kids-workshop/program

# 1. 以前の中間ファイルと出力ファイルを削除しておく
rm -f all_in_one.md all_in_one.html workshop_manual.pdf

# 2. Markdownファイルの結合（指定された順番でファイル名を並べます）
cat sensor1.md sensor2.md shake_calc.md ble.md calc.md dice.md gravity.md mag.md melody.md melody2.md mic.md mosq.md picopico.md > all_in_one.md

# 3. gripを使ってHTMLを出力
/opt/homebrew/bin/grip all_in_one.md --export all_in_one.html

# 4. 生成されたHTMLファイルに改ページ用のCSSを直接追記する
echo '<style>@media print { @page { margin: 1cm; } body, html, .Box, .Box-body, article, .markdown-body { overflow: visible !important; height: auto !important; max-height: none !important; } h1 ~ h1, .markdown-heading ~ .markdown-heading:has(h1) { page-break-before: always !important; break-before: page !important; } }</style>' >> all_in_one.html

# 5. Google Chromeのヘッドレス機能を使ってPDFに変換
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --headless --no-pdf-header-footer --print-to-pdf=workshop_manual.pdf all_in_one.html
