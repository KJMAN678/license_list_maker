### pipdeptree と pip-licenses を使って Python ライブラリのライセンス一覧を csv に出力するスクリプト

### 開発環境

- M1 Mac Ventura 13.3.1
- Python 3.9.15

```sh
# 仮想環境の作成
python -m venv .venv

# 仮想環境のアクティベート
source .venv/bin/activate

# pip のアップグレード
python -m pip install --upgrade pip

# requirements.txt から ライブラリをインストール
pip install -r requirements.txt

# スクリプトの実行を許可
chmod 755 ./license_list_maker.sh

# スクリプトを実行しインストールしている Pythonライブラリのライセンス一覧を licenses.csv に作成
# 下記ライブラリは集計対象外
# pip,pip-licenses,pipdeptree,black,flake8,isort,pytest,setuptools
./license_list_maker.sh

# 仮想環境のディアクティベート
deactivate
```

Copyright (c) 2023 KJMAN678  
Released under the MIT license  
https://opensource.org/licenses/mit-license.php
