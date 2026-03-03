#!/bin/bash

set -e

rm -rf output
mkdir -p output

cd geodata
bash release.sh
cd ..
mv geodata/output/geodata*.zip output
rm -rf geodata/output

python i18n-iso-countries/convert_to_zh_tw.py
zip -r output/i18n-iso-countries.zip i18n-iso-countries/langs
