#!/bin/bash
ans="/tmp/$$-ans" # 毎回パスを⼊⼒するのは⼿間なので変数にする
result="/tmp/$$-result"

## テスト1正常動作の確認

# 16と24の最大公約数→8
echo 8 > ${ans} # 出⼒して欲しい内容（⼿⼊⼒）
./same.sh 16 24 > ${result} # 実際の出⼒
diff ${ans} ${result} || exit 1 # 出⼒を⽐較し、失敗したらエラー終了

# 31と17の最大公約数→1
echo 1 > ${ans} # 出⼒して欲しい内容（⼿⼊⼒）
./same.sh 31 17 > ${result} # 実際の出⼒
diff ${ans} ${result} || exit 1 # 出⼒を⽐較し、失敗したらエラー終了

## テスト2異常動作の確認

# 引数が足りないケース
echo "引数の数が足りません" > ${ans} # 出⼒して欲しい内容（⼿⼊⼒）
./same.sh 3 > ${result} # 実際の出⼒
diff ${ans} ${result} || exit 1 # 出⼒を⽐較し、失敗したらエラー終了

# 数値以外が入力されているケース
echo "数値以外が入力されています" > ${ans} # 出⼒して欲しい内容（⼿⼊⼒）
./same.sh 3 a > ${result} # 実際の出⼒
diff ${ans} ${result} || exit 1 # 出⼒を⽐較し、失敗したらエラー終了

# 負の数値が入力されているケース
echo "自然数以外の数値が入力されています" > ${ans} # 出⼒して欲しい内容（⼿⼊⼒）
./same.sh 3 -1 > ${result} # 実際の出⼒
diff ${ans} ${result} || exit 1 # 出⼒を⽐較し、失敗したらエラー終了

# 後始末
rm /tmp/$$-*
