From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 04 Nov 2012 16:25:16 +0000
Subject: build regressions 2012-11-04
Message-Id: <20121104162516.GA12836@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/net/ethernet/adi/bfin_mac.c:694:2: error: implicit declaration of function 'bfin_read_EMAC_PTP_CTL' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:702:3: error: implicit declaration of function 'bfin_write_EMAC_PTP_FV3' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:712:3: error: implicit declaration of function 'bfin_write_EMAC_PTP_CTL' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:717:3: error: implicit declaration of function 'bfin_write_EMAC_PTP_FOFF' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:723:3: error: implicit declaration of function 'bfin_write_EMAC_PTP_FV1' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:725:3: error: implicit declaration of function 'bfin_write_EMAC_PTP_FV2' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:804:14: error: 'PTP_EN' undeclared (first use in this function)
drivers/net/ethernet/adi/bfin_mac.c:815:3: error: implicit declaration of function 'bfin_read_EMAC_PTP_RXSNAPLO' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:816:3: error: implicit declaration of function 'bfin_read_EMAC_PTP_RXSNAPHI' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:818:3: error: implicit declaration of function 'bfin_read_EMAC_PTP_TXSNAPLO' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:819:3: error: implicit declaration of function 'bfin_read_EMAC_PTP_TXSNAPHI' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:847:3: error: implicit declaration of function 'bfin_read_EMAC_PTP_ISTAT' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:847:42: error: 'TXTL' undeclared (first use in this function)
drivers/net/ethernet/adi/bfin_mac.c:876:39: error: 'RXEL' undeclared (first use in this function)
drivers/net/ethernet/adi/bfin_mac.c:900:2: error: implicit declaration of function 'bfin_write_EMAC_PTP_ADDEND' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:917:2: error: implicit declaration of function 'bfin_read_EMAC_PTP_TIMELO' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:918:2: error: implicit declaration of function 'bfin_read_EMAC_PTP_TIMEHI' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:935:2: error: implicit declaration of function 'bfin_write_EMAC_PTP_TIMELO' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:936:2: error: implicit declaration of function 'bfin_write_EMAC_PTP_TIMEHI' [-Werror=implicit-function-declaration]
rwsem.c:(.text+0x53c90): undefined reference to `__elide_lock'
rwsem.c:(.text+0x53cb6): undefined reference to `rwsem_elision'
(.text+0x5412d): undefined reference to `__elide_unlock'
swap.c:(.text+0x17a17): undefined reference to `bitlock_elision'
kernel/sched/cputime.c:367:2: error: implicit declaration of function 'cputime_to_scaled' [-Werror=implicit-function-declaration]

[warnings]
include/linux/rtm.h:8:0: warning: "_XBEGIN_STARTED" redefined [enabled by default]
net/sched/sch_htb.c:921:26: warning: integer overflow in expression [-Woverflow]
drivers/xen/xen-selfballoon.c:577:1: warning: initialization from incompatible pointer type [enabled by default]

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
