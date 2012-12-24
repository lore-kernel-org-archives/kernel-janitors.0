From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 24 Dec 2012 17:22:14 +0000
Subject: build regressions 2012-12-24
Message-Id: <50d88f46.65V9smZajkuo4bg+%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
coretemp.c:(.text+0x12cc56e): undefined reference to `__divdi3'
drivers/gpio/gpiolib.c:785:43: error: 'gpio_attr_group' undeclared (first use in this function)

[warnings]
fs/f2fs/node.c:735:8: warning: 'nofs' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/media/usb/tm6000/tm6000-video.c:1926:1: warning: return from incompatible pointer type [enabled by default]
fs/f2fs/gc.c:453:21: warning: 'bidx' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/f2fs/gc.c:581:14: warning: 'nofs' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/f2fs/recovery.c:223:27: warning: 'sum.nid' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/f2fs/recovery.c:224:52: warning: 'sum.<U3980>.<U38e8>.ofs_in_node' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/f2fs/recovery.c:224:52: warning: 'sum.<Uc850>.<Uc7b8>.ofs_in_node' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/f2fs/recovery.c:224:52: warning: 'sum.<U be0>.<U b48>.ofs_in_node' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/f2fs/recovery.c:224:52: warning: 'sum.<U68e8>.<U6850>.ofs_in_node' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/f2fs/recovery.c:224:52: warning: 'sum.<U1980>.<U18e8>.ofs_in_node' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/f2fs/recovery.c:224:52: warning: 'sum.<Uc8e8>.<Uc850>.ofs_in_node' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/f2fs/recovery.c:224:52: warning: 'sum.<U5980>.<U58e8>.ofs_in_node' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/f2fs/recovery.c:224:52: warning: 'sum.<Uf980>.<Uf8e8>.ofs_in_node' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
drivers/gpio/gpiolib.c:785:50: sparse: undefined identifier 'gpio_attr_group'

[smatch]
drivers/media/usb/tm6000/tm6000-video.c:569 tm6000_alloc_urb_buffers() warn: buffer overflow 'dev->urb_dma' 4 <= 7
drivers/media/usb/tm6000/tm6000-video.c:720 tm6000_prepare_isoc() error: we previously assumed 'dev->urb_buffer' could be null (see line 698)

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
