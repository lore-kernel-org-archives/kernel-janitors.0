From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 23 May 2013 16:00:48 +0000
Subject: build regressions 2013-05-23
Message-Id: <519e3d30.DYFx6+/eX/hC4qa5%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/block/virtio_blk.c:426:2: error: implicit declaration of function 'blk_mq_execute_rq' [-Werror=implicit-function-declaration]
(.text+0x1525b): undefined reference to `__divdi3'
/c/kernel-tests/src/tip/arch/s390/include/asm/pgtable.h:1354:62: error: expected declaration specifiers or '...' before ',' token
drivers/net/ethernet/sun/sunbmac.c:1021:8: error: 'i' undeclared (first use in this function)
drivers/xen/tmem.c:410:7: error: 'frontswap' undeclared (first use in this function)

[warnings]
drivers/staging/imx-drm/imx-tve.c:673:19: warning: ignoring return value of 'regulator_enable', declared with attribute warn_unused_result [-Wunused-result]
lib/locking-selftest.c:1168: warning: type defaults to 'int' in declaration of '__dummy2'
drivers/base/reservation.c:90: warning: 'ticket_backoff_early' defined but not used

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
