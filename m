From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 29 Jul 2013 02:37:20 +0000
Subject: build regressions 2013-07-28
Message-Id: <51f5d560.EzhXTNs1IsZC0nIp%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
pktgen.c:(.text+0x531e7): undefined reference to `udp4_hwcsum'
pktgen.c:(.text+0x5314d): undefined reference to `ip_send_check'
pktgen.c:(.text.unlikely+0x1ce1): undefined reference to `udp4_hwcsum'
pktgen.c:(.text.unlikely+0x1c32): undefined reference to `ip_send_check'
net/core/pktgen.c:2907:3: error: implicit declaration of function 'csum_ipv6_magic' [-Werror=implicit-function-declaration]
ERROR: "udp4_hwcsum" [net/core/pktgen.ko] undefined!
ERROR: "ip_send_check" [net/core/pktgen.ko] undefined!
ERROR: "udp4_hwcsum" undefined!
ERROR: "ip_send_check" undefined!

[sparse]
net/core/pktgen.c:2772:38: sparse: incorrect type in argument 2 (different base types) @@    expected restricted __be32 [usertype] src @@    got restricted __be32 [usertype] src @@
net/core/pktgen.c:2772:52: sparse: incorrect type in argument 3 (different base types) @@    expected restricted __be32 [usertype] dst @@    got restricted __be32 [usertype] dst @@
net/core/pktgen.c:2777:53: sparse: incorrect type in argument 1 (different base types) @@    expected restricted __be32 [usertype] saddr @@    got restricted __be32 [usertype] saddr @@
net/core/pktgen.c:2777:67: sparse: incorrect type in argument 2 (different base types) @@    expected restricted __be32 [usertype] daddr @@    got restricted __be32 [usertype] daddr @@

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
