From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 29 Sep 2013 16:13:31 +0000
Subject: build regressions 2013-09-29
Message-Id: <524851ab.mTQGE0+2iHyAWF24%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
docproc: fs/sysfs/bin.c: No such file or directory
drivers/staging/dgap/dgap_driver.c:466:3: error: implicit declaration of function 'iounmap' [-Werror=implicit-function-declaration]
drivers/staging/dgap/dgap_driver.c:705:2: error: implicit declaration of function 'ioremap' [-Werror=implicit-function-declaration]
include/acpi/platform/aclinux.h:176:2: error: expected identifier or '(' before '{' token

[warnings]
fs/sysfs/file.c:220:120: warning: comparison of distinct pointer types lacks a cast [enabled by default]
Warning(include/net/sock.h:411): No description found for parameter 'sk_max_pacing_rate'
drivers/staging/comedi/drivers/ni_at_ao.c:113:0: warning: "RSI" redefined [enabled by default]
drivers/staging/dgap/dgap_driver.c:705:22: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/staging/dgap/dgap_driver.c:713:19: warning: assignment makes pointer from integer without a cast [enabled by default]
WARNING: vmlinux.o(.text+0x49f376): Section mismatch in reference from the function acpi_terminate() to the function .exit.text:acpi_os_terminate()
fs/sysfs/file.c:340:18: warning: unused variable 'kobj' [-Wunused-variable]

[sparse]
mm/mmap.c:420:36: sparse: context imbalance in 'validate_mm' - different lock contexts for basic block
mm/mmap.c:850:9: sparse: context imbalance in 'vma_adjust' - different lock contexts for basic block
mm/mmap.c:2220:28: sparse: context imbalance in 'expand_downwards' - different lock contexts for basic block
mm/mmap.c:2953:9: sparse: context imbalance in 'vm_lock_anon_vma' - different lock contexts for basic block
mm/mmap.c:3073:38: sparse: context imbalance in 'vm_unlock_anon_vma' - unexpected unlock
mm/rmap.c:222:25: sparse: context imbalance in 'anon_vma_clone' - unexpected unlock
mm/rmap.c:222:25: sparse: context imbalance in 'unlink_anon_vmas' - unexpected unlock
include/linux/rcupdate.h:795:9: sparse: context imbalance in 'page_lock_anon_vma_read' - different lock contexts for basic block
mm/rmap.c:507:6: sparse: context imbalance in 'page_unlock_anon_vma_read' - unexpected unlock
mm/rmap.c:1698:27: sparse: context imbalance in 'rmap_walk_anon' - unexpected unlock
mm/ksm.c:1911:17: sparse: context imbalance in 'page_referenced_ksm' - unexpected unlock
mm/ksm.c:1964:17: sparse: context imbalance in 'try_to_unmap_ksm' - unexpected unlock
mm/ksm.c:2016:17: sparse: context imbalance in 'rmap_walk_ksm' - unexpected unlock

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
