# Shinelon_YAO_7000_efi 

# 炫龙 耀7000 EFI 黑苹果 HACKINTOSH
[![img](https://img.shields.io/github/stars/jinmu333/Shinalon_YAO_7000_efi.svg?logoColor=blue&style=for-the-badge)
![img](https://img.shields.io/github/forks/jinmu333/Shinalon_YAO_7000_efi.svg?logoColor=blue&style=for-the-badge)
![img](https://img.shields.io/github/last-commit/jinmu333/Shinalon_YAO_7000_efi.svg?color=blue&style=for-the-badge)](https://github.com/jinmu333/Shinalon_YAO_7000_efi)
[![img](https://img.shields.io/badge/link-996.icu-red.svg?style=for-the-badge)](https://github.com/996icu/996.ICU)

# Shinelon YAO 7000 efi  for macOS Mojave

[English](README_EN.md) | [中文](README.md)

这是我使用的 炫龙 耀7000 的CLOVER引导文件

### 定制usb
[定制usb教程](https://blog.daliansky.net/Intel-FB-Patcher-tutorial-and-insertion-pose.html)

### 调整 macOS CPU性能
[使用方法](https://github.com/daliansky/XiaoMi-Pro/blob/master/one-key-cpufriend/README_CN.md)

### 电脑配置

| 规格     | 详细信息                                                |
| -------- | ----------------------------------------------------- |
| 电脑型号 | 炫龙 耀7000 笔记本电脑                                    |
| 操作系统 | macOS Mojave 18D42                                   |
| 处理器   | 英特尔 Core i5-8300H @ 2.30GHz 四核                   |
| 内存     | 16 GB ( 镁光 DDR4 2666MHz )                           |
| 硬盘     | INTEL 760P (256 GB / NVME固态硬盘 )                       |
| 显卡     | 英特尔 UHD Graphics 630 (platform-id:0x3E9B0000)       |
| 显示器   | 京东方 BOE  1920x1080 (15.6 英寸)                      |
| 声卡     | ALC269 (layout-id:8)                                 |
| 网卡     | 英特尔网卡已更换为BCM94360CS2                     |

### 安装镜像

**将镜像中efi替换为本仓库的EFI文件夹**

直接使用黑果小兵博客中的镜像进行安装：[【黑果小兵】macOS Mojave 10.14.3 18D42 正式版 with Clover 4859原版镜像](https://blog.daliansky.net/macOS-Mojave-10.14.3-18D42-official-version-with-Clover-4859-original-image.html)

### CLOVER

* 支持Mojave
* CPU原生支持，变频正常(最低800Mhz) 调整性能教程在后方
* 睡眠唤醒(键盘电源键唤醒)正常
* 显卡原生支持，采用`Lilu+WhateverGreen`通过`Clover/device/Properties`方式注入
* 声卡为ALC269VC，仿冒声卡解决偶尔启动无声，使用 `AppleALC` ，layout-id:8，通过`Clover/device/Properties`方式注入
* 无线网卡更换为BCM94360CS2
* 显示器亮度调节正常(重启可保存) 
* USB请自行采用`Hackintool`定制（教程在后方）
* 其它 `ACPI` 补丁修复采用 `hotpatch` 方式，文件位于 `/CLOVER/ACPI/patched`
* 电池hotpatch补丁显示电池状态正常
* 触摸板4指手势正常 单指第五次滑动失效
* fn键可用 fn+f1睡眠，fn+f2锁win键，fn+f3打印， fn + f11/f12为 f14 f15, fn键盘灯音量硬件支持  num键(部分情况可用 如终端)可用 
* 独显1050ti 无法驱动 hdmi为独显输出 一并失效

### 定制usb
[定制usb教程](https://blog.daliansky.net/Intel-FB-Patcher-tutorial-and-insertion-pose.html)

### 调整 macOS CPU性能
[使用方法](https://github.com/daliansky/XiaoMi-Pro/blob/master/one-key-cpufriend/README_CN.md)
``` bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/daliansky/XiaoMi-Pro/master/one-key-cpufriend/one-key-cpufriend_cn.sh)"
```

### HIDPI   
[开启方法](https://github.com/xzhih/one-key-hidpi)
``` bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/xzhih/one-key-hidpi/master/hidpi.sh)"
```
 **感谢 @[冰水加劲Q](https://github.com/xzhih)**

### 内置网卡无解 
* 注意 换网卡可能需要drop dmar, dart =0之类 请根据网卡型号自行驱动 
* [dw1560驱动教程](https://blog.daliansky.net/Broadcom-BCM94352z-DW1560-drive-new-posture.html) 
* [rehanman-OS-X-BrcmPatchRAM](https://bitbucket.org/RehabMan/os-x-brcmpatchram/downloads/) 
* [rehanman-OS-X-Fake-PCI-ID](https://bitbucket.org/RehabMan/os-x-fake-pci-id/downloads/) 
* [acidanthera-AirportBrcmFixup](https://github.com/acidanthera/AirportBrcmFixup/releases)

### sh
* sh文件夹下camera.sh用于睡眠后重新开启摄像头
* huancun.ch用于重建缓存 (需要时终端执行)

### 触摸板
* 触摸板由[@penghubingzhou](https://github.com/penghubingzhou)大佬驱动(远景触摸群群友[@xc2333](https://github.com/Xc2333)帮忙改成hotpatch)

### 系统截图

![1](pic/1.png)
![1](pic/2.png)
![1](pic/3.png)
![1](pic/4.png)
![1](pic/5.png)
![1](pic/6.png)
![1](pic/7.png)
![1](pic/8.png)
![1](pic/9.png)
