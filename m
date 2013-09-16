From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 16 Sep 2013 00:51:39 +0000
Subject: build regressions 2013-09-15
Message-Id: <5236561b.CLkP5Ug6mG/r2YlR%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
(.data+0x67a04): undefined reference to `vb2_ops_wait_prepare'
(.data+0x67a08): undefined reference to `vb2_ops_wait_finish'
kernel/rcutree.c:732:6: error: redefinition of 'rcu_watching_this_cpu'
include/linux/rcutiny.h:137:20: error: static declaration of 'rcu_watching_this_cpu' follows non-static declaration

[coccinelle]
drivers/staging/rtl8188eu/core/rtw_wlan_util.c:1414:7-49: duplicated argument to && or ||
drivers/staging/rtl8188eu/core/rtw_mlme_ext.c:4420:2-29: code aligned with following code on line 4422
drivers/staging/rtl8188eu/core/rtw_mlme_ext.c:8030:3-9: Replace memcpy with struct assignment
drivers/staging/dgnc/dgnc_driver.c:510:3-7: WARNING: casting value returned by k[cmz]alloc to (char *) is useless.
drivers/staging/dgnc/dgnc_driver.c:502:2-16: WARNING: casting value returned by k[cmz]alloc to (struct board_t *) is useless.
drivers/staging/dgnc/dgnc_tty.c:554:41-42: WARNING comparing pointer to 0
drivers/staging/dgap/dgap_tty.c:604:41-42: WARNING comparing pointer to 0
drivers/staging/dgap/dgap_tty.c:1118:25-26: WARNING comparing pointer to 0
drivers/staging/dgnc/dgnc_driver.c:502:2-19: WARNING: casting value returned by k[cmz]alloc to (struct dgnc_board *) is useless.

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
