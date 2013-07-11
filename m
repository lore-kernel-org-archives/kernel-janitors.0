From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 11 Jul 2013 17:34:17 +0000
Subject: build regressions 2013-07-11
Message-Id: <51deec99.XWxspeL2Aeg6jAkT%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/video/uvesafb.c:1563: error: implicit declaration of function 'ioremap_wc'
ERROR: "i915_error_state_put" undefined!
ERROR: "i915_error_state_get" undefined!
ERROR: "i915_error_state_buf_init" undefined!
ERROR: "i915_error_state_to_str" undefined!
drivers/usb/serial/usb-serial.c:99:3: error: too many arguments to function 'idr_alloc'

[warnings]
drivers/net/wireless/ath/ath10k/core.c:79: warning: comparison is always true due to limited range of data type

[sparse]
fs/ext4/extents.c:502:24: sparse: incorrect type in assignment (different base types) @@    expected int [signed] i @@    got restricted __le1int [signed] i @@

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
