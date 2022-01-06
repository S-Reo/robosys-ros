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

### パブリッシャ
0~9をランダムにトピックメッセージとして出力。
### サブスクライバ
0~9を受け取る。
subprocessでbashファイルを実行。
bashファイルに、受け取った0~9の値を引数として渡しておく。

### bashファイル
引数で取得した値をデバイスドライバにechoする。


## 使用方法
[robosys](https://github.com/S-Reo/robosys)とこのリポジトリをフォーク
make
### robosys側
1. make
2. sudo insmod manyled.ko
3. sudo mknod /dev/manyled0 c 507 0
4. sudo chmod 666 /dev/manyled0

### robosys-ros側
1. cd mypkg/roscore
7. rosrun mypkg randomout.py
8. rosrun mypkg todeb.py
9. ledが0~9のランダムなビットで光る
10. 
11. sudo rmmod manyled6 (後処理)


/*copyright © 2021 S-Reo (https://github.com/S-Reo) All rights reserved*/
