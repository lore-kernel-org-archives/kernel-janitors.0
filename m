From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 23 May 2013 00:42:37 +0000
Subject: build regressions 2013-05-22
Message-Id: <519d65fd.UC1j9SOKV1yvDx32%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
tuner-core.c:(.text+0x2cd488): undefined reference to `tea5767_attach'
tuner-core.c:(.text+0x2cd945): undefined reference to `tea5767_autodetection'
saa7134-dvb.c:(.text+0x32258f): undefined reference to `tda10046_attach'
saa7134-dvb.c:(.text+0x3225b9): undefined reference to `tda827x_attach'
saa7134-dvb.c:(.text+0x322c07): undefined reference to `tda10046_attach'
saa7134-dvb.c:(.text+0x322c52): undefined reference to `tda10046_attach'
saa7134-dvb.c:(.text+0x322ca5): undefined reference to `tda10046_attach'
saa7134-dvb.c:(.text+0x322dc9): undefined reference to `isl6421_attach'
saa7134-dvb.c:(.text+0x322df7): undefined reference to `tda10046_attach'
saa7134-dvb.c:(.text+0x322e11): undefined reference to `tda827x_attach'
saa7134-dvb.c:(.text+0x322ef6): undefined reference to `isl6405_attach'
saa7134-dvb.c:(.text+0x322fff): undefined reference to `isl6421_attach'
saa7134-dvb.c:(.text+0x32302d): undefined reference to `tda10046_attach'
saa7134-dvb.c:(.text+0x323070): undefined reference to `tda10046_attach'
saa7134-dvb.c:(.text+0x3231fa): undefined reference to `isl6405_attach'
saa7134-dvb.c:(.text+0x339227): undefined reference to `lgdt3305_attach'
saa7134-dvb.c:(.text+0x339667): undefined reference to `lnbp21_attach'
saa7134-dvb.c:(.text+0x33982c): undefined reference to `lnbp21_attach'
saa7134-dvb.c:(.text+0x3398a9): undefined reference to `lnbp21_attach'
saa7134-dvb.c:(.text+0x339a14): undefined reference to `mb86a20s_attach'
ERROR: "blk_mq_alloc_request" undefined!
include/asm-generic/uaccess.h:36:2: error: implicit declaration of function 'segment_eq' [-Werror=implicit-function-declaration]
include/asm-generic/uaccess.h:36:2: error: implicit declaration of function 'get_fs' [-Werror=implicit-function-declaration]
include/asm-generic/uaccess.h:36:6: error: 'KERNEL_DS' undeclared (first use in this function)
include/asm-generic/uaccess.h:36:2: error: implicit declaration of function 'segment_eq' [-Werror=implicit-function-declaration]
include/asm-generic/uaccess.h:36:2: error: implicit declaration of function 'get_fs' [-Werror=implicit-function-declaration]
include/asm-generic/uaccess.h:36:6: error: 'KERNEL_DS' undeclared (first use in this function)
drivers/pinctrl/sh-pfc/core.c:410:26: error: 'sh_pfc_of_table' undeclared (first use in this function)
drivers/pinctrl/sh-pfc/core.c:559:3: error: implicit declaration of function 'of_match_ptr' [-Werror=implicit-function-declaration]
drivers/pinctrl/sh-pfc/core.c:559:34: error: 'sh_pfc_of_table' undeclared here (not in a function)
/c/kernel-tests/src/tip/arch/x86/include/asm/sections.h:8:37: error: array type has incomplete element type
/c/kernel-tests/src/tip/include/asm-generic/uaccess.h:36:2: error: implicit declaration of function 'segment_eq' [-Werror=implicit-function-declaration]
/c/kernel-tests/src/tip/include/asm-generic/uaccess.h:36:2: error: implicit declaration of function 'get_fs' [-Werror=implicit-function-declaration]
/c/kernel-tests/src/tip/include/asm-generic/uaccess.h:36:6: error: 'KERNEL_DS' undeclared (first use in this function)
usb.c:(.text+0x1a9643): undefined reference to `usb_kill_anchored_urbs'
usb.c:(.text+0x1a9726): undefined reference to `usb_kill_anchored_urbs'
usb.c:(.text+0x1a9750): undefined reference to `usb_kill_anchored_urbs'
usb.c:(.text+0x1aa158): undefined reference to `usb_anchor_urb'
usb.c:(.text+0x1aa1d8): undefined reference to `usb_kill_anchored_urbs'
usb.c:(.text+0x1aa3f7): undefined reference to `usb_anchor_urb'
usb.c:(.text+0x1aa488): undefined reference to `usb_unanchor_urb'
usb.c:(.text+0x1aa8fe): undefined reference to `usb_anchor_urb'
usb.c:(.text+0x1aaa11): undefined reference to `usb_unanchor_urb'
usb.c:(.text+0x1f12eb): undefined reference to `usb_get_from_anchor'
cx88-dvb.c:(.text+0x29f329): undefined reference to `vp3054_i2c_remove'
cx88-dvb.c:(.text+0x29f6b3): undefined reference to `vp3054_i2c_probe'

[warnings]
drivers/tty/mxser.c:1680:3: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
drivers/gpu/drm/i915/i915_gem.c:2978:3: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t' [-Wformat]
drivers/block/paride/bpck.c:32:0: warning: "PC" redefined [enabled by default]
drivers/mfd/arizona-core.c:474:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
