From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 26 May 2013 02:42:50 +0000
Subject: build regressions 2013-05-25
Message-Id: <51a176aa.PM6ZkRBcVBf2OnGa%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[sparse]
drivers/usb/gadget/f_rndis.c:969:21: sparse: symbol 'rndis_alloc' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
