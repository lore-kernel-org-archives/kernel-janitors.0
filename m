From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 28 Sep 2013 22:03:15 +0000
Subject: build regressions 2013-09-28
Message-Id: <52475223.BEpBMMmSvc4yxVX3%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/staging/iio/trigger/iio-trig-bfin-timer.c:118:16: error: invalid storage class for function 'iio_bfin_tmr_frequency_show'
drivers/staging/iio/trigger/iio-trig-bfin-timer.c:135:8: error: initializer element is not constant
drivers/staging/iio/trigger/iio-trig-bfin-timer.c:152:20: error: invalid storage class for function 'iio_bfin_tmr_trigger_isr'
drivers/staging/iio/trigger/iio-trig-bfin-timer.c:162:12: error: invalid storage class for function 'iio_bfin_tmr_get_number'
drivers/staging/iio/trigger/iio-trig-bfin-timer.c:178:12: error: invalid storage class for function 'iio_bfin_tmr_trigger_probe'
drivers/staging/iio/trigger/iio-trig-bfin-timer.c:273:12: error: invalid storage class for function 'iio_bfin_tmr_trigger_remove'
drivers/staging/iio/trigger/iio-trig-bfin-timer.c:293:2: error: initializer element is not constant
drivers/staging/iio/trigger/iio-trig-bfin-timer.c:294:2: error: initializer element is not constant
drivers/staging/iio/trigger/iio-trig-bfin-timer.c:297:1: error: invalid storage class for function 'iio_bfin_tmr_trigger_driver_init'
drivers/staging/iio/trigger/iio-trig-bfin-timer.c:297:1: error: initializer element is not constant
drivers/staging/iio/trigger/iio-trig-bfin-timer.c:297:1: error: invalid storage class for function 'iio_bfin_tmr_trigger_driver_exit'
drivers/staging/iio/trigger/iio-trig-bfin-timer.c:297:1: error: initializer element is not constant
drivers/staging/iio/trigger/iio-trig-bfin-timer.c:302:1: error: expected declaration or statement at end of input
drivers/infiniband/core/uverbs_main.c:120:2: error: subscripted value is neither array nor pointer nor vector
/bin/sh: 1: microblaze-linux-gcc-4.7: not found
/bin/sh: 1: am33_2.0-linux-gcc-4.7: not found
/bin/sh: 1: or32-linux-gcc-4.7: not found

[warnings]
drivers/staging/iio/trigger/iio-trig-bfin-timer.c:118:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
drivers/staging/iio/trigger/iio-trig-bfin-timer.c:297:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
drivers/staging/iio/trigger/iio-trig-bfin-timer.c:299:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]

[sparse]
drivers/infiniband/core/uverbs_main.c:120:9: sparse: arithmetics on pointers to functions
drivers/media/usb/gspca/stk1135.c:615:6: sparse: symbol 'stk1135_try_fmt' was not declared. Should it be static?
drivers/media/usb/gspca/stk1135.c:627:5: sparse: symbol 'stk1135_enum_framesizes' was not declared. Should it be static?
fs/hfsplus/xattr.c:151:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
fs/hfsplus/xattr.c:161:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
fs/hfsplus/xattr.c:164:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
fs/hfsplus/xattr.c:190:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
arch/x86/lib/misc.c:1:5: sparse: symbol 'num_digits' was not declared. Should it be static?

[coccinelle]
drivers/usb/host/pci-quirks.c:863:3-9: ERROR: missing iounmap; ioremap on line 849 and execution via conditional on line 859
lib/lockref.c:48:2-8: preceding lock on line 46
lib/lockref.c:64:2-8: preceding lock on line 62

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
