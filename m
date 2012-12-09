From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 09 Dec 2012 02:54:22 +0000
Subject: build regressions 2012-12-08
Message-Id: <50c3fd5e.Ky5vCwi49Y+n3iCT%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
ERROR: "get_pageblock_flags_group" [fs/jbd2/jbd2.ko] undefined!
drivers/media/v4l2-core/v4l2-clk.c:125:2: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
drivers/media/v4l2-core/v4l2-clk.c:153:2: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]

[warnings]
drivers/media/v4l2-core/v4l2-clk.c:125:6: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/media/v4l2-core/v4l2-of.c:174:2: warning: passing argument 1 of 'of_parse_phandle' discards 'const' qualifier from pointer target type [enabled by default]
arch/sparc/include/asm/prom.h:30:0: warning: "of_compat_cmp" redefined [enabled by default]
arch/sparc/include/asm/prom.h:31:0: warning: "of_prop_cmp" redefined [enabled by default]
arch/sparc/include/asm/prom.h:32:0: warning: "of_node_cmp" redefined [enabled by default]

[sparse]
drivers/net/ethernet/broadcom/bnx2.c:419:21: sparse: symbol 'bnx2_cnic_probe' was not declared. Should it be static?
fs/buffer.c:1449:6: sparse: symbol 'evict_bh_lrus' was not declared. Should it be static?
drivers/media/usb/em28xx/em28xx-video.c:706:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/usb/em28xx/em28xx-cards.c:2538:17: sparse: no member 'list' in struct v4l2_subdev
drivers/media/usb/em28xx/em28xx-core.c:1188:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/usb/pvrusb2/pvrusb2-hdw.c:1684:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/usb/stk1160/stk1160-core.c:114:17: sparse: no member 'list' in struct v4l2_subdev
drivers/media/usb/stk1160/stk1160-v4l.c:200:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/usb/tm6000/tm6000-cards.c:927:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/usb/tm6000/tm6000-core.c:338:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/usb/tm6000/tm6000-video.c:1075:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/bt8xx/bttv-driver.c:1210:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/bt8xx/bttv-cards.c:3603:17: sparse: no member 'list' in struct v4l2_subdev
drivers/media/radio/radio-si4713.c:154:16: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/cx18/cx18-driver.c:1019:25: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/cx18/cx18-i2c.c:161:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/cx18/cx18-fileops.c:168:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/cx18/cx18-ioctl.c:386:25: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/cx18/cx18-controls.c:114:17: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/cx18/cx18-audio.c:53:15: sparse: no member 'list' in struct v4l2_subdev
drivers/media/usb/usbvision/usbvision-core.c:2507:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/usb/usbvision/usbvision-video.c:201:17: sparse: no member 'list' in struct v4l2_subdev
drivers/media/usb/usbvision/usbvision-i2c.c:255:25: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/cx23885/cx23885-video.c:328:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/cx23885/cx23885-core.c:845:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/cx23885/cx23885-dvb.c:1270:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/cx23885/cx23885-417.c:1220:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/cx23885/cx23885-ioctl.c:76:25: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/cx25821/cx25821-video.c:156:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/usb/cx231xx/cx231xx-417.c:1547:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/usb/cx231xx/cx231xx-video.c:1091:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/usb/cx231xx/cx231xx-cards.c:774:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/cx88/cx88-dvb.c:1577:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/cx88/cx88-video.c:390:25: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/cx88/cx88-cards.c:3528:17: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/cx88/cx88-core.c:1013:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/cx88/cx88-blackbird.c:844:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/cx88/cx88-alsa.c:730:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/common/saa7146/saa7146_video.c:1007:16: sparse: no member 'list' in struct v4l2_subdev
drivers/staging/media/go7007/go7007-v4l2.c:267:17: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/ivtv/ivtv-vbi.c:41:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/ivtv/ivtvfb.c:925:17: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/ivtv/ivtv-i2c.c:326:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/ivtv/ivtv-ioctl.c:710:16: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/ivtv/ivtv-firmware.c:286:17: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/ivtv/ivtv-routing.c:56:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/ivtv/ivtv-controls.c:85:17: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/ivtv/ivtv-driver.c:978:17: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/ivtv/ivtv-fileops.c:160:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/usb/au0828/au0828-video.c:1073:17: sparse: no member 'list' in struct v4l2_subdev
drivers/media/usb/au0828/au0828-cards.c:234:17: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/saa7134/saa7134-video.c:628:17: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/saa7134/saa7134-empress.c:78:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/saa7134/saa7134-dvb.c:204:9: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/saa7134/saa7134-cards.c:7612:17: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/saa7134/saa7134-core.c:1044:17: sparse: no member 'list' in struct v4l2_subdev
drivers/media/pci/saa7146/mxb.c:560:16: sparse: no member 'list' in struct v4l2_subdev

[coccinelle]
drivers/block/aoe/aoedev.c:490:8-9: ERROR: reference preceded by free on line 463

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
