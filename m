From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 20 Feb 2013 17:52:05 +0000
Subject: build regressions 2013-02-20
Message-Id: <51250d45.mFGrgp0FcSt1i3r+%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
da9055_wdt.c:(.text+0x167c56): undefined reference to `watchdog_unregister_device'
da9055_wdt.c:(.text+0x167dc4): undefined reference to `watchdog_register_device'
/bin/bash: line 1:  4356 Done                    cat arch/x86/boot/compressed/vmlinux.bin arch/x86/boot/compressed/vmlinux.relocs
(.text+0x115181): undefined reference to `crc32c'
(.text+0x11518f): undefined reference to `crc32c'
(.text+0x1151a6): undefined reference to `crc32c'
(.text+0x11556f): undefined reference to `crc32c'
(.text+0x11557d): undefined reference to `crc32c'
arch/mips/mm/dma-default.c:118:9: error: 'hw_coherentio' undeclared (first use in this function)
arch/mips/mm/dma-default.c:147:8: error: 'hw_coherentio' undeclared (first use in this function)
drivers/net/ethernet/qlogic/qlcnic/qlcnic_hw.c:607:63: error: macro "hlist_for_each_entry_safe" passed 5 arguments, but takes just 4
drivers/net/ethernet/qlogic/qlcnic/qlcnic_hw.c:607:3: error: 'hlist_for_each_entry_safe' undeclared (first use in this function)
drivers/net/ethernet/qlogic/qlcnic/qlcnic_hw.c:608:3: error: expected ';' before '{' token
drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c:182:63: error: macro "hlist_for_each_entry_safe" passed 5 arguments, but takes just 4
drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c:182:3: error: 'hlist_for_each_entry_safe' undeclared (first use in this function)
drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c:182:65: error: expected ';' before '{' token
drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c:208:63: error: macro "hlist_for_each_entry_safe" passed 5 arguments, but takes just 4
drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c:208:65: error: expected ';' before '{' token
net/rose/af_rose.c:1578:51: error: 'rose_info_fops' undeclared (first use in this function)
kernel/sched/core.c:1650:7: error: 'struct sched_entity' has no member named 'avg'

[warnings]
block/partitions/efi.c:324:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'unsigned int' [-Wformat]
include/linux/list.h:588:21: warning: 'tmp_fil' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/sunrpc/svcauth_unix.c:505:17: warning: 'id' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c:169:13: warning: unused variable 'found' [-Wunused-variable]
drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c:167:16: warning: unused variable 'time' [-Wunused-variable]
drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c:165:33: warning: unused variable 'n' [-Wunused-variable]
drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c:165:21: warning: unused variable 'tmp_hnode' [-Wunused-variable]
warning: (ATH9K_DEBUGFS) selects MAC80211_DEBUGFS which has unmet direct dependencies (NET && WIRELESS && MAC80211 && DEBUG_FS)
warning: (ATH9K_DEBUGFS) selects MAC80211_DEBUGFS which has unmet direct dependencies (NET && WIRELESS && MAC80211 && DEBUG_FS)
warning: (ATH9K_DEBUGFS) selects MAC80211_DEBUGFS which has unmet direct dependencies (NET && WIRELESS && MAC80211 && DEBUG_FS)
warning: (VIDEOBUF2_CORE && VIDEOBUF2_DMA_CONTIG && VIDEOBUF2_VMALLOC && DRM) selects DMA_SHARED_BUFFER which has unmet direct dependencies (EXPERIMENTAL)
warning: (VIDEOBUF2_CORE && VIDEOBUF2_DMA_CONTIG && VIDEOBUF2_VMALLOC && DRM) selects DMA_SHARED_BUFFER which has unmet direct dependencies (EXPERIMENTAL)
warning: (VIDEOBUF2_CORE && VIDEOBUF2_DMA_CONTIG && VIDEOBUF2_VMALLOC && DRM) selects DMA_SHARED_BUFFER which has unmet direct dependencies (EXPERIMENTAL)
kernel/itimer.c:152:2: warning: passing argument 1 of 'timeval_to_cputime' discards 'const' qualifier from pointer target type [enabled by default]
kernel/itimer.c:154:2: warning: passing argument 1 of 'timeval_to_cputime' discards 'const' qualifier from pointer target type [enabled by default]
warning: (XEN_FBDEV_FRONTEND) selects INPUT_XEN_KBDDEV_FRONTEND which has unmet direct dependencies (!UML && INPUT && INPUT_MISC && XEN)
warning: (XEN_FBDEV_FRONTEND) selects INPUT_XEN_KBDDEV_FRONTEND which has unmet direct dependencies (!UML && INPUT && INPUT_MISC && XEN)
warning: (XEN_FBDEV_FRONTEND) selects INPUT_XEN_KBDDEV_FRONTEND which has unmet direct dependencies (!UML && INPUT && INPUT_MISC && XEN)

[sparse]
mm/page_alloc.c:2340:45: sparse: incorrect type in argument 3 (different base types)
mm/page_alloc.c:2637:45: sparse: incorrect type in argument 3 (different base types)
mm/page_alloc.c:2730:45: sparse: incorrect type in argument 3 (different base types)
mm/pageowner.c:102:51: sparse: incorrect type in argument 1 (different base types)
mm/vmstat.c:997:66: sparse: incorrect type in argument 1 (different base types)
drivers/gpu/drm/nouveau/core/subdev/i2c/nv94.c:72:1: sparse: symbol 'nv94_aux' was not declared. Should it be static?
net/core/dev.c:143:18: sparse: symbol 'ptype_base' was not declared. Should it be static?
net/core/dev.c:144:18: sparse: symbol 'ptype_all' was not declared. Should it be static?

[smatch]
sound/pci/hda/patch_hdmi.c:379 hdmi_eld_ctl_get() error: __builtin_memcpy() 'eld->eld_buffer' too small (256 vs 512)
net/ipv4/ip_gre.c:1107 ipgre_tunnel_bind_dev() error: potential NULL dereference 'tdev'.
mm/memory.c:1627 follow_page_mask() warn: inconsistent returns spin_lock:ptl: locked (1604,1626,1627) unlocked (1608,1613)
mm/memory.c:1627 follow_page_mask() warn: inconsistent returns spin_lock:__ptl: locked (1608,1613) unlocked (1604,1626,1627)
drivers/acpi/acpica/nsrepair.c:269 acpi_ns_simple_repair() error: we previously assumed 'return_object' could be null (see line 156)
drivers/acpi/acpica/nspredef.c:427 acpi_ns_check_object_type() error: we previously assumed 'return_object' could be null (see line 399)

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
