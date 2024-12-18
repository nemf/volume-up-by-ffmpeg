#!/bin/bash

set -e  # エラー時に即座に終了

# 関数定義
cleanup() {
    [[ -f "$TMP" ]] && rm "$TMP"
}

# 引数チェック
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

INPUT="$1"
TMP="$(mktemp).m4a"
trap cleanup EXIT

if [[ ! -f "$INPUT" ]]; then
    echo "File does not exist: $INPUT"
    exit 1
fi

# 現在の日付をyyyymmdd形式で取得
CURRENT_DATE=$(date +"%Y%m%d")

# 入力ファイルの拡張子を取得
EXTENSION="${INPUT##*.}"

# 新しい出力ファイル名を生成
OUTPUT="${CURRENT_DATE}-volup.${EXTENSION}"

cp "$INPUT" "$TMP"

echo "Detecting the current volume level"
VOL=$(ffmpeg -i "$TMP" -vn -af volumedetect -f null - 2>&1 | 
      grep max_volume | awk '{print $5}' | sed 's/-//')

echo "max_volume=$VOL"

echo "Started to adjust the volume ...."
ffmpeg -loglevel error -i "$TMP" -af "volume=${VOL}dB" "$OUTPUT"
echo "Completed!! Output file: $OUTPUT"
