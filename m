From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 03 Jun 2013 16:19:37 +0000
Subject: build regressions 2013-06-03
Message-Id: <51acc219.1KCuJpo7R/bx+Brp%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
lib/list_lru.c:432:6: error: redefinition of 'list_lru_destroy'
include/asm-generic/rtc.h:40:2: error: implicit declaration of function 'CMOS_READ' [-Werror=implicit-function-declaration]
include/asm-generic/rtc.h:85:33: error: 'RTC_ALWAYS_BCD' undeclared (first use in this function)
include/asm-generic/rtc.h:165:9: error: 'RTC_ALWAYS_BCD' undeclared (first use in this function)
include/asm-generic/rtc.h:175:2: error: implicit declaration of function 'CMOS_WRITE' [-Werror=implicit-function-declaration]
ERROR: "driver_deferred_probe_trigger" [drivers/base/firmware_class.ko] undefined!
dm1105.c:(.text+0x2d7ffd): undefined reference to `ds3000_attach'
budget.c:(.text+0x1fff84): undefined reference to `tda8083_attach'

[warnings]
drivers/spi/spi-pxa2xx.c:1181:3: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/spi/spi-gpio.c:446:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]

[coccinelle]
drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c:618:2-3: Unneeded semicolon
drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c:618:2-3: Unneeded semicolon

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
