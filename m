From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 13 Sep 2013 16:06:25 +0000
Subject: build regressions 2013-09-13
Message-Id: <52333801.F/ZtiXysPZwoekBQ%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
sound/soc/sh/rcar/adg.c:11:24: fatal error: mach/clock.h: No such file or directory
include/linux/omap-dma.h:171:8: error: expected identifier before numeric constant
ERROR: "cpufreq_transition_complete" [drivers/cpufreq/powernow-k8.ko] undefined!
mm/memory.c:3606:2: error: incompatible type for argument 2 of 'huge_pmd_lock'

[warnings]
fs/proc/task_mmu.c:66:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 13 has type 'unsigned int' [-Wformat=]
drivers/staging/comedi/drivers/dt2801.c:273:14: warning: 'hb' is used uninitialized in this function [-Wuninitialized]
drivers/staging/comedi/drivers/dt2801.c:273:20: warning: 'lb' is used uninitialized in this function [-Wuninitialized]
drivers/usb/misc/usbled.c:139:4: warning: passing argument 5 of 'usb_interrupt_msg' from incompatible pointer type [enabled by default]
drivers/net/ethernet/intel/i40e/i40e.h:96:0: warning: "prefetch" redefined [enabled by default]

[sparse]
drivers/usb/misc/usbled.c:139:37: sparse: incorrect type in argument 5 (different type sizes) @@    expected int *actual_length @@    got unsigned lint *actual_length @@
kernel/params.c:510:18: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3>*__vpp_verify @@    got eref] <asn:3>*__vpp_verify @@
kernel/params.c:520:27: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3>*__vpp_verify @@    got eref] <asn:3>*__vpp_verify @@
include/linux/bit_spinlock.h:75:25: sparse: context imbalance in '__wait_cp_io' - unexpected unlock
fs/jbd/checkpoint.c:439:20: sparse: context imbalance in 'log_do_checkpoint' - unexpected unlock
fs/jbd/checkpoint.c:557:12: sparse: context imbalance in 'journal_clean_one_cp_list' - different lock contexts for basic block
drivers/net/xen-netback/netback.c:220:14: sparse: symbol 'xenvif_count_frag_slots' was not declared. Should it be static?
net/ceph/osd_client.c:2222:13: sparse: function 'ceph_osdc_flush_notifies' with external linkage has definition
mm/huge_memory.c:1441:28: sparse: context imbalance in 'move_huge_pmd' - unexpected unlock
mm/rmap.c:684:36: sparse: context imbalance in 'page_referenced_one' - unexpected unlock
mm/huge_memory.c:1511:7: sparse: context imbalance in 'page_check_address_pmd' - different lock contexts for basic block
mm/huge_memory.c:1573:17: sparse: context imbalance in '__split_huge_page_splitting' - unexpected unlock
arch/x86/include/asm/paravirt.h:545:17: sparse: context imbalance in '__split_huge_page_map' - unexpected unlock
mm/memory.c:3606:33: sparse: incorrect type in argument 2 (different base types) @@    expected struct pmd_t [usertype] *pmd @@    got truct pmd_t [usertype] *pmd @@
drivers/staging/android/./binder_trace.h:87:1: sparse: expression using sizeof bool
arch/x86/kernel/rtm-test.c:5:5: sparse: symbol 'x' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
