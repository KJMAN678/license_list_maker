#!/bin/bash

# インストールしているパッケージの一覧を取得。
# 除外ライブラリ: pip,pip-licenses,pipdeptree,black,flake8,isort,pytest,setuptools\
# バージョン情報は除く
packages=$(pipdeptree -a -e pip,pip-licenses,pipdeptree,black,flake8,isort,pytest,setuptools\
 | grep -e '^\S' \
 | sed -E 's/==[0-9]+\.[0-9]+\.[0-9]+//g' | sed -E 's/==[0-9]+\.[0-9]+//g' | sed -E 's/==[0-9]+//g')

# 依存関係のあるパッケージを含めたライセンス情報を CSV 形式で出力
pip-licenses --order=license --from=mixed --format=csv > all_license_list.csv

# ライセンス情報を requirements.txt に記載されているパッケージに絞る

for package in $packages; do
  grep -F "$package" all_license_list.csv >> origin_license_list.csv
done

sort -b -k 3 -t, origin_license_list.csv > license_list.csv

rm all_license_list.csv
rm origin_license_list.csv