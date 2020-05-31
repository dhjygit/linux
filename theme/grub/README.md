# config the grub

```
su
```

复制主题文件：

```
cp -r /home/luis/github/linux/theme/grub/breeze /boot/grub/themes/
```

编辑配置文件：

```
cd /etc/grub.d/
nvim 00_header
```

在文件中添加：

```
GRUB_THEME="/boot/grub/themes/breeze/theme.txt"
GRUB_GFXMODE="1920x1080x32"
```

挂载windows

```
mount /dev/nvme0n1p_ /mnt
```

更新配置

```
grub-mkconfig -o /boot/grub/grub.cfg
```







