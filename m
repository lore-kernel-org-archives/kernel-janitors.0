From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 12 Mar 2013 20:55:10 +0000
Subject: build regressions 2013-03-12
Message-Id: <513f962e.vEVsdQvhkJGGoKrT%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/mach-shmobile/setup-r8a7779.c:109:1: error: implicit declaration of function 'gic_iid' [-Werror=implicit-function-declaration]
arch/arm/mach-shmobile/setup-r8a7779.c:109:1: error: initializer element is not constant
arch/arm/mach-shmobile/setup-r8a7779.c:110:1: error: initializer element is not constant
arch/arm/mach-shmobile/setup-r8a7779.c:111:1: error: initializer element is not constant
arch/arm/mach-shmobile/setup-r8a7779.c:112:1: error: initializer element is not constant
arch/arm/mach-shmobile/setup-r8a7779.c:113:1: error: initializer element is not constant
arch/arm/mach-shmobile/setup-r8a7779.c:114:1: error: initializer element is not constant
arch/arm/mach-shmobile/setup-r8a7779.c:115:1: error: initializer element is not constant
net/batman-adv/network-coding.c:200: error: expected ';' before 'batadv_nc_purge_orig'
net/batman-adv/network-coding.c:199:61: error: macro "hlist_for_each_entry_rcu" passed 4 arguments, but takes just 3
net/batman-adv/network-coding.c:199:3: error: unknown type name 'hlist_for_each_entry_rcu'
net/batman-adv/network-coding.c:200:4: error: conflicting types for 'batadv_nc_purge_orig'
net/batman-adv/network-coding.c:446:61: error: macro "hlist_for_each_entry_rcu" passed 4 arguments, but takes just 3
net/batman-adv/network-coding.c:446:3: error: 'hlist_for_each_entry_rcu' undeclared (first use in this function)
net/batman-adv/network-coding.c:446:63: error: expected ';' before '{' token
net/batman-adv/network-coding.c:298:24: error: macro "hlist_for_each_entry_safe" passed 5 arguments, but takes just 4
net/batman-adv/network-coding.c:297:3: error: 'hlist_for_each_entry_safe' undeclared (first use in this function)
drivers/vhost/net.c:323:3: error: implicit declaration of function 'vringh_discard_user' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/ni_atmio.c:470:16: error: 'boardtype' undeclared (first use in this function)
drivers/staging/comedi/drivers/ni_atmio.c:353:18: error: 'n_ni_boards' undeclared (first use in this function)
drivers/staging/comedi/drivers/ni_atmio.c:391:18: error: 'n_ni_boards' undeclared (first use in this function)
drivers/net/ethernet/8390/atari_ethernec.c:101:24: fatal error: asm/system.h: No such file or directory
ERROR: "devm_request_threaded_irq" [drivers/spi/spi-altera.ko] undefined!
ERROR: "mfd_add_devices" [drivers/mfd/lpc_sch.ko] undefined!
ERROR: "mfd_remove_devices" [drivers/mfd/lpc_sch.ko] undefined!
security/integrity/ima/ima_fs.c:152:53: error: 'struct ima_template_entry' has no member named 'template'
security/integrity/ima/ima_fs.c:227:53: error: 'struct ima_template_entry' has no member named 'template'
security/integrity/ima/ima_queue.c:145:13: error: 'struct ima_template_entry' has no member named 'template'
security/integrity/ima/ima_init.c:54:15: error: 'struct ima_template_entry' has no member named 'template'
security/integrity/ima/ima_init.c:54:42: error: 'struct ima_template_entry' has no member named 'template'
security/integrity/ima/ima_init.c:55:15: error: 'struct ima_template_entry' has no member named 'template'
security/integrity/ima/ima_init.c:59:41: error: 'struct ima_template_entry' has no member named 'template'
security/integrity/ima/ima_api.c:51:35: error: 'ima_template_entry' undeclared (first use in this function)
security/integrity/ima/ima_api.c:205:2: error: 'entry_len' undeclared (first use in this function)
fs/xfs/xfs_inode_item.c:191:4: error: 'struct xfs_inode_log_item' has no member named 'ili_extents_buf'
fs/xfs/xfs_inode_item.c:337:4: error: 'struct xfs_inode_log_item' has no member named 'ili_aextents_buf'
drivers/xen/tmem.c:418:6: error: 'disable_frontswap_selfshrinking' undeclared (first use in this function)

[warnings]
drivers/lguest/lguest_device.c:402:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/lguest/lguest_device.c:402:2: warning: (near initialization for 'lguest_config_ops.get') [enabled by default]
drivers/lguest/lguest_device.c:403:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/lguest/lguest_device.c:403:2: warning: (near initialization for 'lguest_config_ops.set') [enabled by default]
net/batman-adv/network-coding.c:201:11: warning: parameter names (without types) in function declaration [enabled by default]
net/batman-adv/network-coding.c:199:3: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
net/batman-adv/network-coding.c:188:27: warning: unused variable 'orig_node' [-Wunused-variable]
net/batman-adv/network-coding.c:186:21: warning: unused variable 'node' [-Wunused-variable]
net/batman-adv/network-coding.c:433:25: warning: unused variable 'nc_node' [-Wunused-variable]
net/batman-adv/network-coding.c:432:27: warning: unused variable 'orig_node' [-Wunused-variable]
net/batman-adv/network-coding.c:430:21: warning: unused variable 'node' [-Wunused-variable]
net/batman-adv/network-coding.c:287:25: warning: unused variable 'nc_path' [-Wunused-variable]
net/batman-adv/network-coding.c:286:28: warning: unused variable 'node_tmp' [-Wunused-variable]
net/batman-adv/network-coding.c:409:25: warning: unused variable 'nc_path' [-Wunused-variable]
net/batman-adv/network-coding.c:503:7: warning: unused variable 'ret' [-Wunused-variable]
net/batman-adv/network-coding.c:502:25: warning: unused variable 'nc_path' [-Wunused-variable]
net/batman-adv/network-coding.c:501:39: warning: unused variable 'nc_packet_tmp' [-Wunused-variable]
net/batman-adv/network-coding.c:501:27: warning: unused variable 'nc_packet' [-Wunused-variable]
net/batman-adv/network-coding.c:1607:27: warning: unused variable 'tmp_nc_packet' [-Wunused-variable]
net/batman-adv/network-coding.c:1606:21: warning: unused variable 'hnode' [-Wunused-variable]
drivers/vhost/net.c:234:16: warning: unused variable 'in' [-Wunused-variable]
drivers/media/i2c/s5c73m3/s5c73m3-core.c:1389:19: warning: ignoring return value of 'regulator_enable', declared with attribute warn_unused_result [-Wunused-result]
warning: (IRQ_NVIC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_TPS65910 && TWL4030_CORE && MFD_LP8788 && MFD_MAX77686 && MFD_MAX8997 && MFD_WM831X_I2C && MFD_WM831X_SPI && AB8500_CORE && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (IRQ_NVIC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_TPS65910 && TWL4030_CORE && MFD_LP8788 && MFD_MAX77686 && MFD_MAX8997 && MFD_WM831X_I2C && MFD_WM831X_SPI && AB8500_CORE && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (IRQ_NVIC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_TPS65910 && TWL4030_CORE && MFD_LP8788 && MFD_MAX77686 && MFD_MAX8997 && MFD_WM831X_I2C && MFD_WM831X_SPI && AB8500_CORE && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
drivers/input/misc/ims-pcu.c:1194:18: warning: 'fw' may be used uninitialized in this function [-Wmaybe-uninitialized]
security/integrity/ima/ima_api.c:100:11: warning: assignment from incompatible pointer type [enabled by default]
security/integrity/ima/ima_api.c:224:11: warning: assignment from incompatible pointer type [enabled by default]
fs/xfs/xfs_inode_item.c:444:9: warning: unused variable 'type' [-Wunused-variable]
fs/xfs/xfs_inode_item.c:441:20: warning: unused variable 'ip' [-Wunused-variable]

[sparse]
net/batman-adv/network-coding.c:199:17: sparse: macro "hlist_for_each_entry_rcu" passed 4 arguments, but takes just 3
net/batman-adv/network-coding.c:446:17: sparse: macro "hlist_for_each_entry_rcu" passed 4 arguments, but takes just 3
net/batman-adv/network-coding.c:473:9: sparse: Trying to use reserved word 'return' as identifier
net/batman-adv/network-coding.c:485:9: sparse: Trying to use reserved word 'if' as identifier
net/batman-adv/network-coding.c:490:9: sparse: Trying to use reserved word 'if' as identifier
net/batman-adv/network-coding.c:493:9: sparse: Trying to use reserved word 'return' as identifier
net/batman-adv/network-coding.c:297:17: sparse: macro "hlist_for_each_entry_safe" passed 5 arguments, but takes just 4
net/batman-adv/network-coding.c:427:17: sparse: Trying to use reserved word 'break' as identifier
net/batman-adv/network-coding.c:510:9: sparse: Trying to use reserved word 'for' as identifier
net/batman-adv/network-coding.c:518:25: sparse: Trying to use reserved word 'for' as identifier
net/batman-adv/network-coding.c:518:25: sparse: Trying to use reserved word 'typeof' as identifier
net/batman-adv/network-coding.c:518:25: sparse: Trying to use reserved word 'typeof' as identifier
net/batman-adv/network-coding.c:521:37: sparse: too many errors
drivers/acpi/sysfs.c:753:18: sparse: symbol 'acpi_hotplug_profile_ktype' was not declared. Should it be static?
drivers/staging/zcache/debug.c:60:6: sparse: symbol 'zcache_dump' was not declared. Should it be static?
drivers/net/ethernet/sfc/efx.c:2929:18: sparse: symbol 'efx_io_error_detected' was not declared. Should it be static?
drivers/net/ethernet/sfc/efx.c:2965:18: sparse: symbol 'efx_io_slot_reset' was not declared. Should it be static?
drivers/net/ethernet/sfc/rx.c:671:6: sparse: symbol 'efx_init_rx_recycle_ring' was not declared. Should it be static?
security/integrity/ima/ima_fs.c:152:31: sparse: cast from unknown type
security/integrity/ima/ima_fs.c:227:31: sparse: cast from unknown type
net/batman-adv/network-coding.c:302:25: sparse: Expected ; at end of statement
net/batman-adv/network-coding.c:302:25: sparse: got batadv_nc_purge_orig
net/batman-adv/network-coding.c:336:61: sparse: got {
net/batman-adv/network-coding.c:366:1: sparse: Expected ; at the end of type declaration
net/batman-adv/network-coding.c:378:19: sparse: Expected ) in function declarator
net/batman-adv/network-coding.c:398:14: sparse: Expected ; at end of declaration
net/batman-adv/network-coding.c:402:16: sparse: got hash
net/batman-adv/network-coding.c:422:19: sparse: got (
net/batman-adv/network-coding.c:468:16: sparse: got nc_path_tmp
net/batman-adv/network-coding.c:517:4: sparse: got :
net/batman-adv/network-coding.c:554:16: sparse: got true
drivers/clk/x86/clk-lpt.c:45:12: sparse: symbol 'lpt_clk_init' was not declared. Should it be static?
drivers/vhost/net.c:323:17: sparse: undefined identifier 'vringh_discard_user'
security/integrity/ima/ima_fs.c:159:60: sparse: no member 'template' in struct ima_template_entry
security/integrity/ima/ima_queue.c:145:34: sparse: no member 'template' in struct ima_template_entry
security/integrity/ima/ima_init.c:54:22: sparse: no member 'template' in struct ima_template_entry
security/integrity/ima/ima_api.c:51:49: sparse: undefined identifier 'ima_template_entry'
security/integrity/ima/ima_api.c:205:9: sparse: undefined identifier 'entry_len'

[smatch]
fs/namespace.c:1416 clone_private_mount() error: 'new_mnt' dereferencing possible ERR_PTR()

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
