From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 16 Nov 2012 16:05:14 +0000
Subject: build regressions 2012-11-16
Message-Id: <50a6643a.6EGimI9EpLY2uZDB%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/mach-omap2/board-generic.c:115:13: error: 'omap_prcm_restart' undeclared here (not in a function)
arch/arm/mach-omap2/voltagedomains44xx_data.c:107:2: error: implicit declaration of function 'cpu_is_omap443x' [-Werror=implicit-function-declaration]
arch/arm/mach-omap2/voltagedomains44xx_data.c:111:2: error: implicit declaration of function 'cpu_is_omap446x' [-Werror=implicit-function-declaration]
(.text+0xbf5d5): undefined reference to `ipv6_skip_exthdr'
kernel/sched/rt.c:938:2: error: implicit declaration of function 'task_group_charge' [-Werror=implicit-function-declaration]
kernel/sched/fair.c:709:3: error: implicit declaration of function 'task_group_charge' [-Werror=implicit-function-declaration]
kernel/sched/core.c:8057:11: error: 'struct task_group' has no member named 'rt_rq'
kernel/trace/trace.h:16:47: fatal error: asm/syscall.h: No such file or directory
arch/mips/kernel/mips-mt-fpaff.c:53:22: error: invalid operands to binary = (have 'kuid_t' and 'kuid_t')
net/ipv6/udp_offload.c:29:2: error: implicit declaration of function 'csum_ipv6_magic' [-Werror=implicit-function-declaration]
kernel/irq_work.c:189:9: error: 'NOTIFY_OK' undeclared (first use in this function)
kernel/irq_work.c:196:2: error: invalid use of undefined type 'struct notifier_block'
drivers/i2c/muxes/i2c-mux-gpio.c:80:2: error: implicit declaration of function 'of_find_i2c_adapter_by_node' [-Werror=implicit-function-declaration]
arch/tile/kernel/process.c:583:1: error: conflicting types for 'sys_clone'
net/ipv6/netfilter/nft_chain_nat_ipv6.c:48:2: error: 'IP_MF' undeclared (first use in this function)
net/ipv6/netfilter/nft_chain_nat_ipv6.c:48:2: error: 'IP_OFFSET' undeclared (first use in this function)
arch/x86/boot/compressed/head_64.S:215: Error: attempt to move .org backwards
fair.c:(.text+0x5b96d): undefined reference to `task_group_charge'
net/mac80211/rc80211_minstrel.c:185:152: error: 'mp' undeclared (first use in this function)
kernel/sched/core.c:8110:6: error: redefinition of 'task_group_charge'
tcpv6_offload.c:(.text+0x3d045): undefined reference to `tcp_gro_complete'
tcpv6_offload.c:(.text+0x3d19b): undefined reference to `tcp_gro_receive'
(.init.text+0x118b): undefined reference to `inet_del_offload'
net/built-in.o:(.rodata+0x1c58): undefined reference to `tcp_tso_segment'

[warnings]
drivers/gpu/drm/qxl/qxl_ioctl.c:168:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/gpu/drm/qxl/qxl_kms.c:93:89: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/tty/serial/ifx6x60.c:719:8: warning: 'more' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/tty/serial/ifx6x60.c:516:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
net/unix/af_unix.c:1065:6: warning: 'err' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/trace/trace_events.c:316:18: warning: 'dir' may be used uninitialized in this function [-Wmaybe-uninitialized]
warning: (BALLOON_COMPACTION && TRANSPARENT_HUGEPAGE) selects COMPACTION which has unmet direct dependencies (MMU)
drivers/i2c/muxes/i2c-mux-gpio.c:80:10: warning: assignment makes pointer from integer without a cast [enabled by default]
net/mac80211/rc80211_minstrel.c:185:213: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/misc/hpilo.c:847:20: warning: 'devnum' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/sched/core.c:8084:1: warning: no return statement in function returning non-void [-Wreturn-type]
drivers/tty/serial/ifx6x60.c:682:26: warning: 'cts' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
include/linux/mfd/dbx500-prcmu.h:459:19: sparse: multiple definitions for function 'prcmu_abb_read'
include/linux/mfd/dbx500-prcmu.h:464:19: sparse: multiple definitions for function 'prcmu_abb_write'
include/linux/mfd/dbx500-prcmu.h:475:19: sparse: multiple definitions for function 'prcmu_config_clkout'
include/linux/mfd/dbx500-prcmu.h:537:19: sparse: multiple definitions for function 'prcmu_ac_wake_req'
include/linux/mfd/dbx500-prcmu.h:542:20: sparse: multiple definitions for function 'prcmu_ac_sleep_req'
drivers/scsi/csiostor/csio_attr.c:92:41: sparse: incorrect type in assignment (different base types)
drivers/scsi/csiostor/csio_attr.c:328:44: sparse: restricted __be64 degrades to integer
drivers/scsi/csiostor/csio_attr.c:344:27: sparse: invalid assignment: +drivers/scsi/csiostor/csio_hw.c:192:25: sparse: incorrect type in assignment (different base types)
drivers/scsi/csiostor/csio_hw.c:271:25: sparse: incorrect type in argument 1 (different base types)
drivers/scsi/csiostor/csio_hw.c:431:17: sparse: cast to restricted __le32
drivers/scsi/csiostor/csio_hw.c:960:25: sparse: cast to restricted __be32
drivers/scsi/csiostor/csio_init.c:91:56: sparse: incorrect type in argument 3 (different base types)
drivers/scsi/csiostor/csio_lnode.c:217:21: sparse: incorrect type in assignment (different base types)
drivers/scsi/csiostor/csio_lnode.c:314:60: sparse: incorrect type in argument 4 (different base types)
drivers/scsi/csiostor/csio_lnode.c:334:29: sparse: incompatible types for operation (++)
drivers/scsi/csiostor/csio_mb.c:1145:57: sparse: incorrect type in assignment (different base types)
drivers/scsi/csiostor/csio_mb.c:1417:29: sparse: restricted __be64 degrades to integer
drivers/scsi/csiostor/csio_rnode.c:341:41: sparse: cast to restricted __be32
drivers/scsi/csiostor/csio_rnode.c:532:37: sparse: incorrect type in assignment (different base types)
drivers/scsi/csiostor/csio_scsi.c:451:20: sparse: incorrect type in assignment (different base types)
drivers/scsi/csiostor/csio_scsi.c:452:21: sparse: cast from restricted __be16
drivers/scsi/csiostor/csio_scsi.c:1152:48: sparse: cast from restricted __be64
drivers/scsi/csiostor/csio_scsi.c:1192:17: sparse: context imbalance in 'csio_scsi_cleanup_io_q' - unexpected unlock
drivers/net/wireless/ti/wlcore/tx.c:823:26: sparse: cast truncates bits from constant value (400 becomes 0)
net/mac80211/rc80211_minstrel.c:185:13: sparse: incompatible types in comparison expression (different base types)
net/mac80211/rc80211_minstrel.c:185:13: sparse: cast from unknown type
net/mac80211/rc80211_minstrel.c:185:13: sparse: incompatible types for operation (-)
drivers/target/target_core_sbc.c:436:29: sparse: restricted sense_reason_t degrades to integer
drivers/hv/hv_balloon.c:548:6: sparse: symbol 'free_balloon_pages' was not declared. Should it be static?
fs/xfs/xfs_ialloc_btree.c:186:1: sparse: symbol 'xfs_inobt_verify' was not declared. Should it be static?
fs/xfs/xfs_da_btree.c:153:26: sparse: symbol 'xfs_da_node_buf_ops' was not declared. Should it be static?
fs/xfs/xfs_dir2_leaf.c:82:1: sparse: symbol 'xfs_dir2_leafn_read_verify' was not declared. Should it be static?
fs/xfs/xfs_dir2_leaf.c:89:1: sparse: symbol 'xfs_dir2_leafn_write_verify' was not declared. Should it be static?
fs/xfs/xfs_dquot.c:294:1: sparse: symbol 'xfs_dquot_buf_write_verify' was not declared. Should it be static?
net/mac80211/rc80211_minstrel.c:185:13: sparse: undefined identifier 'mp'
drivers/net/phy/smsc.c:208:10: sparse: Initializer entry defined twice
drivers/tty/serial/ifx6x60.c:516:9: sparse: mixing declarations and code
drivers/gpu/drm/qxl/qxl_ioctl.c:285:5: sparse: symbol 'qxl_max_ioctls' was not declared. Should it be static?

[smatch]
drivers/scsi/csiostor/csio_lnode.c:223 csio_hostname() error: snprintf() chops off the last chars of 'init_utsname()->nodename': 65 vs 64
drivers/scsi/csiostor/csio_hw.c:4088 csio_mgmt_tmo_handler() warn: assigning -110 to unsigned variable 'io_req->wr_status'
drivers/scsi/csiostor/csio_hw.c:4127 csio_mgmtm_cleanup() warn: assigning -110 to unsigned variable 'io_req->wr_status'
drivers/scsi/csiostor/csio_mb.c:1631 csio_mb_isr_handler() warn: was 'sizeof(*mbp)' intended?
drivers/scsi/csiostor/csio_rnode.c:871 csio_rnode_fwevt_handler() error: buffer overflow '(rn)->stats.n_evt_fw' 22 <= 26
drivers/scsi/csiostor/csio_scsi.c:337 csio_scsi_init_ultptx_dsgl() error: potential NULL dereference 'sge_pair'.
drivers/scsi/csiostor/csio_scsi.c:1818 csio_queuecommand() error: potential NULL dereference 'rport'.
drivers/scsi/csiostor/csio_scsi.c:2245 csio_eh_lun_reset_handler() error: we previously assumed 'rn' could be null (see line 2100)
drivers/scsi/csiostor/csio_wr.c:292 csio_wr_alloc_q() warn: returning -1 instead of -ENOMEM is sloppy
drivers/vfio/vfio.c:272 vfio_create_group() warn: inconsistent returns mutex:&vfio.group_lock: locked (244,253,262) unlocked (216,236,272)
fs/xfs/xfs_dir2_node.c:1682 xfs_dir2_node_addname_int() error: we previously assumed 'fbp' could be null (see line 1461)
fs/xfs/xfs_dir2_data.c:158 __xfs_dir2_data_check() error: potential NULL dereference 'btp'.
fs/xfs/xfs_dir2_data.c:159 __xfs_dir2_data_check() error: potential NULL dereference 'lep'.
drivers/gpu/drm/qxl/qxl_display.c:73 qxl_alloc_client_monitors_config() error: dereferencing freed memory 'qdev->client_monitors_config'
drivers/gpu/drm/qxl/qxl_kms.c:113 qxl_device_init() warn: 'qdev->rom' was not released on error
drivers/gpu/drm/qxl/qxl_kms.c:162 qxl_device_init() warn: 'qdev->ram_header' was not released on error
drivers/gpu/drm/qxl/qxl_object.c:35 qxl_ttm_placement_from_domain() warn: bitwise AND condition is false here

[coccinelle]
fs/xfs/xfs_inode.c:1784:3-17: code aligned with following code on line 1795

[cppcheck]
drivers/net/can/grcan.c:217: error: "Invalid default buffer size"

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
