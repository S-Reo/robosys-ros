# robosys-ros
ロボットシステム学において製作したROS関連のリポジトリ

### ライセンス  
  BSD
### 著作者    
  [S-Reo](https://github.com/S-Reo) + [ryuichiueda](https://github.com/ryuichiueda)
## できること
実行すると、9パターンランダムにLEDが光る。

## やっていること
LED4つをランダムに光らせる。
パブリッシャ➡サブスクライバ➡デバイスドライバ
の順にデータを渡している。

### パブリッシャ
0~9をランダムにトピックメッセージとして出力。

### サブスクライバ
0-9を受け取る。
subprocessでbashファイルを実行。
bashファイルに、受け取った0-9の値を引数として渡しておく。

### bashファイル
引数で取得した値をデバイスドライバにechoする。

### デバイスドライバ
課題1で製作したデバイスドライバに少々の変更を加えたもの。
"文字から数値に変換する処理"を加え、受け取った0~9を数値として扱い、gpioの配列に代入する。
0~9に応じてGPIO0~3のビットが変更される。


## 使用方法

### デバイスドライバ
1. cd dev
2. make
3. sudo insmod led_random.ko
4. sudo mknod /dev/led_random0 c 507 0
5. sudo chmod 666 /dev/led_random0

[後処理] 
sudo rmmod led_random0

### ROS関連
1. roscoreを実行しておく
2. cd scripts
3. rosrun mypkg randomout.py
4. rosrun mypkg todeb.py
5. ledが0~9のランダムなビットで光る


/*copyright © 2021 S-Reo (https://github.com/S-Reo) All rights reserved*/
