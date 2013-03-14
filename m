From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 14 Mar 2013 16:44:25 +0000
Subject: build regressions 2013-03-14
Message-Id: <5141fe69.xm7u9Pqwtv2AbZ7U%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
(.text+0x60ff): undefined reference to `rtc_time_to_tm'
(.text+0x6107): undefined reference to `rtc_valid_tm'
arch/x86/platform/mrst/vrtc.c:95:30: error: 'struct rtc_time' has no member named 'year'
arch/x86/platform/mrst/vrtc.c:100:12: error: 'struct rtc_time' has no member named 'year'
arch/x86/platform/mrst/vrtc.c:103:21: error: 'struct rtc_time' has no member named 'mon'
arch/x86/platform/mrst/vrtc.c:104:21: error: 'struct rtc_time' has no member named 'mday'
arch/x86/platform/mrst/vrtc.c:105:21: error: 'struct rtc_time' has no member named 'hour'
arch/x86/platform/mrst/vrtc.c:106:21: error: 'struct rtc_time' has no member named 'min'
arch/x86/platform/mrst/vrtc.c:107:21: error: 'struct rtc_time' has no member named 'sec'
arch/x86/platform/mrst/vrtc.c:113:3: error: 'retval' undeclared (first use in this function)
ERROR: "pci_dev_resource_n" [drivers/isdn/hardware/avm/t1isa.ko] undefined!
drivers/block/blockconsole.c:164:2: error: implicit declaration of function 'cmpxchg64' [-Werror=implicit-function-declaration]
arch/mips/include/asm/inst.h:324:12: error: field 'rr' has incomplete type
arch/mips/include/asm/inst.h:325:13: error: field 'jal' has incomplete type
arch/mips/include/asm/inst.h:326:13: error: field 'i64' has incomplete type
arch/mips/include/asm/inst.h:327:14: error: field 'ri64' has incomplete type
arch/mips/include/asm/inst.h:328:12: error: field 'ri' has incomplete type
arch/mips/include/asm/inst.h:329:13: error: field 'rri' has incomplete type
arch/mips/include/asm/inst.h:330:12: error: field 'i8' has incomplete type
drivers/net/ethernet/sfc/efx.c:647:3: error: call to '__compiletime_assert_649' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct efx_rx_page_state) + EFX_PAGE_IP_ALIGN + EFX_RX_USR_BUF_SIZE > PAGE_SIZE / 2

[warnings]
kernel/workqueue.c:435:13: warning: 'workqueue_freezing' defined but not used [-Wunused-variable]
drivers/gpu/drm/nouveau/core/subdev/therm/ic.c:116:1: warning: the frame size of 1028 bytes is larger than 1024 bytes [-Wframe-larger-than=]
arch/ia64/sn/kernel/tiocx.c:497:14: warning: ignoring return value of 'bus_register', declared with attribute warn_unused_result [-Wunused-result]
sound/pci/hda/hda_codec.c:5538:7: warning: unused variable 'oldsize' [-Wunused-variable]
drivers/video/cirrusfb.c:1947:2: warning: passing argument 1 of 'pci_dev_resource_n' discards 'const' qualifier from pointer target type [enabled by default]
drivers/video/cirrusfb.c:1948:3: warning: passing argument 1 of 'pci_dev_resource_n' discards 'const' qualifier from pointer target type [enabled by default]
drivers/video/cirrusfb.c:1949:3: warning: passing argument 1 of 'pci_dev_resource_n' discards 'const' qualifier from pointer target type [enabled by default]
drivers/video/cirrusfb.c:1951:3: warning: passing argument 1 of 'pci_dev_resource_n' discards 'const' qualifier from pointer target type [enabled by default]
drivers/video/cirrusfb.c:1952:3: warning: passing argument 1 of 'pci_dev_resource_n' discards 'const' qualifier from pointer target type [enabled by default]
drivers/mtd/lpddr/lpddr_cmds.c:130:11: warning: 'r.x[0]' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/mtd/lpddr/lpddr_cmds.c:422:15: warning: 'r.x[0]' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/mtd/lpddr/qinfo_probe.c:102:2: warning: 'r.x[0]' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/mtd/lpddr/qinfo_probe.c:96:11: warning: 'r.x[0]' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/mtd/lpddr/qinfo_probe.c:145:20: warning: 'r.x[0]' may be used uninitialized in this function [-Wuninitialized]
drivers/mtd/lpddr/qinfo_probe.c:147:15: warning: 'r.x[0]' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
lib/usercopy.c:5:6: sparse: symbol 'copy_from_user_overflow' was not declared. Should it be static?

[smatch]
mm/fremap.c:167 sys_remap_file_pages() warn: variable dereferenced before check 'vma' (see line 166)
kernel/trace/trace_events.c:2049 event_enable_func() warn: inconsistent returns mutex:&event_mutex: locked (2025) unlocked (1970,1973,1977,2041)
fs/ubifs/super.c:1712 ubifs_remount_rw() warn: inconsistent returns mutex:&c->umount_mutex: locked (1574) unlocked (1563,1694,1712)

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
