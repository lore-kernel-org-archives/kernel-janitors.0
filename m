From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 28 Nov 2012 16:48:11 +0000
Subject: build regressions 2012-11-28
Message-Id: <50b6404b.qSXU6dnA5vHmbml1%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/mach-spear13xx/built-in.o:(.data+0x40): undefined reference to `cf_dma_priv'
drivers/input/rmi4/rmi_bus.c:158:39: error: 'rmi_debugfs_root' undeclared (first use in this function)
drivers/input/rmi4/rmi_bus.c:159:10: error: 'struct rmi_device' has no member named 'debugfs_root'
drivers/input/rmi4/rmi_driver.c:951:20: error: 'struct rmi_device' has no member named 'debugfs_root'
drivers/input/rmi4/rmi_driver.c:949:5: error: 'struct rmi_function' has no member named 'debugfs_root'
ERROR: "devfreq_monitor_resume" undefined!
ERROR: "devfreq_monitor_suspend" undefined!
ERROR: "devfreq_interval_update" undefined!
ERROR: "devfreq_monitor_stop" undefined!
ERROR: "devfreq_monitor_start" undefined!
drivers/input/rmi4/rmi_driver.c:1543:7: error: 'struct rmi_driver_data' has no member named 'pm_data'
drivers/input/rmi4/rmi_driver.c:1543:24: error: 'struct rmi_device_platform_data' has no member named 'pm_data'
drivers/input/rmi4/rmi_driver.c:1544:7: error: 'struct rmi_driver_data' has no member named 'pre_suspend'
drivers/input/rmi4/rmi_driver.c:1544:28: error: 'struct rmi_device_platform_data' has no member named 'pre_suspend'
drivers/input/rmi4/rmi_driver.c:1545:7: error: 'struct rmi_driver_data' has no member named 'post_suspend'
drivers/input/rmi4/rmi_driver.c:1545:29: error: 'struct rmi_device_platform_data' has no member named 'post_suspend'
drivers/input/rmi4/rmi_driver.c:1546:7: error: 'struct rmi_driver_data' has no member named 'pre_resume'
drivers/input/rmi4/rmi_driver.c:1546:27: error: 'struct rmi_device_platform_data' has no member named 'pre_resume'
drivers/input/rmi4/rmi_driver.c:1547:7: error: 'struct rmi_driver_data' has no member named 'post_resume'
drivers/input/rmi4/rmi_driver.c:1547:28: error: 'struct rmi_device_platform_data' has no member named 'post_resume'
drivers/input/rmi4/rmi_driver.c:1549:3: error: 'struct rmi_driver_data' has no member named 'suspend_mutex'
ERROR: "qxl_release_add_surf" undefined!
make[4]: *** No rule to make target `drivers/input/rmi4/rmi_f01.o', needed by `drivers/input/rmi4/built-in.o'.
make[4]: *** No rule to make target `drivers/input/rmi4/rmi_f11.c', needed by `drivers/input/rmi4/rmi_f11.o'.
drivers/input/rmi4/rmi_driver.c:45:21: fatal error: rmi_f01.h: No such file or directory
rmi_i2c.c:(.text+0x12935a): undefined reference to `i2c_master_send'
rmi_i2c.c:(.text+0x12961e): undefined reference to `i2c_master_recv'
sge.c:(.text+0x297d44): undefined reference to `arp_send'

[warnings]
warning: (LOCKDEP && FAULT_INJECTION_STACKTRACE_FILTER && LATENCYTOP && KMEMCHECK) selects FRAME_POINTER which has unmet direct dependencies (DEBUG_KERNEL && (CRIS || M68K || FRV || UML || AVR32 || SUPERH || BLACKFIN || MN10300) || ARCH_WANT_FRAME_POINTERS || MCOUNT)
drivers/gpu/drm/qxl/qxl_ioctl.c:247:1: warning: label 'out' defined but not used [-Wunused-label]
WARNING: drivers/input/rmi4/built-in.o(.data+0x1d40): Section mismatch in reference from the variable function_handler to the function .devinit.text:f01_probe()
drivers/input/rmi4/rmi_f11.c:1681:11: warning: 'w_min' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/input/rmi4/rmi_f11.c:1680:11: warning: 'w_max' may be used uninitialized in this function [-Wmaybe-uninitialized]
WARNING: drivers/input/rmi4/rmi_core.o(.init.text+0xe5): Section mismatch in reference from the function init_module() to the function .exit.text:rmi_unregister_f01_handler()
WARNING: drivers/input/rmi4/rmi_f11.o(.data+0x30): Section mismatch in reference from the variable function_handler to the function .devinit.text:f11_probe()
drivers/infiniband/ulp/srpt/ib_srpt.c:1832:6: warning: unused variable 'res' [-Wunused-variable]

[sparse]
fs/f2fs/segment.c:633:50: sparse: invalid assignment: |fs/f2fs/node.h:180:33: sparse: incorrect type in assignment (different base types)
fs/f2fs/segment.c:1070:25: sparse: restricted __le32 degrades to integer
fs/f2fs/data.c:548:5: sparse: symbol 'f2fs_write_data_pages' was not declared. Should it be static?
fs/f2fs/hash.c:95:19: sparse: incorrect type in assignment (different base types)
fs/f2fs/hash.c:96:19: sparse: invalid assignment: &fs/f2fs/dir.c:83:43: sparse: restricted __le32 degrades to integer
fs/f2fs/dir.c:440:25: sparse: cast from restricted __le32
fs/f2fs/super.c:92:6: sparse: symbol 'f2fs_destroy_inode' was not declared. Should it be static?
fs/f2fs/recovery.c:84:25: sparse: cast to restricted __le32
fs/f2fs/recovery.c:84:25: sparse: cast from restricted __le16
fs/f2fs/checkpoint.c:379:20: sparse: cast to restricted __le64
fs/f2fs/checkpoint.c:379:20: sparse: cast from restricted __le32
fs/f2fs/checkpoint.c:655:33: sparse: incorrect type in assignment (different base types)
fs/f2fs/checkpoint.c:660:49: sparse: bad assignment (+=) to restricted __le32
fs/f2fs/debug.c:30:6: sparse: symbol 'update_general_status' was not declared. Should it be static?
fs/f2fs/super.c:448:49: sparse: incorrect type in argument 1 (different base types)
fs/f2fs/super.c:530:24: sparse: restricted __le32 degrades to integer
fs/hfsplus/xattr.c:363:23: sparse: cast to restricted __be32
drivers/mfd/max8997.c:170:16: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/qxl/qxl_cmd.c:416:18: sparse: context imbalance in 'qxl_surface_id_alloc' - different lock contexts for basic block
drivers/input/rmi4/rmi_bus.c:31:1: sparse: symbol 'rmi_bus_mutex' was not declared. Should it be static?
drivers/input/rmi4/rmi_driver.c:700:9: sparse: bad constant expression
drivers/input/rmi4/rmi_f01.c:169:24: sparse: bad constant expression
drivers/input/rmi4/rmi_f11.c:2660:5: sparse: symbol 'rmi_f11_attention' was not declared. Should it be static?
drivers/net/ethernet/intel/igbvf/netdev.c:115:31: sparse: cast to restricted __be16
arch/x86/kernel/kvmclock.c:269:12: sparse: symbol 'kvm_setup_vsyscall_timeinfo' was not declared. Should it be static?

[smatch]
drivers/media/rc/rc-main.c:937 store_protocols() warn: inconsistent returns mutex:&dev->lock: locked (893) unlocked (853,937)
drivers/input/rmi4/rmi_driver.c:379 rmi_irq_thread() warn: variable dereferenced before check 'rmi_dev' (see line 367)
drivers/input/rmi4/rmi_driver.c:1152 get_prod_id() error: buffer overflow 'pattern' 3 <= 11
drivers/input/rmi4/rmi_f11.c:2090 f11_write_control_regs() warn: was 'sizeof(*ctrl->ctrl14)' intended?

[coccinelle]
drivers/input/rmi4/rmi_driver.c:1576:13-15: ERROR: invalid reference to the index variable of the iterator on line 1470
drivers/input/rmi4/rmi_f11.c:2091:18-24: ERROR: application of sizeof to pointer

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
