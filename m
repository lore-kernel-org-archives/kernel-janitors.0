From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 28 Aug 2013 19:16:30 +0000
Subject: build regressions 2013-08-28
Message-Id: <521e4c8e.DCF4AvBFsB3rGEkQ%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
file.c:(.text+0x4da7d9): undefined reference to `__divdi3'
drivers/power/bq24190_charger.c:318:9: error: 'BQ24190_REG_16' undeclared here (not in a function)
drivers/power/bq24190_charger.c:319:10: error: 'BQ24190_REG_16_VBUS_STAT_MASK' undeclared here (not in a function)
drivers/power/bq24190_charger.c:320:11: error: 'BQ24190_REG_16_VBUS_STAT_SHIFT' undeclared here (not in a function)
drivers/power/bq24190_charger.c:319:10: error: 'BQ24190_REG_16_CHRG_STAT_MASK' undeclared here (not in a function)
drivers/power/bq24190_charger.c:320:11: error: 'BQ24190_REG_16_CHRG_STAT_SHIFT' undeclared here (not in a function)
drivers/power/bq24190_charger.c:319:10: error: 'BQ24190_REG_16_DPM_STAT_MASK' undeclared here (not in a function)
drivers/power/bq24190_charger.c:320:11: error: 'BQ24190_REG_16_DPM_STAT_SHIFT' undeclared here (not in a function)
drivers/power/bq24190_charger.c:319:10: error: 'BQ24190_REG_16_PG_STAT_MASK' undeclared here (not in a function)
drivers/power/bq24190_charger.c:320:11: error: 'BQ24190_REG_16_PG_STAT_SHIFT' undeclared here (not in a function)
drivers/power/bq24190_charger.c:319:10: error: 'BQ24190_REG_16_THERM_STAT_MASK' undeclared here (not in a function)
drivers/power/bq24190_charger.c:320:11: error: 'BQ24190_REG_16_THERM_STAT_SHIFT' undeclared here (not in a function)
drivers/power/bq24190_charger.c:319:10: error: 'BQ24190_REG_16_VSYS_STAT_MASK' undeclared here (not in a function)
drivers/power/bq24190_charger.c:320:11: error: 'BQ24190_REG_16_VSYS_STAT_SHIFT' undeclared here (not in a function)
drivers/w1/w1.c:625:4: error: implicit declaration of function 'sysfs_create_groups' [-Werror=implicit-function-declaration]
drivers/w1/w1.c:639:4: error: implicit declaration of function 'sysfs_remove_groups' [-Werror=implicit-function-declaration]
mm/mempolicy.c:2335:25: error: 'struct task_struct' has no member named 'numa_preferred_nid'
mm/mempolicy.c:2336:13: error: 'struct task_struct' has no member named 'numa_migrate_seq'
net/openvswitch/flow.c:1984:244: error: call to '__compiletime_assert_1984' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct sw_flow_key) % sizeof(long)
drivers/staging/dgap/dgap_driver.c:423:3: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
drivers/staging/dgap/dgap_driver.c:940:3: error: implicit declaration of function 'kmalloc' [-Werror=implicit-function-declaration]
arch/powerpc/include/generated/asm/vtime.h:1:31: fatal error: asm-generic/vtime.h: No such file or directory
drivers/gpu/drm/i915/i915_gem_gtt.c:1296:2: error: implicit declaration of function 'IS_CHERRYVIEW' [-Werror=implicit-function-declaration]
drivers/staging/rtl8188eu/core/rtw_p2p.c:70:11: error: 'struct sta_info' has no member named 'is_p2p_device'
drivers/staging/rtl8188eu/core/rtw_p2p.c:76:21: error: 'struct sta_info' has no member named 'dev_addr'
drivers/staging/rtl8188eu/core/rtw_p2p.c:83:16: error: 'struct sta_info' has no member named 'dev_cap'
drivers/staging/rtl8188eu/core/rtw_p2p.c:87:27: error: 'struct sta_info' has no member named 'config_methods'
drivers/staging/rtl8188eu/core/rtw_p2p.c:87:27: error: 'struct sta_info' has no member named 'config_methods'
drivers/staging/rtl8188eu/core/rtw_p2p.c:90:21: error: 'struct sta_info' has no member named 'primary_dev_type'
drivers/staging/rtl8188eu/core/rtw_p2p.c:93:16: error: 'struct sta_info' has no member named 'num_of_secdev_type'
drivers/staging/rtl8188eu/core/rtw_p2p.c:96:21: error: 'struct sta_info' has no member named 'secdev_types_list'
drivers/staging/rtl8188eu/core/rtw_p2p.c:96:46: error: 'struct sta_info' has no member named 'num_of_secdev_type'
drivers/staging/rtl8188eu/core/rtw_p2p.c:97:16: error: 'struct sta_info' has no member named 'num_of_secdev_type'
drivers/staging/rtl8188eu/core/rtw_p2p.c:99:12: error: 'struct sta_info' has no member named 'dev_name_len'
drivers/staging/rtl8188eu/core/rtw_p2p.c:105:28: error: 'struct sta_info' has no member named 'dev_name_len'
drivers/staging/rtl8188eu/core/rtw_p2p.c:105:28: error: 'struct sta_info' has no member named 'dev_name_len'
drivers/staging/rtl8188eu/core/rtw_p2p.c:108:22: error: 'struct sta_info' has no member named 'dev_name'
drivers/staging/rtl8188eu/core/rtw_p2p.c:108:38: error: 'struct sta_info' has no member named 'dev_name_len'
drivers/staging/rtl8188eu/core/rtw_p2p.c:109:17: error: 'struct sta_info' has no member named 'dev_name_len'
drivers/staging/rtl8188eu/core/rtw_p2p.c:886:8: error: 'struct sta_info' has no member named 'dev_cap'
drivers/staging/rtl8188eu/core/rtw_p2p.c:903:16: error: 'struct sta_info' has no member named 'dev_addr'
drivers/staging/rtl8188eu/core/rtw_p2p.c:908:9: error: 'struct sta_info' has no member named 'config_methods'
drivers/staging/rtl8188eu/core/rtw_p2p.c:912:16: error: 'struct sta_info' has no member named 'primary_dev_type'
drivers/staging/rtl8188eu/core/rtw_p2p.c:920:10: error: 'struct sta_info' has no member named 'num_of_secdev_type'
drivers/staging/rtl8188eu/core/rtw_p2p.c:924:10: error: 'struct sta_info' has no member named 'num_of_secdev_type'
drivers/staging/rtl8188eu/core/rtw_p2p.c:926:24: error: 'struct sta_info' has no member named 'secdev_types_list'
drivers/staging/rtl8188eu/core/rtw_p2p.c:927:24: error: 'struct sta_info' has no member named 'secdev_types_list'
drivers/staging/rtl8188eu/core/rtw_p2p.c:929:17: error: 'struct sta_info' has no member named 'secdev_types_list'
drivers/staging/rtl8188eu/core/rtw_p2p.c:935:9: error: 'struct sta_info' has no member named 'dev_name_len'
drivers/staging/rtl8188eu/core/rtw_p2p.c:939:10: error: 'struct sta_info' has no member named 'dev_name_len'
drivers/staging/rtl8188eu/core/rtw_p2p.c:939:39: error: 'struct sta_info' has no member named 'dev_name'
drivers/staging/rtl8188eu/core/rtw_p2p.c:939:80: error: 'struct sta_info' has no member named 'dev_name'
drivers/staging/rtl8188eu/core/rtw_p2p.c:941:17: error: 'struct sta_info' has no member named 'dev_name'
drivers/staging/rtl8188eu/core/rtw_p2p.c:941:50: error: 'struct sta_info' has no member named 'dev_name_len'
drivers/staging/rtl8188eu/core/rtw_p2p.c:993:15: error: 'struct sta_info' has no member named 'is_p2p_device'
drivers/staging/rtl8188eu/core/rtw_p2p.c:993:39: error: 'struct sta_info' has no member named 'dev_cap'
drivers/staging/rtl8188eu/core/rtw_p2p.c:994:27: error: 'struct sta_info' has no member named 'dev_addr'
kernel/sched/fair.c:5322:32: error: 'struct sg_lb_stats' has no member named 'nr_numa_running'
kernel/sched/fair.c:5323:7: error: 'struct sg_lb_stats' has no member named 'nr_preferred_running'
kernel/sched/fair.c:5773:7: error: 'struct rq' has no member named 'nr_numa_running'
kernel/sched/fair.c:5773:28: error: 'struct rq' has no member named 'nr_preferred_running'
drivers/usb/phy/phy-am335x-control.c:44:3: error: implicit declaration of function '__WARN' [-Werror=implicit-function-declaration]

[warnings]
include/linux/of_irq.h:82:7: warning: 'struct device_node' declared inside parameter list [enabled by default]
include/linux/of_irq.h:82:7: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/of_irq.h:87:47: warning: 'struct device_node' declared inside parameter list [enabled by default]
Warning(kernel/sched/fair.c:5367): Excess function parameter 'balance' description in 'update_sd_lb_stats'
Warning(fs/namei.c:2285): No description found for parameter 'path'
Warning(fs/namei.c:2285): Excess function parameter 'nd' description in 'path_umountat'
drivers/staging/rtl8188eu/os_dep/ioctl_linux.c:5836:65: warning: iteration 16u invokes undefined behavior [-Waggressive-loop-optimizations]
drivers/staging/rtl8188eu/os_dep/ioctl_linux.c:6042:69: warning: iteration 16u invokes undefined behavior [-Waggressive-loop-optimizations]
drivers/staging/dgap/dgap_driver.c:983:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
drivers/staging/dgap/dgap_fep5.c:177:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
drivers/staging/dgap/dgap_fep5.c:114:1: warning: the frame size of 1044 bytes is larger than 1024 bytes [-Wframe-larger-than=]
drivers/staging/dgap/dgap_tty.c:664:1: warning: the frame size of 1056 bytes is larger than 1024 bytes [-Wframe-larger-than=]
drivers/net/ethernet/emulex/benet/be_main.c:2569:46: warning: array subscript is below array bounds [-Warray-bounds]
drivers/usb/host/xhci.c:3560:17: warning: unused variable 'dev' [-Wunused-variable]
drivers/usb/host/xhci.c:3648:17: warning: unused variable 'dev' [-Wunused-variable]
drivers/staging/dgap/dgap_driver.c:940:13: warning: initialization makes pointer from integer without a cast [enabled by default]
include/linux/sysfs.h:356:1: warning: no return statement in function returning non-void [-Wreturn-type]
include/linux/sysfs.h:356:1: warning: no return statement in function returning non-void [-Wreturn-type]
include/linux/sysfs.h:356:1: warning: no return statement in function returning non-void [-Wreturn-type]
include/linux/sysfs.h:356:1: warning: no return statement in function returning non-void [-Wreturn-type]
include/linux/sysfs.h:356:1: warning: no return statement in function returning non-void [-Wreturn-type]
mm/mlock.c:399:20: warning: 'pmd_end' may be used uninitialized in this function [-Wmaybe-uninitialized]
WARNING: mm/built-in.o(.text.unlikely+0x1cf3): Section mismatch in reference from the function alloc_usemap_and_memmap() to the function .init.text:sparse_early_usemaps_alloc_node()
WARNING: mm/built-in.o(.text.unlikely+0x1d07): Section mismatch in reference from the function alloc_usemap_and_memmap() to the function .init.text:sparse_mem_maps_populate_node()

[sparse]
drivers/staging/gdm724x/gdm_tty.c:50:19: sparse: symbol 'gdm_driver' was not declared. Should it be static?
drivers/staging/gdm724x/gdm_tty.c:51:12: sparse: symbol 'gdm_table' was not declared. Should it be static?
drivers/staging/dgnc/dgnc_driver.c:505:73: sparse: incorrect type in argument 2 (different base types) @@    expected int [signed] priority @@    got resint [signed] priority @@
drivers/staging/dgnc/dgnc_driver.c:513:68: sparse: incorrect type in argument 2 (different base types) @@    expected int [signed] priority @@    got resint [signed] priority @@
drivers/staging/dgnc/dgnc_driver.c:731:56: sparse: incorrect type in argument 2 (different base types) @@    expected int [signed] priority @@    got resint [signed] priority @@
drivers/staging/dgnc/dgnc_driver.c:907:33: sparse: incorrect type in argument 2 (different base types) @@    expected restricted gfp_t [usertype] flags @@    got t [usertype] flags @@
drivers/staging/dgnc/dgnc_tty.c:1396:66: sparse: incorrect type in argument 2 (different base types) @@    expected int [signed] priority @@    got resint [signed] priority @@
drivers/staging/dgnc/dgnc_tty.c:1398:66: sparse: incorrect type in argument 2 (different base types) @@    expected int [signed] priority @@    got resint [signed] priority @@
drivers/staging/dgnc/dgnc_tty.c:1400:66: sparse: incorrect type in argument 2 (different base types) @@    expected int [signed] priority @@    got resint [signed] priority @@
drivers/staging/dgnc/dgnc_tty.c:234:100: sparse: incorrect type in argument 2 (different base types) @@    expected int [signed] priority @@    got resint [signed] priority @@
drivers/staging/dgnc/dgnc_tty.c:244:101: sparse: incorrect type in argument 2 (different base types) @@    expected int [signed] priority @@    got resint [signed] priority @@
drivers/staging/dgnc/dgnc_tty.c:293:99: sparse: incorrect type in argument 2 (different base types) @@    expected int [signed] priority @@    got resint [signed] priority @@
drivers/staging/dgnc/dgnc_tty.c:303:100: sparse: incorrect type in argument 2 (different base types) @@    expected int [signed] priority @@    got resint [signed] priority @@
drivers/staging/dgnc/dgnc_tty.c:375:91: sparse: incorrect type in argument 2 (different base types) @@    expected int [signed] priority @@    got resint [signed] priority @@
drivers/staging/dgnc/dgnc_tty.c:554:56: sparse: Using plain integer as NULL pointer
drivers/staging/vt6656/baseband.c:877:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] len @@    got  short [unsigned] [usertype] len @@
drivers/staging/vt6656/baseband.c:880:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] len @@    got  short [unsigned] [usertype] len @@
drivers/staging/ozwpan/ozpd.c:207:6: sparse: symbol 'oz_pd_free' was not declared. Should it be static?
drivers/staging/rtl8188eu/core/rtw_br_ext.c:705:101: sparse: incorrect type in argument 2 (different base types) @@    expected unsigned int *ipxNetAddr @@    got restrunsigned int *ipxNetAddr @@
drivers/staging/rtl8188eu/core/rtw_br_ext.c:705:123: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned short *ipxSocketAddr @@    got resunsigned short *ipxSocketAddr @@
drivers/staging/rtl8188eu/core/rtw_br_ext.c:710:99: sparse: incorrect type in argument 2 (different base types) @@    expected unsigned int *ipxNetAddr @@    got restrunsigned int *ipxNetAddr @@
drivers/staging/rtl8188eu/core/rtw_br_ext.c:719:101: sparse: incorrect type in argument 2 (different base types) @@    expected unsigned int *ipxNetAddr @@    got restrunsigned int *ipxNetAddr @@
drivers/staging/rtl8188eu/core/rtw_br_ext.c:719:121: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned short *ipxSocketAddr @@    got resunsigned short *ipxSocketAddr @@
drivers/staging/rtl8188eu/core/rtw_br_ext.c:726:99: sparse: incorrect type in argument 2 (different base types) @@    expected unsigned int *ipxNetAddr @@    got restrunsigned int *ipxNetAddr @@
drivers/staging/rtl8188eu/core/rtw_br_ext.c:754:83: sparse: incorrect type in argument 2 (different base types) @@    expected unsigned short *network @@    got resunsigned short *network @@
drivers/staging/rtl8188eu/core/rtw_br_ext.c:767:83: sparse: incorrect type in argument 2 (different base types) @@    expected unsigned short *network @@    got resunsigned short *network @@
drivers/staging/rtl8188eu/core/rtw_br_ext.c:788:83: sparse: incorrect type in argument 2 (different base types) @@    expected unsigned short *network @@    got resunsigned short *network @@
drivers/staging/rtl8188eu/core/rtw_br_ext.c:800:83: sparse: incorrect type in argument 2 (different base types) @@    expected unsigned short *network @@    got resunsigned short *network @@
drivers/staging/rtl8188eu/core/rtw_br_ext.c:854:57: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] <noident> @@    got ned short [unsigned] [short] <noident> @@
drivers/staging/rtl8188eu/core/rtw_br_ext.c:92:23: sparse: restricted __be16 degrades to integer
drivers/staging/rtl8188eu/core/rtw_br_ext.c:881:95: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned short *sid @@    got resunsigned short *sid @@
drivers/staging/rtl8188eu/core/rtw_br_ext.c:917:45: sparse: cast to restricted __be16
drivers/staging/rtl8188eu/core/rtw_br_ext.c:917:45: sparse: cast to restricted __be16
drivers/staging/rtl8188eu/core/rtw_br_ext.c:917:45: sparse: cast to restricted __be16
drivers/staging/rtl8188eu/core/rtw_br_ext.c:917:45: sparse: cast to restricted __be16
drivers/staging/rtl8188eu/core/rtw_br_ext.c:949:112: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned short *sid @@    got resunsigned short *sid @@
drivers/staging/rtl8188eu/core/rtw_br_ext.c:1024:84: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned int [unsigned] [usertype] len @@    got ed int [unsigned] [usertype] len @@
drivers/staging/rtl8188eu/core/rtw_br_ext.c:1026:110: sparse: incorrect type in argument 2 (different base types) @@    expected int [signed] len @@    got restricted __be1int [signed] len @@
drivers/staging/rtl8188eu/core/rtw_br_ext.c:1151:54: sparse: cast to restricted __be32
drivers/staging/rtl8188eu/core/rtw_br_ext.c:1151:54: sparse: cast to restricted __be32
drivers/staging/rtl8188eu/core/rtw_br_ext.c:1151:54: sparse: cast to restricted __be32
drivers/staging/rtl8188eu/core/rtw_br_ext.c:1151:54: sparse: cast to restricted __be32
drivers/staging/rtl8188eu/core/rtw_br_ext.c:1151:54: sparse: cast to restricted __be32
drivers/staging/rtl8188eu/core/rtw_br_ext.c:1151:54: sparse: cast to restricted __be32
drivers/staging/rtl8188eu/core/rtw_br_ext.c:1154:70: sparse: restricted __be16 degrades to integer
drivers/staging/rtl8188eu/core/rtw_br_ext.c:1160:70: sparse: invalid assignment: |drivers/staging/rtl8188eu/core/rtw_br_ext.c:1162:63: sparse: restricted __sum16 degrades to integer
drivers/staging/rtl8188eu/core/rtw_br_ext.c:1163:64: sparse: cast to restricted __be16
drivers/staging/rtl8188eu/core/rtw_br_ext.c:1163:64: sparse: cast to restricted __be16
drivers/staging/rtl8188eu/core/rtw_br_ext.c:1163:64: sparse: cast to restricted __be16
drivers/staging/rtl8188eu/core/rtw_br_ext.c:1163:64: sparse: cast to restricted __be16
drivers/staging/rtl8188eu/core/rtw_br_ext.c:1166:69: sparse: incorrect type in assignment (different base types) @@    expected restricted __sum16 [usertype] check @@    got e] check @@
drivers/staging/rtl8188eu/core/rtw_cmd.c:221:5: sparse: symbol 'rtw_cmd_filter' was not declared. Should it be static?
drivers/staging/rtl8188eu/core/rtw_cmd.c:1670:6: sparse: symbol 'dynamic_chk_wk_hdl' was not declared. Should it be static?
drivers/staging/rtl8188eu/core/rtw_ieee80211.c:1593:14: sparse: cast to restricted __le16
drivers/staging/rtl8188eu/core/rtw_mlme.c:1003:9: sparse: context imbalance in 'rtw_free_assoc_resources' - different lock contexts for basic block
drivers/staging/rtl8188eu/core/rtw_wlan_util.c:1635:25: sparse: cast to restricted __le16
drivers/staging/rtl8188eu/os_dep/ioctl_linux.c:3934:17: sparse: cast removes address space of expression
drivers/staging/rtl8188eu/os_dep/ioctl_linux.c:3935:31: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const *<noident> @@    got void [nodervoid const *<noident> @@
drivers/staging/rtl8188eu/os_dep/ioctl_linux.c:3937:38: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const *<noident> @@    got void [nodervoid const *<noident> @@
drivers/staging/rtl8188eu/os_dep/ioctl_linux.c:3939:38: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const *<noident> @@    got void [nodervoid const *<noident> @@
drivers/staging/rtl8188eu/os_dep/ioctl_linux.c:3941:38: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const *<noident> @@    got void [nodervoid const *<noident> @@
drivers/staging/rtl8188eu/os_dep/ioctl_linux.c:3943:38: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const *<noident> @@    got void [nodervoid const *<noident> @@
drivers/staging/rtl8188eu/os_dep/ioctl_linux.c:3946:38: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const *<noident> @@    got void [nodervoid const *<noident> @@
drivers/staging/rtl8188eu/os_dep/ioctl_linux.c:3948:38: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const *<noident> @@    got void [nodervoid const *<noident> @@
drivers/staging/rtl8188eu/os_dep/ioctl_linux.c:3951:38: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const *<noident> @@    got void [nodervoid const *<noident> @@
drivers/staging/rtl8188eu/os_dep/ioctl_linux.c:3965:9: sparse: cast removes address space of expression
drivers/staging/dgap/dgap_driver.c:67:1: sparse: symbol 'dgap_trcbuf_size' was not declared. Should it be static?
drivers/staging/dgap/dgap_parse.c:126:9: sparse: symbol 'dgap_parsefile' was not declared. Should it be static?
drivers/staging/dgap/dgap_parse.c:1100:6: sparse: symbol 'dgap_config_get_useintr' was not declared. Should it be static?
drivers/staging/dgap/dgap_parse.c:1127:6: sparse: symbol 'dgap_config_get_altpin' was not declared. Should it be static?
drivers/staging/dgap/dgap_parse.c:1156:14: sparse: symbol 'dgap_find_config' was not declared. Should it be static?
drivers/staging/dgap/dgap_parse.c:1222:6: sparse: symbol 'dgap_config_get_number_of_ports' was not declared. Should it be static?
drivers/staging/dgap/dgap_parse.c:1251:6: sparse: symbol 'dgap_create_config_string' was not declared. Should it be static?
drivers/staging/dgap/dgap_parse.c:1310:6: sparse: symbol 'dgap_get_config_letters' was not declared. Should it be static?
drivers/staging/dgap/dgap_trace.c:182:6: sparse: symbol 'dgap_tracer_free' was not declared. Should it be static?
drivers/staging/dgnc/dgnc_trace.c:180:6: sparse: symbol 'dgnc_tracer_free' was not declared. Should it be static?
drivers/staging/rtl8187se/r8180_core.c:3540:13: sparse: symbol 'rtl8180_interrupt' was not declared. Should it be static?

[coccinelle]
net/mac80211/key.c:882:9-16: WARNING: ERR_CAST can be used with key
drivers/net/ethernet/emulex/benet/be_cmds.c:747:1-7: Replace memcpy with struct assignment
drivers/net/ethernet/emulex/benet/be_cmds.c:775:2-8: Replace memcpy with struct assignment

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
