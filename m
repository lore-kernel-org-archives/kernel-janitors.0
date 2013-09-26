From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 26 Sep 2013 17:25:18 +0000
Subject: build regressions 2013-09-26
Message-Id: <52446dfe.8RcfV/8ZI4XSY/QX%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
mm/page_alloc.c:663:2: error: implicit declaration of function 'should_evacuate_region' [-Werror=implicit-function-declaration]
mm/page_alloc.c:779:3: error: implicit declaration of function 'queue_mempower_work' [-Werror=implicit-function-declaration]
sound/soc/omap/omap-pcm.c:205:2: error: implicit declaration of function 'dma_coerce_mask_and_coherent' [-Werror=implicit-function-declaration]
arch/x86/mm/init_32.c:754:2: error: implicit declaration of function 'set_highmem_pages_init' [-Werror=implicit-function-declaration]
arch/x86/kernel/apic/numaq_32.c:84:17: error: 'numa_nodes_parsed' undeclared (first use in this function)
arch/x86/kernel/apic/numaq_32.c:85:2: error: implicit declaration of function 'numa_add_memblk' [-Werror=implicit-function-declaration]
arch/x86/kernel/cpu/common.c:936:2: error: implicit declaration of function 'numa_add_cpu' [-Werror=implicit-function-declaration]
arch/x86/kernel/cpu/intel.c:291:2: error: implicit declaration of function 'numa_cpu_node' [-Werror=implicit-function-declaration]
arch/x86/kernel/cpu/intel.c:296:2: error: implicit declaration of function 'numa_set_node' [-Werror=implicit-function-declaration]
arch/x86/kernel/cpu/amd.c:275:10: error: '__apicid_to_node' undeclared (first use in this function)
arch/x86/kernel/cpu/amd.c:379:2: error: implicit declaration of function 'numa_cpu_node' [-Werror=implicit-function-declaration]
arch/x86/kernel/cpu/amd.c:414:7: error: '__apicid_to_node' undeclared (first use in this function)
arch/x86/kernel/cpu/amd.c:420:2: error: implicit declaration of function 'numa_set_node' [-Werror=implicit-function-declaration]
arch/x86/kernel/apic/apic.c:1339:3: error: implicit declaration of function 'set_apicid_to_node' [-Werror=implicit-function-declaration]
rcutree.c:(.text+0x642f4): undefined reference to `resched_cpu'
(.text+0x8ae2): undefined reference to `compact_range'
drivers/mmc/host/sdhci-of-esdhc.c:229:179: error: 'host_clock' undeclared (first use in this function)
sound/soc/atmel/atmel-pcm.c:77:2: error: implicit declaration of function 'dma_coerce_mask_and_coherent' [-Werror=implicit-function-declaration]
sound/soc/kirkwood/kirkwood-dma.c:293:2: error: implicit declaration of function 'dma_coerce_mask_and_coherent' [-Werror=implicit-function-declaration]
arch/x86/kernel/mmconf-fam10h_64.c:187:8: error: 'acpi_pci_disabled' undeclared (first use in this function)
arch/x86/xen/setup.c:572:3: error: implicit declaration of function 'disable_acpi' [-Werror=implicit-function-declaration]
include/linux/slab_def.h:118:30: error: conflicting types for 'kmalloc'
page_alloc.c:(.text+0x6f16): undefined reference to `compact_range'
page_alloc.c:(.text+0x93f9): undefined reference to `should_evacuate_region'
page_alloc.c:(.text+0x940b): undefined reference to `queue_mempower_work'
drivers/xen/xen-acpi-pad.c:174:2: error: implicit declaration of function 'xen_initial_domain' [-Werror=implicit-function-declaration]
mm/page_alloc.c:652:21: error: 'ZONE_DMA' undeclared (first use in this function)
ERROR: "cfc_write_array_to_buffer" [drivers/staging/comedi/drivers/ni_atmio.ko] undefined!

[warnings]
drivers/gpu/drm/i915/i915_gem.c:1402:3: warning: 'set_need_resched' is deprecated (declared at include/linux/thread_info.h:107) [-Wdeprecated-declarations]
drivers/gpu/drm/ttm/ttm_bo_vm.c:70:4: warning: 'set_need_resched' is deprecated (declared at include/linux/thread_info.h:107) [-Wdeprecated-declarations]
drivers/gpu/drm/ttm/ttm_bo_vm.c:80:4: warning: 'set_need_resched' is deprecated (declared at include/linux/thread_info.h:107) [-Wdeprecated-declarations]
drivers/gpu/drm/udl/udl_gem.c:100:3: warning: 'set_need_resched' is deprecated (declared at include/linux/thread_info.h:107) [-Wdeprecated-declarations]
drivers/misc/mei/hbm.c:49:39: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'unsigned int' [-Wformat=]

[sparse]
fs/jbd/commit.c:105:12: sparse: context imbalance in 'inverted_lock' - wrong count at exit
fs/jbd/checkpoint.c:557:12: sparse: context imbalance in 'journal_clean_one_cp_list' - wrong count at exit
drivers/infiniband/hw/qib/qib_verbs.h:1061:36: sparse: crazy programmer
include/linux/rcupdate.h:322:30: sparse: context imbalance in 'ip_vs_conn_array' - unexpected unlock
include/linux/uaccess.h:33:9: sparse: context imbalance in 'psb_mmu_pt_unmap_unlock' - unexpected unlock
include/linux/rcupdate.h:322:30: sparse: context imbalance in 'pnfs_layout_bulk_destroy_byserver_locked' - unexpected unlock
include/linux/rcupdate.h:322:30: sparse: context imbalance in 'rcu_lock_break' - unexpected unlock
include/linux/rcupdate.h:322:30: sparse: context imbalance in 'avc_compute_av' - unexpected unlock
mm/compaction.c:1340:5: sparse: symbol 'kmempowerd_init' was not declared. Should it be static?
drivers/usb/host/pci-quirks.c:121:5: sparse: symbol 'amd_chipset_sb_type_init' was not declared. Should it be static?
drivers/usb/core/quirks.c:200:5: sparse: symbol 'usb_amd_resume_quirk' was not declared. Should it be static?
kernel/user_namespace.c:105:9: sparse: undefined identifier 'rwsem_init'
drivers/usb/host/pci-quirks.c:253:5: sparse: symbol 'usb_hcd_amd_remote_wakeup_quirk' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
