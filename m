From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 03 Apr 2013 17:51:16 +0000
Subject: build regressions 2013-04-03
Message-Id: <515c6c14.ps8sP6rgxMTh3GXS%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
ERROR: "__avr32_udiv64" [fs/nfsd/nfsd.ko] undefined!
drivers/gpu/drm/nouveau/nouveau_bo.c:463:3: error: implicit declaration of function 'ttm_agp_tt_create' [-Werror=implicit-function-declaration]

[warnings]
arch/arm/include/asm/psci.h:61:38: warning: 'return' with a value, in function returning void [enabled by default]
drivers/base/regmap/regcache.c:593: warning: format '%d' expects type 'int', but argument 4 has type 'long unsigned int'
include/linux/of_net.h:16: warning: type qualifiers ignored on function return type
drivers/base/regmap/regcache.c:593:2: warning: format '%d' expects argument of type 'int', but argument 4 has type 'long unsigned int' [-Wformat]
lib/list_lru.c:53:1: warning: control reaches end of non-void function [-Wreturn-type]
sound/pci/hda/patch_ca0132.c:2933:15: warning: 'nid' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/gpu/drm/i915/intel_display.c:5420:11: warning: unused variable 'bps' [-Wunused-variable]
drivers/base/cpu.c:142:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'unsigned int' [-Wformat]
drivers/infiniband/ulp/isert/ib_isert.c:1108:179: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat]
drivers/infiniband/ulp/isert/ib_isert.c:2221:91: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'unsigned int' [-Wformat]
drivers/infiniband/ulp/isert/ib_isert.c:2223:96: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'unsigned int' [-Wformat]
drivers/infiniband/ulp/isert/ib_isert.c:2224:152: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'unsigned int' [-Wformat]
drivers/infiniband/ulp/isert/ib_isert.c:286:5: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/gpu/drm/radeon/radeon_acpi.c:128:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'size_t' [-Wformat]
drivers/gpu/drm/radeon/radeon_atpx_handler.c:142:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'size_t' [-Wformat]
drivers/gpu/drm/nouveau/nouveau_bo.c:463:3: warning: return makes pointer from integer without a cast [enabled by default]
drivers/infiniband/ulp/isert/ib_isert.c:943:2: warning: #warning FIXME: Unexpected unsolicited_data out [-Wcpp]
drivers/infiniband/ulp/isert/ib_isert.c:957:2: warning: #warning FIXME: Non page-aligned unsolicited_data out [-Wcpp]
drivers/base/regmap/regcache.c:593:2: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat]
mm/vmscan.c:356:18: warning: unused variable 'tmp' [-Wunused-variable]

[sparse]
drivers/staging/vt6656/wctl.c:76:9: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/wctl.c:81:56: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/wctl.c:84:52: sparse: cast from restricted __le16
drivers/staging/vt6656/wctl.c:94:30: sparse: incorrect type in assignment (different base types)
drivers/staging/vt6656/wctl.c:96:28: sparse: incorrect type in assignment (different base types)
drivers/staging/vt6656/wctl.c:157:57: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/wctl.c:158:56: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/wctl.c:200:9: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/wctl.c:205:79: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/wctl.c:206:78: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/wctl.c:227:85: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/wctl.c:228:84: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/wctl.c:247:13: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/rxtx.c:1978:9: sparse: cast from restricted __le16
drivers/staging/vt6656/rxtx.c:2437:9: sparse: cast from restricted __le16
drivers/staging/vt6656/mib.c:331:9: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/mib.c:333:16: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/mib.c:335:16: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/mib.c:346:9: sparse: cast from restricted __le16
drivers/staging/vt6656/aes_ccmp.c:285:32: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/aes_ccmp.c:287:32: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/aes_ccmp.c:295:32: sparse: restricted __le16 degrades to integer
drivers/iio/magnetometer/ak8975.c:330:22: sparse: cast to restricted __le16
drivers/base/regmap/regcache.c:582:5: sparse: symbol 'regcache_sync_block_raw' was not declared. Should it be static?
drivers/target/iscsi/iscsi_target_login.c:618:2: sparse: FIXME: Reenable iscsit_start_nopin_timer
drivers/infiniband/ulp/isert/ib_isert.c:943:2: sparse: FIXME: Unexpected unsolicited_data out
drivers/infiniband/ulp/isert/ib_isert.c:957:2: sparse: FIXME: Non page-aligned unsolicited_data out
arch/x86/lib/inat-tables.c:5:19: sparse: symbol 'inat_primary_table' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:205:19: sparse: symbol 'inat_escape_table_1' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:416:19: sparse: symbol 'inat_escape_table_1_1' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:524:19: sparse: symbol 'inat_escape_table_1_2' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:554:19: sparse: symbol 'inat_escape_table_1_3' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:582:19: sparse: symbol 'inat_escape_table_2' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:703:19: sparse: symbol 'inat_escape_table_2_1' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:820:19: sparse: symbol 'inat_escape_table_2_2' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:824:19: sparse: symbol 'inat_escape_table_2_3' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:833:19: sparse: symbol 'inat_escape_table_3' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:875:19: sparse: symbol 'inat_escape_table_3_1' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:916:19: sparse: symbol 'inat_escape_table_3_3' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:927:19: sparse: symbol 'inat_group_table_5' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:938:19: sparse: symbol 'inat_group_table_6' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:949:19: sparse: symbol 'inat_group_table_7' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:955:19: sparse: symbol 'inat_group_table_8' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:966:19: sparse: symbol 'inat_group_table_9' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:976:19: sparse: symbol 'inat_group_table_10' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:989:19: sparse: symbol 'inat_group_table_21' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:994:19: sparse: symbol 'inat_group_table_21_1' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:997:19: sparse: symbol 'inat_group_table_21_2' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:1007:19: sparse: symbol 'inat_group_table_13' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:1012:19: sparse: symbol 'inat_group_table_13_1' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:1019:19: sparse: symbol 'inat_group_table_14' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:1024:19: sparse: symbol 'inat_group_table_14_1' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:1031:19: sparse: symbol 'inat_group_table_15' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:1037:19: sparse: symbol 'inat_group_table_15_1' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:1045:19: sparse: symbol 'inat_group_table_18' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:1051:19: sparse: symbol 'inat_group_table_18_2' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:1059:19: sparse: symbol 'inat_group_table_12' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:1067:19: sparse: symbol 'inat_group_table_22' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:1080:19: sparse: symbol 'inat_escape_tables' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:1095:19: sparse: symbol 'inat_group_tables' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:1118:19: sparse: symbol 'inat_avx_tables' was not declared. Should it be static?
drivers/scsi/ufs/ufshcd.c:1535:5: sparse: symbol 'ufshcd_suspend' was not declared. Should it be static?
drivers/scsi/ufs/ufshcd.c:1556:5: sparse: symbol 'ufshcd_resume' was not declared. Should it be static?
drivers/scsi/aic7xxx_old/aic7xxx_proc.c:45:1: sparse: symbol 'aic7xxx_show_info' was not declared. Should it be static?
kernel/events/hw_breakpoint.c:80:12: sparse: symbol 'hw_breakpoint_weight' was not declared. Should it be static?
kernel/events/hw_breakpoint.c:249:13: sparse: symbol 'arch_unregister_hw_breakpoint' was not declared. Should it be static?
kernel/power/main.c:614:25: sparse: symbol 'pm_wq' was not declared. Should it be static?
arch/x86/kernel/cpu/perf_event.c:1800:6: sparse: symbol 'arch_perf_update_userpage' was not declared. Should it be static?
arch/x86/kernel/ftrace.c:715:6: sparse: symbol 'prepare_ftrace_return' was not declared. Should it be static?
arch/x86/kernel/irqinit.c:85:13: sparse: symbol 'init_IRQ' was not declared. Should it be static?
arch/x86/kernel/traps.c:591:39: sparse: symbol 'smp_threshold_interrupt' was not declared. Should it be static?
arch/x86/kernel/kvm.c:76:8: sparse: symbol 'apf_reason' was not declared. Should it be static?
arch/x86/kernel/kvm.c:255:1: sparse: symbol 'do_async_page_fault' was not declared. Should it be static?
arch/x86/kernel/hw_breakpoint.c:59:8: sparse: symbol 'bp_per_reg' was not declared. Should it be static?
arch/x86/kvm/x86.c:5138:8: sparse: symbol 'current_vcpu' was not declared. Should it be static?

[smatch]
drivers/reset/core.c:184 reset_control_get() error: potential null dereference 'rstc'.  (kzalloc returns null)
drivers/reset/core.c:184 reset_control_get() error: we previously assumed 'rstc' could be null (see line 183)
drivers/reset/gpio-reset.c:119 gpio_reset_probe() warn: unsigned 'drvdata->gpios + i->gpio' is never less than zero.
drivers/net/wireless/rtlwifi/core.c:736 rtl_op_bss_info_changed() error: we previously assumed 'sta' could be null (see line 731)
drivers/infiniband/ulp/isert/ib_isert.c:425 isert_connect_release() warn: variable dereferenced before check 'isert_conn->conn_cm_id' (see line 408)
fs/namespace.c:1608 lock_mount() warn: inconsistent returns mutex:&dentry->d_inode->i_mutex: locked (1601) unlocked (1590,1599)
drivers/clk/clk.c:50 clk_prepare_lock() warn: inconsistent returns mutex:&prepare_lock: locked (50) unlocked (43)
drivers/clk/clk.c:79 clk_enable_lock() warn: inconsistent returns irqsave:flags: locked (79) unlocked (71)
drivers/clk/clk.c:79 clk_enable_lock() warn: inconsistent returns spin_lock:&enable_lock: locked (79) unlocked (71)
drivers/mfd/wm5102-tables.c:90 wm5102_patch() warn: missing break? reassigning 'wm5102_patch'

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
