#!/usr/bin/env bash
# Krono Linux Otomatik Derleme Betiği

set -e

# Root yetkisi kontrolü
if [ "$EUID" -ne 0 ]; then
  echo "[-] Bu betik root (sudo) yetkisiyle çalıştırılmalıdır!"
  exit 1
fi

echo "[+] Krono Linux derleme süreci başlatılıyor..."

# Çalışma dizinleri
PROFILE_DIR="./profile"
WORK_DIR="./work"
OUTPUT_DIR="./output"

# Klasörlerin varlığını kontrol et
if [ ! -d "$PROFILE_DIR" ]; then
  echo "[-] Hata: $PROFILE_DIR klasörü bulunamadı!"
  exit 1
fi

# Temizlik
echo "[+] Eski çalışma dosyaları temizleniyor..."
rm -rf "$WORK_DIR" "$OUTPUT_DIR"

# Archiso ile ISO derleme
echo "[+] mkarchiso çalıştırılıyor..."
mkarchiso -v -w "$WORK_DIR" -o "$OUTPUT_DIR" "$PROFILE_DIR"

echo "[+]"
echo "[+] Başarılı! ISO dosyası 'output/' klasöründe hazır."