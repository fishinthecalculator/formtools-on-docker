#!/usr/bin/env bash

set -eu

out_dir="$(pwd)/formtools"

[[ -d "$out_dir" ]] && mv "${out_dir}" "${out_dir}_old"

curl -L "https://formtools.org/download_file.php?file_type=core&file=FormTools3.0.20-05012022.zip" -o "$(pwd)/formtools.zip"

unzip formtools.zip

rm -rvf __MACOSX/
