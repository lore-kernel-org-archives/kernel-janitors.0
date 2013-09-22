From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 22 Sep 2013 17:48:53 +0000
Subject: build regressions 2013-09-22
Message-Id: <523f2d85.C2y+axw+xg397Ea4%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/kernel/time.c:123:3: error: implicit declaration of function 'of_clk_init' [-Werror=implicit-function-declaration]

[coccinelle]
fs/btrfs/ioctl.c:2730:8-15: WARNING opportunity for memdup_user

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
