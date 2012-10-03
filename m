From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 03 Oct 2012 01:33:58 +0000
Subject: ERROR: "ipoib_set_mode" [drivers/infiniband/ulp/ipoib/ib_ipoib.ko] undefined!
Message-Id: <20121003013358.GB10351@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Or Gerlitz,

FYI, kernel build failed on

commit: 862096a8bbf8f992f6d0a1a8786ffd3fc7437e48  IB/ipoib: Add more rtnl_link_ops callbacks
config: ia64-defconfig

All error/warnings:

ERROR: "ipoib_set_mode" [drivers/infiniband/ulp/ipoib/ib_ipoib.ko] undefined!

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
