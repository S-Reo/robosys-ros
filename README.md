# robosys-ros
ロボットシステム学において製作したROS関連のリポジトリ

### ライセンス  
  GPL (v3.0)
### 著作者    
  [S-Reo](https://github.com/S-Reo) + [ryuichiueda](https://github.com/ryuichiueda)
## できること
実行すると、9パターンランダムにLEDが光る。

## やっていること
課題1で製作したデバイスドライバを、文字から数値に変換する処理を加え、0~9を数値として扱うようにした。

pythonで書いたファイルからbashを実行。
bashファイル実行時にechoで出力するための引数を与えておく。
bashファイルでechoをデバイスドライバにリダイレクトする。


## 使用方法
[robosys](https://github.com/S-Reo/robosys)とこのリポジトリをフォーク
make
1. make
2. sudo insmod manyled.ko
3. sudo mknod /dev/manyled0 c 507 0
4. sudo chmod 666 /dev/manyled0
5. roscore
6. rosrun mypkg randomout.py
7. rosrun mypkg ○○.py
8. ledが0~9のランダムなビットで光る
9. 
7. sudo rmmod manyled6 (後処理)


/*copyright © 2021 S-Reo (https://github.com/S-Reo) All rights reserved*/
