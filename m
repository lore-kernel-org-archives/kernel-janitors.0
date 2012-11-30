From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 30 Nov 2012 20:55:08 +0000
Subject: build regressions 2012-11-30
Message-Id: <50b91d2c.v5oK+mXy8cCF93MA%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/pci/msi.c:345:3: error: 'for' loop initial declarations are only allowed in C99 mode

[warnings]
sound/pci/hda/patch_realtek.c:1129:4: warning: 'return' with no value, in function returning non-void [-Wreturn-type]
kernel/sched/fair.c:2604:18: warning: 'sum_nr_running' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/sched/fair.c:2604:18: warning: 'nr_running' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
include/trace/events/filemap.h:14:1: sparse: incompatible types for operation (<)
drivers/block/drbd/drbd_int.h:2339:9: sparse: preprocessor token __wait_event_lock_irq redefined
drivers/block/drbd/drbd_int.h:2358:9: sparse: preprocessor token wait_event_lock_irq redefined
sound/pci/hda/patch_realtek.c:1129:25: sparse: return with no return value

[coccinelle]
drivers/virtio/virtio_balloon.c:157:2-8: preceding lock on line 136

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
