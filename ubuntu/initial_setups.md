### Install git
```
apt update
apt install -y git
```

### Install dotfiles
```
git clone https://github.com/mzntaka0/dotfiles.git
sh ~/dotfiles/ubuntu/init.sh
```

### Change the shell to zsh
```
chsh $USER -s $(which zsh)
```


### Install pyenv
```
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
```

```
chmod 777 ~/.pyenv  # is it a correct permission?
```



Register pyenv
```
vi ~/.zshrc
---
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
---
```
or(if you already have .zshrc including above)
```
source .zshrc
```

sudo setting
```
visudo
---
# Defaults    secure_path = /sbin:/bin:/usr/sbin:/usr/bin
Defaults    env_keep += "PATH"
Defaults    env_keep += "PYENV_ROOT"
---
```

### Never Sleep
1. System Settings > Brightness & Lock
2. 'Turn screen off when inactive for ' -> Never
3. Lock -> OFF


### Mount HDD
Check here
https://hirooka.pro/ubuntu/add-disk-to-ubuntu/
https://qiita.com/suisuina/items/7b55a640fdd6b299aa46

HDDの情報を表示(/dev/sd[a-z]みたいなのを確認）
```
fdisk -l
```

HDDのフォーマット
```
fdisk /dev/sdX
```

```
Command (m for help): m
...
```

既存のパーティションを削除し，新規にパーティションを作成した実行結果です。

```
Command (m for help): d
Selected partition 1
Partition 1 has been deleted.
 
Command (m for help): d
No partition is defined yet!
Could not delete partition 1
 
Command (m for help): n
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
Select (default p): 
 
Using default response p.
Partition number (1-4, default 1): 
First sector (2048-976773167, default 2048): 
Last sector, +sectors or +size{K,M,G,T,P} (2048-976773167, default 976773167): 
 
Created a new partition 1 of type 'Linux' and of size 465.8 GiB.
 
Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
```

再度fdisk実行
```
/dev/sdXlがみえる
```

HDDをext4でフォーマット
```
mkfs.ext4 /dev/sdXl
```

結果
```
mke2fs 1.42.13 (17-May-2015)
/dev/sdb1 contains a ext4 file system
    last mounted on /media/hirooka/cddde517-ffbb-4caf-a551-ddb24663fcb2 on Sat Jun  4 23:35:16 2016
Proceed anyway? (y,n) y
Creating filesystem with 122096390 4k blocks and 30531584 inodes
Filesystem UUID: c0c69960-f719-4411-b1d6-339458e893c8
Superblock backups stored on blocks: 
    32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 
    4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968, 
    102400000
 
Allocating group tables: done                           
Writing inode tables: done                           
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting information: done
```

HDDをマウントするためのディレクトリを作成し、そこにマウント
```
mkdir /mnt/hdd
mount /dev/sdXl /mnt/hdd
```
ok

* OS起動時にHDDが自動マウントされるようにする
HDDのUUIDを確認
```
blkid /dev/sdXl
```

こんな感じに表示される
```
/dev/sda1: UUID="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" TYPE="ext4" PARTUUID="xxxxxxxx-xx"
```

/etc/fstabを開く
```
vi /etc/fstab
```

HDDの情報を追記する
```
UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx       /mnt/hdd        ext4    defaults        0       0
```

OSを再起動
```
reboot
```

HDDが自動でマウントされてるのを確認




### Setup VNC
Coming soon...


