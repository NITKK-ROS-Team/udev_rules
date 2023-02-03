# udev_rules

udevルールリスト（777しなくてもいいようにするためのスクリプト）

<br>

実行前にsudoをパスワードなしに実行できるようにする。

```bash
sudo w > null
```

以下をコピペ

```bash
declare -a StringArray=("100-m5devices.rules" "101-webcams.rules")

for val in ${StringArray[@]}; do
   sudo curl https://raw.githubusercontent.com/NITKK-ROS-Team/udev_rules/main/${val} --output /etc/udev/rules.d/${val}
done

sudo udevadm control --reload-rules
sudo udevadm trigger
```
