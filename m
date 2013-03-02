From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 02 Mar 2013 17:06:00 +0000
Subject: build regressions 2013-03-02
Message-Id: <51323178./7i32VJSe+SoIN1i%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
irq_work.c:(.text+0x38e8): undefined reference to `__bad_udelay'
arch/arm/boot/compressed/atags_to_fdt.c:145:18: error: '____atag' undeclared (first use in this function)
drivers/pinctrl/pinctrl-single.c:1441:3: error: assignment of member 'is_generic' in read-only object
arch/arm/mach-prima2/platsmp.c:56:2: error: implicit declaration of function 'gic_secondary_init' [-Werror=implicit-function-declaration]
arch/arm/mach-s3c24xx/irq.c:270:2: error: implicit declaration of function 'chained_irq_enter' [-Werror=implicit-function-declaration]
arch/arm/mach-s3c24xx/irq.c:284:2: error: implicit declaration of function 'chained_irq_exit' [-Werror=implicit-function-declaration]
include/linux/workqueue.h:124: error: expected specifier-qualifier-list before 'cpumask_var_t'
mm/mincore.c:50:11: error: 'present' undeclared (first use in this function)
fs/btrfs/raid56.c:206:3: error: implicit declaration of function 'vzalloc' [-Werror=implicit-function-declaration]
fs/btrfs/raid56.c:226:4: error: implicit declaration of function 'vfree' [-Werror=implicit-function-declaration]
drivers/net/virtio_net.c:825:8: error: too many arguments to function 'virtnet_send_command'
include/linux/printk.h:54:2: error: unknown type name 'va_list'
include/linux/printk.h:100:1: error: expected ',' or ';' before 'void'
include/linux/printk.h:101:37: error: unknown type name 'va_list'
include/linux/printk.h:109:1: error: expected ',' or ';' before 'int'
include/linux/printk.h:114:1: error: expected ',' or ';' before 'int'
include/linux/printk.h:117:1: error: expected ',' or ';' before 'asmlinkage'
include/linux/printk.h:122:1: error: expected ',' or ';' before 'int'
fs/9p/fid.c:77:40: error: macro "hlist_for_each_entry" passed 4 arguments, but takes just 3
fs/9p/fid.c:77:3: error: 'hlist_for_each_entry' undeclared (first use in this function)
fs/9p/fid.c:77:42: error: expected ';' before '{' token
sound/soc/codecs/arizona.c:373:4: error: implicit declaration of function 'msleep' [-Werror=implicit-function-declaration]
drivers/scsi/virtio_scsi.c:223:2: error: implicit declaration of function 'virtqueue_add_buf' [-Werror=implicit-function-declaration]
fs/aio.c:451:60: error: macro "hlist_for_each_entry_safe" passed 5 arguments, but takes just 4
fs/aio.c:451:2: error: 'hlist_for_each_entry_safe' undeclared (first use in this function)
fs/aio.c:451:62: error: expected ';' before '{' token
fs/nfsd/nfs4state.c:1082:1: error: expected expression before '<<' token
fs/nfsd/nfs4state.c:1085:1: error: expected expression before '>>' token
kernel/workqueue.c:3627:70: error: macro "hash_for_each_possible" passed 5 arguments, but takes just 4
kernel/workqueue.c:3627:2: error: 'hash_for_each_possible' undeclared (first use in this function)
kernel/workqueue.c:3627:72: error: expected ';' before '{' token
arch/x86/xen/mmu.c:2233:10: error: 'struct x86_init_ops' has no member named 'mapping'
net/nfc/netlink.c:389:59: error: macro "hlist_for_each_entry_safe" passed 5 arguments, but takes just 4
net/nfc/netlink.c:389:2: error: 'hlist_for_each_entry_safe' undeclared (first use in this function)
net/nfc/netlink.c:389:61: error: expected ';' before '{' token
drivers/gpio/gpio-stmpe.c:313:23: error: 'struct gpio_chip' has no member named 'of_node'
drivers/gpio/gpio-stmpe.c:316:61: error: 'struct gpio_chip' has no member named 'of_node'
drivers/gpio/gpio-stmpe.c:351:18: error: 'struct gpio_chip' has no member named 'of_node'
kernel/trace/trace_events.c:1689:42: error: dereferencing pointer to incomplete type
kernel/trace/trace_events.c:1694:15: error: dereferencing pointer to incomplete type
kernel/trace/trace_events.c:1694:30: error: dereferencing pointer to incomplete type
kernel/trace/trace_events.c:1695:15: error: dereferencing pointer to incomplete type
kernel/trace/trace_events.c:1695:34: error: dereferencing pointer to incomplete type
kernel/trace/trace_events.c:1721:21: error: dereferencing pointer to incomplete type
kernel/trace/trace_events.c:1721:36: error: dereferencing pointer to incomplete type
kernel/trace/trace_events.c:1722:21: error: dereferencing pointer to incomplete type
kernel/trace/trace_events.c:1722:40: error: dereferencing pointer to incomplete type

[warnings]
sound/soc/omap/omap3pandora.c:88:19: warning: ignoring return value of 'regulator_enable', declared with attribute warn_unused_result [-Wunused-result]
arch/arm/mach-tegra/board-harmony-pcie.c:65:18: warning: ignoring return value of 'regulator_enable', declared with attribute warn_unused_result [-Wunused-result]
fs/namei.c:1280: warning: '__lookup_union' defined but not used
drivers/md/dm-thin.c:2429: warning: 'block_size_is_power_of_two' defined but not used
fs/fs_struct.c:17:2: warning: passing argument 1 of 'path_get' discards 'const' qualifier from pointer target type [enabled by default]
fs/fs_struct.c:36:2: warning: passing argument 1 of 'path_get' discards 'const' qualifier from pointer target type [enabled by default]
fs/fs_struct.c:75:5: warning: passing argument 1 of 'path_get' discards 'const' qualifier from pointer target type [enabled by default]
fs/fs_struct.c:83:3: warning: passing argument 1 of 'path_put' discards 'const' qualifier from pointer target type [enabled by default]
fs/9p/fid.c:75:22: warning: unused variable 'n' [-Wunused-variable]
fs/9p/fid.c:74:22: warning: unused variable 'h' [-Wunused-variable]
fs/9p/fid.c:66:17: warning: unused variable 'fid' [-Wunused-variable]
include/uapi/linux/swab.h:60:2: warning: 'search_cnid' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/uapi/linux/swab.h:60:2: warning: 'cur_cnid' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/btrfs/raid56.c:206:9: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/virtio_net.c:825:8: warning: passing argument 5 of 'virtnet_send_command' makes pointer from integer without a cast [enabled by default]
kernel/workqueue.c:3503:13: warning: 'wqattrs_equal' defined but not used
fs/aio.c:449:25: warning: unused variable 'n' [-Wunused-variable]
fs/aio.c:449:21: warning: unused variable 'p' [-Wunused-variable]
fs/aio.c:448:17: warning: unused variable 'ctx' [-Wunused-variable]
drivers/md/dm-cache-metadata.c:417:5: warning: 'unformatted' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/input/touchscreen/ads7846.c:239:18: warning: ignoring return value of 'regulator_enable', declared with attribute warn_unused_result [-Wunused-result]
drivers/usb/otg/gpio_vbus.c:72:20: warning: ignoring return value of 'regulator_enable', declared with attribute warn_unused_result [-Wunused-result]
drivers/video/backlight/l4f00242t03.c:58:18: warning: ignoring return value of 'regulator_enable', declared with attribute warn_unused_result [-Wunused-result]
drivers/video/backlight/l4f00242t03.c:61:18: warning: ignoring return value of 'regulator_enable', declared with attribute warn_unused_result [-Wunused-result]
kernel/workqueue.c:3658:1: warning: label 'out_unlock' defined but not used [-Wunused-label]
kernel/workqueue.c:3620:21: warning: unused variable 'tmp' [-Wunused-variable]
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
Warning(include/net/cfg80211.h:2228): No description found for parameter 'update_ft_ies'
net/nfc/netlink.c:365:27: warning: unused variable 'n' [-Wunused-variable]
net/nfc/netlink.c:365:21: warning: unused variable 'pos' [-Wunused-variable]
net/nfc/netlink.c:364:27: warning: unused variable 'sdres' [-Wunused-variable]
net/nfc/netlink.c:363:28: warning: unused variable 'uri_attr' [-Wunused-variable]
drivers/hwmon/sht15.c:929:19: warning: ignoring return value of 'regulator_enable', declared with attribute warn_unused_result [-Wunused-result]
fs/hfsplus/bfind.c:73:2: warning: 'search_cnid' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/hfsplus/bfind.c:73:2: warning: 'cur_cnid' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/mmc/host/sdhci.c:2870:19: warning: ignoring return value of 'regulator_enable', declared with attribute warn_unused_result [-Wunused-result]
drivers/mmc/host/sdhci.c:1713:19: warning: ignoring return value of 'regulator_enable', declared with attribute warn_unused_result [-Wunused-result]
drivers/power/twl4030_charger.c:192:20: warning: ignoring return value of 'regulator_enable', declared with attribute warn_unused_result [-Wunused-result]
drivers/leds/leds-wm8350.c:132:19: warning: ignoring return value of 'regulator_enable', declared with attribute warn_unused_result [-Wunused-result]
net/rfkill/rfkill-regulator.c:43:20: warning: ignoring return value of 'regulator_enable', declared with attribute warn_unused_result [-Wunused-result]
drivers/staging/ste_rmi4/synaptics_i2c_rmi4.c:1091:18: warning: ignoring return value of 'regulator_enable', declared with attribute warn_unused_result [-Wunused-result]
drivers/input/touchscreen/mms114.c:318:19: warning: ignoring return value of 'regulator_enable', declared with attribute warn_unused_result [-Wunused-result]
drivers/input/touchscreen/mms114.c:320:19: warning: ignoring return value of 'regulator_enable', declared with attribute warn_unused_result [-Wunused-result]

[sparse]
include/linux/sched.h:2382:37: sparse: context imbalance in 'zap_threads' - different lock contexts for basic block
drivers/staging/dgrp/dgrp_ports_ops.c:68:23: sparse: incorrect type in assignment (different address spaces)
drivers/staging/dgrp/dgrp_specproc.c:274:55: sparse: incorrect type in assignment (different address spaces)
drivers/staging/dgrp/dgrp_specproc.c:276:55: sparse: incorrect type in assignment (different address spaces)
drivers/usb/host/isp1362-hcd.c:2201:24: sparse: incorrect type in assignment (different address spaces)
fs/proc/inode.c:287:27: sparse: dereference of noderef expression
fs/proc/inode.c:312:19: sparse: dereference of noderef expression
fs/proc/inode.c:322:12: sparse: context imbalance in 'proc_reg_open' - wrong count at exit
fs/proc/inode.c:391:12: sparse: context imbalance in 'proc_reg_release' - different lock contexts for basic block
fs/proc/inode.c:486:40: sparse: dereference of noderef expression
ipc/msg.c:810:16: sparse: symbol 'find_msg' was not declared. Should it be static?
fs/fs_struct.c:17:18: sparse: incorrect type in argument 1 (different modifiers)
fs/fs_struct.c:36:18: sparse: incorrect type in argument 1 (different modifiers)
fs/fs_struct.c:75:42: sparse: incorrect type in argument 1 (different modifiers)
fs/fs_struct.c:83:26: sparse: incorrect type in argument 1 (different modifiers)
kernel/workqueue.c:3627:9: sparse: macro "hash_for_each_possible" passed 5 arguments, but takes just 4
kernel/workqueue.c:3637:9: sparse: Trying to use reserved word 'if' as identifier
kernel/workqueue.c:3643:9: sparse: Trying to use reserved word 'if' as identifier
kernel/workqueue.c:3648:9: sparse: Trying to use reserved word 'if' as identifier
kernel/workqueue.c:3661:9: sparse: Trying to use reserved word 'return' as identifier
kernel/workqueue.c:3664:9: sparse: Trying to use reserved word 'if' as identifier
kernel/workqueue.c:3666:9: sparse: Trying to use reserved word 'return' as identifier
kernel/workqueue.c:3672:25: sparse: Trying to use reserved word 'struct' as identifier
kernel/workqueue.c:3681:38: sparse: Trying to use reserved word 'struct' as identifier
kernel/workqueue.c:3686:9: sparse: Trying to use reserved word 'if' as identifier
kernel/workqueue.c:3686:13: sparse: Trying to use reserved word 'if' as identifier
kernel/workqueue.c:3686:13: sparse: Trying to use reserved word 'if' as identifier
kernel/workqueue.c:3707:9: sparse: Trying to use reserved word 'if' as identifier
kernel/workqueue.c:3722:12: sparse: too many errors
drivers/tty/sysrq.c:873:16: sparse: symbol 'platform_sysrq_reset_seq' was not declared. Should it be static?
kernel/trace/trace_functions.c:79:16: sparse: incorrect type in initializer (different address spaces)
kernel/trace/trace_functions.c:110:16: sparse: incorrect type in initializer (different address spaces)
kernel/trace/trace_functions_graph.c:268:16: sparse: incorrect type in initializer (different address spaces)
kernel/trace/trace_functions_graph.c:353:16: sparse: incorrect type in initializer (different address spaces)
kernel/trace/trace_irqsoff.c:124:17: sparse: incorrect type in initializer (different address spaces)
kernel/trace/trace_irqsoff.c:383:16: sparse: incorrect type in initializer (different address spaces)
kernel/trace/trace_irqsoff.c:421:16: sparse: incorrect type in initializer (different address spaces)
kernel/trace/trace_irqsoff.c:421:16: sparse: incorrect type in initializer (different address spaces)
kernel/trace/trace_irqsoff.c:383:16: sparse: incorrect type in initializer (different address spaces)
kernel/trace/trace_kdb.c:29:29: sparse: incorrect type in initializer (different address spaces)
kernel/trace/trace_kdb.c:86:29: sparse: incorrect type in initializer (different address spaces)
kernel/trace/trace_mmiotrace.c:333:40: sparse: incorrect type in initializer (different address spaces)
kernel/trace/trace_mmiotrace.c:366:16: sparse: incorrect type in initializer (different address spaces)
kernel/trace/trace_sched_switch.c:72:16: sparse: incorrect type in initializer (different address spaces)
kernel/trace/trace_sched_switch.c:126:16: sparse: incorrect type in initializer (different address spaces)
kernel/trace/trace_sched_wakeup.c:92:17: sparse: incorrect type in initializer (different address spaces)
kernel/trace/trace_sched_wakeup.c:356:20: sparse: incorrect type in initializer (different address spaces)
kernel/trace/trace_sched_wakeup.c:368:16: sparse: incorrect type in initializer (different address spaces)
kernel/trace/trace_sched_wakeup.c:390:21: sparse: incorrect type in initializer (different address spaces)
kernel/trace/trace_sched_wakeup.c:438:20: sparse: incorrect type in initializer (different address spaces)
kernel/trace/trace_sched_wakeup.c:461:16: sparse: incorrect type in initializer (different address spaces)
kernel/trace/trace_sched_wakeup.c:475:21: sparse: incorrect type in initializer (different address spaces)
kernel/kcmp.c:96:1: sparse: symbol 'SyS_kcmp' was not declared. Should it be static?
kernel/kexec.c:945:1: sparse: symbol 'SyS_kexec_load' was not declared. Should it be static?
kernel/nsproxy.c:239:1: sparse: symbol 'SyS_setns' was not declared. Should it be static?
kernel/posix-timers.c:535:1: sparse: symbol 'SyS_timer_create' was not declared. Should it be static?
kernel/posix-timers.c:715:1: sparse: symbol 'SyS_timer_gettime' was not declared. Should it be static?
kernel/posix-timers.c:751:1: sparse: symbol 'SyS_timer_getoverrun' was not declared. Should it be static?
kernel/posix-timers.c:819:1: sparse: symbol 'SyS_timer_settime' was not declared. Should it be static?
kernel/posix-timers.c:882:1: sparse: symbol 'SyS_timer_delete' was not declared. Should it be static?
kernel/posix-timers.c:950:1: sparse: symbol 'SyS_clock_settime' was not declared. Should it be static?
kernel/posix-timers.c:965:1: sparse: symbol 'SyS_clock_gettime' was not declared. Should it be static?
kernel/posix-timers.c:983:1: sparse: symbol 'SyS_clock_adjtime' was not declared. Should it be static?
kernel/posix-timers.c:1006:1: sparse: symbol 'SyS_clock_getres' was not declared. Should it be static?
kernel/posix-timers.c:1035:1: sparse: symbol 'SyS_clock_nanosleep' was not declared. Should it be static?
kernel/printk.c:1249:1: sparse: symbol 'SyS_syslog' was not declared. Should it be static?
kernel/sysctl_binary.c:1443:1: sparse: symbol 'SyS_sysctl' was not declared. Should it be static?
kernel/time.c:62:1: sparse: symbol 'SyS_time' was not declared. Should it be static?
kernel/time.c:81:1: sparse: symbol 'SyS_stime' was not declared. Should it be static?
kernel/time.c:101:1: sparse: symbol 'SyS_gettimeofday' was not declared. Should it be static?
kernel/time.c:187:1: sparse: symbol 'SyS_settimeofday' was not declared. Should it be static?
kernel/time.c:208:1: sparse: symbol 'SyS_adjtimex' was not declared. Should it be static?
kernel/timer.c:1391:1: sparse: symbol 'SyS_alarm' was not declared. Should it be static?
kernel/timer.c:1633:1: sparse: symbol 'SyS_sysinfo' was not declared. Should it be static?
kernel/uid16.c:19:1: sparse: symbol 'SyS_chown16' was not declared. Should it be static?
kernel/uid16.c:27:1: sparse: symbol 'SyS_lchown16' was not declared. Should it be static?
kernel/uid16.c:35:1: sparse: symbol 'SyS_fchown16' was not declared. Should it be static?
kernel/uid16.c:43:1: sparse: symbol 'SyS_setregid16' was not declared. Should it be static?
kernel/uid16.c:51:1: sparse: symbol 'SyS_setgid16' was not declared. Should it be static?
kernel/uid16.c:59:1: sparse: symbol 'SyS_setreuid16' was not declared. Should it be static?
kernel/uid16.c:67:1: sparse: symbol 'SyS_setuid16' was not declared. Should it be static?
kernel/uid16.c:75:1: sparse: symbol 'SyS_setresuid16' was not declared. Should it be static?
kernel/uid16.c:84:1: sparse: symbol 'SyS_getresuid16' was not declared. Should it be static?
kernel/uid16.c:101:1: sparse: symbol 'SyS_setresgid16' was not declared. Should it be static?
kernel/uid16.c:111:1: sparse: symbol 'SyS_getresgid16' was not declared. Should it be static?
kernel/uid16.c:128:1: sparse: symbol 'SyS_setfsuid16' was not declared. Should it be static?
kernel/uid16.c:136:1: sparse: symbol 'SyS_setfsgid16' was not declared. Should it be static?
kernel/uid16.c:184:1: sparse: symbol 'SyS_getgroups16' was not declared. Should it be static?
kernel/uid16.c:207:1: sparse: symbol 'SyS_setgroups16' was not declared. Should it be static?
mm/fadvise.c:28:1: sparse: symbol 'SyS_fadvise64_64' was not declared. Should it be static?
mm/fadvise.c:151:1: sparse: symbol 'SyS_fadvise64' was not declared. Should it be static?
mm/fremap.c:124:1: sparse: symbol 'SyS_remap_file_pages' was not declared. Should it be static?
mm/madvise.c:459:1: sparse: symbol 'SyS_madvise' was not declared. Should it be static?
mm/mempolicy.c:1345:1: sparse: symbol 'SyS_mbind' was not declared. Should it be static?
mm/mempolicy.c:1367:1: sparse: symbol 'SyS_set_mempolicy' was not declared. Should it be static?
mm/mempolicy.c:1386:1: sparse: symbol 'SyS_migrate_pages' was not declared. Should it be static?
mm/mempolicy.c:1482:1: sparse: symbol 'SyS_get_mempolicy' was not declared. Should it be static?
mm/mincore.c:267:1: sparse: symbol 'SyS_mincore' was not declared. Should it be static?
mm/mlock.c:436:1: sparse: symbol 'SyS_mlock' was not declared. Should it be static?
mm/mlock.c:466:1: sparse: symbol 'SyS_munlock' was not declared. Should it be static?
mm/mlock.c:503:1: sparse: symbol 'SyS_mlockall' was not declared. Should it be static?
mm/mmap.c:253:1: sparse: symbol 'SyS_brk' was not declared. Should it be static?
mm/mmap.c:1314:1: sparse: symbol 'SyS_mmap_pgoff' was not declared. Should it be static?
mm/mmap.c:2501:1: sparse: symbol 'SyS_munmap' was not declared. Should it be static?
mm/mprotect.c:321:1: sparse: symbol 'SyS_mprotect' was not declared. Should it be static?
mm/mremap.c:449:1: sparse: symbol 'SyS_mremap' was not declared. Should it be static?
mm/msync.c:31:1: sparse: symbol 'SyS_msync' was not declared. Should it be static?
mm/process_vm_access.c:398:1: sparse: symbol 'SyS_process_vm_readv' was not declared. Should it be static?
mm/process_vm_access.c:405:1: sparse: symbol 'SyS_process_vm_writev' was not declared. Should it be static?
mm/readahead.c:579:1: sparse: symbol 'SyS_readahead' was not declared. Should it be static?
mm/swapfile.c:1562:1: sparse: symbol 'SyS_swapoff' was not declared. Should it be static?
net/socket.c:1383:1: sparse: symbol 'SyS_socket' was not declared. Should it be static?
net/socket.c:1424:1: sparse: symbol 'SyS_socketpair' was not declared. Should it be static?
net/socket.c:1520:1: sparse: symbol 'SyS_bind' was not declared. Should it be static?
net/socket.c:1549:1: sparse: symbol 'SyS_listen' was not declared. Should it be static?
net/socket.c:1582:1: sparse: symbol 'SyS_accept4' was not declared. Should it be static?
net/socket.c:1663:1: sparse: symbol 'SyS_accept' was not declared. Should it be static?
net/socket.c:1681:1: sparse: symbol 'SyS_connect' was not declared. Should it be static?
net/socket.c:1713:1: sparse: symbol 'SyS_getsockname' was not declared. Should it be static?
net/socket.c:1744:1: sparse: symbol 'SyS_getpeername' was not declared. Should it be static?
net/socket.c:1776:1: sparse: symbol 'SyS_sendto' was not declared. Should it be static?
net/socket.c:1823:1: sparse: symbol 'SyS_send' was not declared. Should it be static?
net/socket.c:1835:1: sparse: symbol 'SyS_recvfrom' was not declared. Should it be static?
net/socket.c:1891:1: sparse: symbol 'SyS_setsockopt' was not declared. Should it be static?
net/socket.c:1925:1: sparse: symbol 'SyS_getsockopt' was not declared. Should it be static?
net/socket.c:1955:1: sparse: symbol 'SyS_shutdown' was not declared. Should it be static?
net/socket.c:2097:1: sparse: symbol 'SyS_sendmsg' was not declared. Should it be static?
net/socket.c:2172:1: sparse: symbol 'SyS_sendmmsg' was not declared. Should it be static?
net/socket.c:2270:1: sparse: symbol 'SyS_recvmsg' was not declared. Should it be static?
net/socket.c:2394:1: sparse: symbol 'SyS_recvmmsg' was not declared. Should it be static?
net/socket.c:2436:1: sparse: symbol 'SyS_socketcall' was not declared. Should it be static?
security/keys/keyctl.c:57:1: sparse: symbol 'SyS_add_key' was not declared. Should it be static?
security/keys/keyctl.c:157:1: sparse: symbol 'SyS_request_key' was not declared. Should it be static?
security/keys/keyctl.c:1569:1: sparse: symbol 'SyS_keyctl' was not declared. Should it be static?
arch/x86/kernel/ioport.c:96:1: sparse: symbol 'SyS_iopl' was not declared. Should it be static?
arch/x86/kernel/sys_x86_64.c:70:1: sparse: symbol 'SyS_mmap' was not declared. Should it be static?
fs/aio.c:1234:1: sparse: symbol 'SyS_io_setup' was not declared. Should it be static?
fs/aio.c:1270:1: sparse: symbol 'SyS_io_destroy' was not declared. Should it be static?
fs/aio.c:1682:1: sparse: symbol 'SyS_io_submit' was not declared. Should it be static?
fs/aio.c:1717:1: sparse: symbol 'SyS_io_cancel' was not declared. Should it be static?
fs/aio.c:1780:1: sparse: symbol 'SyS_io_getevents' was not declared. Should it be static?
fs/buffer.c:3201:1: sparse: symbol 'SyS_bdflush' was not declared. Should it be static?
fs/compat.c:1280:1: sparse: symbol 'compat_SyS_open' was not declared. Should it be static?
fs/compat.c:1289:1: sparse: symbol 'compat_SyS_openat' was not declared. Should it be static?
fs/compat.c:1666:1: sparse: symbol 'compat_SyS_open_by_handle_at' was not declared. Should it be static?
fs/dcookies.c:148:1: sparse: symbol 'SyS_lookup_dcookie' was not declared. Should it be static?
fs/eventfd.c:426:1: sparse: symbol 'SyS_eventfd2' was not declared. Should it be static?
fs/eventfd.c:451:1: sparse: symbol 'SyS_eventfd' was not declared. Should it be static?
fs/exec.c:105:1: sparse: symbol 'SyS_uselib' was not declared. Should it be static?
fs/exec.c:1673:1: sparse: symbol 'SyS_execve' was not declared. Should it be static?
fs/fcntl.c:349:1: sparse: symbol 'SyS_fcntl' was not declared. Should it be static?
fs/fhandle.c:92:1: sparse: symbol 'SyS_name_to_handle_at' was not declared. Should it be static?
fs/fhandle.c:254:1: sparse: symbol 'SyS_open_by_handle_at' was not declared. Should it be static?
fs/file.c:909:1: sparse: symbol 'SyS_dup3' was not declared. Should it be static?
fs/file.c:943:1: sparse: symbol 'SyS_dup2' was not declared. Should it be static?
fs/file.c:958:1: sparse: symbol 'SyS_dup' was not declared. Should it be static?
fs/file.c:909:1: sparse: context imbalance in 'SyS_dup3' - different lock contexts for basic block
fs/filesystems.c:183:1: sparse: symbol 'SyS_sysfs' was not declared. Should it be static?
fs/ioctl.c:604:1: sparse: symbol 'SyS_ioctl' was not declared. Should it be static?
fs/ioprio.c:61:1: sparse: symbol 'SyS_ioprio_set' was not declared. Should it be static?
fs/ioprio.c:176:1: sparse: symbol 'SyS_ioprio_get' was not declared. Should it be static?
fs/locks.c:1626:1: sparse: symbol 'SyS_flock' was not declared. Should it be static?
fs/namespace.c:1248:1: sparse: symbol 'SyS_umount' was not declared. Should it be static?
fs/namespace.c:1289:1: sparse: symbol 'SyS_oldumount' was not declared. Should it be static?
fs/namespace.c:2472:1: sparse: symbol 'SyS_mount' was not declared. Should it be static?
fs/namespace.c:2563:1: sparse: symbol 'SyS_pivot_root' was not declared. Should it be static?
fs/notify/fanotify/fanotify_user.c:670:1: sparse: symbol 'SyS_fanotify_init' was not declared. Should it be static?
fs/notify/fanotify/fanotify_user.c:758:1: sparse: symbol 'SyS_fanotify_mark' was not declared. Should it be static?
fs/notify/inotify/inotify_user.c:716:1: sparse: symbol 'SyS_inotify_init1' was not declared. Should it be static?
fs/notify/inotify/inotify_user.c:746:1: sparse: symbol 'SyS_inotify_add_watch' was not declared. Should it be static?
fs/notify/inotify/inotify_user.c:787:1: sparse: symbol 'SyS_inotify_rm_watch' was not declared. Should it be static?
fs/open.c:139:1: sparse: symbol 'SyS_truncate' was not declared. Should it be static?
fs/open.c:145:1: sparse: symbol 'compat_SyS_truncate' was not declared. Should it be static?
fs/open.c:198:1: sparse: symbol 'SyS_ftruncate' was not declared. Should it be static?
fs/open.c:207:1: sparse: symbol 'compat_SyS_ftruncate' was not declared. Should it be static?
fs/open.c:288:1: sparse: symbol 'SyS_fallocate' was not declared. Should it be static?
fs/open.c:305:1: sparse: symbol 'SyS_faccessat' was not declared. Should it be static?
fs/open.c:381:1: sparse: symbol 'SyS_access' was not declared. Should it be static?
fs/open.c:386:1: sparse: symbol 'SyS_chdir' was not declared. Should it be static?
fs/open.c:412:1: sparse: symbol 'SyS_fchdir' was not declared. Should it be static?
fs/open.c:437:1: sparse: symbol 'SyS_chroot' was not declared. Should it be static?
fs/open.c:492:1: sparse: symbol 'SyS_fchmod' was not declared. Should it be static?
fs/open.c:506:1: sparse: symbol 'SyS_fchmodat' was not declared. Should it be static?
fs/open.c:524:1: sparse: symbol 'SyS_chmod' was not declared. Should it be static?
fs/open.c:565:1: sparse: symbol 'SyS_fchownat' was not declared. Should it be static?
fs/open.c:597:1: sparse: symbol 'SyS_chown' was not declared. Should it be static?
fs/open.c:602:1: sparse: symbol 'SyS_lchown' was not declared. Should it be static?
fs/open.c:608:1: sparse: symbol 'SyS_fchown' was not declared. Should it be static?
fs/open.c:963:1: sparse: symbol 'SyS_open' was not declared. Should it be static?
fs/open.c:976:1: sparse: symbol 'SyS_openat' was not declared. Should it be static?
fs/open.c:996:1: sparse: symbol 'SyS_creat' was not declared. Should it be static?
fs/open.c:1034:1: sparse: symbol 'SyS_close' was not declared. Should it be static?
fs/pipe.c:1117:1: sparse: symbol 'SyS_pipe2' was not declared. Should it be static?
fs/pipe.c:1139:1: sparse: symbol 'SyS_pipe' was not declared. Should it be static?
fs/quota/quota.c:366:1: sparse: symbol 'SyS_quotactl' was not declared. Should it be static?
fs/read_write.c:233:1: sparse: symbol 'SyS_lseek' was not declared. Should it be static?
fs/read_write.c:252:1: sparse: symbol 'compat_SyS_lseek' was not declared. Should it be static?
fs/read_write.c:259:1: sparse: symbol 'SyS_llseek' was not declared. Should it be static?
fs/read_write.c:460:1: sparse: symbol 'SyS_read' was not declared. Should it be static?
fs/read_write.c:474:1: sparse: symbol 'SyS_write' was not declared. Should it be static?
fs/read_write.c:490:1: sparse: symbol 'SyS_pread64' was not declared. Should it be static?
fs/read_write.c:510:1: sparse: symbol 'SyS_pwrite64' was not declared. Should it be static?
fs/read_write.c:764:1: sparse: symbol 'SyS_readv' was not declared. Should it be static?
fs/read_write.c:783:1: sparse: symbol 'SyS_writev' was not declared. Should it be static?
fs/read_write.c:808:1: sparse: symbol 'SyS_preadv' was not declared. Should it be static?
fs/read_write.c:832:1: sparse: symbol 'SyS_pwritev' was not declared. Should it be static?
fs/read_write.c:946:1: sparse: symbol 'SyS_sendfile' was not declared. Should it be static?
fs/read_write.c:965:1: sparse: symbol 'SyS_sendfile64' was not declared. Should it be static?
fs/read_write.c:983:1: sparse: symbol 'compat_SyS_sendfile' was not declared. Should it be static?
fs/read_write.c:1003:1: sparse: symbol 'compat_SyS_sendfile64' was not declared. Should it be static?
fs/readdir.c:105:1: sparse: symbol 'SyS_old_readdir' was not declared. Should it be static?
fs/readdir.c:189:1: sparse: symbol 'SyS_getdents' was not declared. Should it be static?
fs/readdir.c:269:1: sparse: symbol 'SyS_getdents64' was not declared. Should it be static?
fs/select.c:592:1: sparse: symbol 'SyS_select' was not declared. Should it be static?
fs/select.c:670:1: sparse: symbol 'SyS_pselect6' was not declared. Should it be static?
fs/select.c:904:1: sparse: symbol 'SyS_poll' was not declared. Should it be static?
fs/select.c:938:1: sparse: symbol 'SyS_ppoll' was not declared. Should it be static?
fs/signalfd.c:256:1: sparse: symbol 'SyS_signalfd4' was not declared. Should it be static?
fs/signalfd.c:310:1: sparse: symbol 'SyS_signalfd' was not declared. Should it be static?
fs/signalfd.c:317:1: sparse: symbol 'compat_SyS_signalfd4' was not declared. Should it be static?
fs/signalfd.c:338:1: sparse: symbol 'compat_SyS_signalfd' was not declared. Should it be static?
fs/splice.c:1665:1: sparse: symbol 'SyS_vmsplice' was not declared. Should it be static?
fs/splice.c:1690:1: sparse: symbol 'SyS_splice' was not declared. Should it be static?
fs/splice.c:2023:1: sparse: symbol 'SyS_tee' was not declared. Should it be static?
fs/stat.c:159:1: sparse: symbol 'SyS_stat' was not declared. Should it be static?
fs/stat.c:172:1: sparse: symbol 'SyS_lstat' was not declared. Should it be static?
fs/stat.c:185:1: sparse: symbol 'SyS_fstat' was not declared. Should it be static?
fs/stat.c:248:1: sparse: symbol 'SyS_newstat' was not declared. Should it be static?
fs/stat.c:259:1: sparse: symbol 'SyS_newlstat' was not declared. Should it be static?
fs/stat.c:273:1: sparse: symbol 'SyS_newfstatat' was not declared. Should it be static?
fs/stat.c:286:1: sparse: symbol 'SyS_newfstat' was not declared. Should it be static?
fs/stat.c:297:1: sparse: symbol 'SyS_readlinkat' was not declared. Should it be static?
fs/stat.c:331:1: sparse: symbol 'SyS_readlink' was not declared. Should it be static?
fs/statfs.c:172:1: sparse: symbol 'SyS_statfs' was not declared. Should it be static?
fs/statfs.c:181:1: sparse: symbol 'SyS_statfs64' was not declared. Should it be static?
fs/statfs.c:193:1: sparse: symbol 'SyS_fstatfs' was not declared. Should it be static?
fs/statfs.c:202:1: sparse: symbol 'SyS_fstatfs64' was not declared. Should it be static?
fs/statfs.c:228:1: sparse: symbol 'SyS_ustat' was not declared. Should it be static?
fs/sync.c:149:1: sparse: symbol 'SyS_syncfs' was not declared. Should it be static?
fs/sync.c:212:1: sparse: symbol 'SyS_fsync' was not declared. Should it be static?
fs/sync.c:217:1: sparse: symbol 'SyS_fdatasync' was not declared. Should it be static?
fs/sync.c:286:1: sparse: symbol 'SyS_sync_file_range' was not declared. Should it be static?
fs/sync.c:371:1: sparse: symbol 'SyS_sync_file_range2' was not declared. Should it be static?
fs/timerfd.c:251:1: sparse: symbol 'SyS_timerfd_create' was not declared. Should it be static?
fs/timerfd.c:359:1: sparse: symbol 'SyS_timerfd_settime' was not declared. Should it be static?
fs/timerfd.c:377:1: sparse: symbol 'SyS_timerfd_gettime' was not declared. Should it be static?
fs/utimes.c:27:1: sparse: symbol 'SyS_utime' was not declared. Should it be static?
fs/utimes.c:178:1: sparse: symbol 'SyS_utimensat' was not declared. Should it be static?
fs/utimes.c:196:1: sparse: symbol 'SyS_futimesat' was not declared. Should it be static?
fs/utimes.c:224:1: sparse: symbol 'SyS_utimes' was not declared. Should it be static?
fs/xattr.c:367:1: sparse: symbol 'SyS_setxattr' was not declared. Should it be static?
fs/xattr.c:391:1: sparse: symbol 'SyS_lsetxattr' was not declared. Should it be static?
fs/xattr.c:415:1: sparse: symbol 'SyS_fsetxattr' was not declared. Should it be static?
fs/xattr.c:484:1: sparse: symbol 'SyS_getxattr' was not declared. Should it be static?
fs/xattr.c:503:1: sparse: symbol 'SyS_lgetxattr' was not declared. Should it be static?
fs/xattr.c:522:1: sparse: symbol 'SyS_fgetxattr' was not declared. Should it be static?
fs/xattr.c:574:1: sparse: symbol 'SyS_listxattr' was not declared. Should it be static?
fs/xattr.c:593:1: sparse: symbol 'SyS_llistxattr' was not declared. Should it be static?
fs/xattr.c:612:1: sparse: symbol 'SyS_flistxattr' was not declared. Should it be static?
fs/xattr.c:643:1: sparse: symbol 'SyS_removexattr' was not declared. Should it be static?
fs/xattr.c:666:1: sparse: symbol 'SyS_lremovexattr' was not declared. Should it be static?
fs/xattr.c:689:1: sparse: symbol 'SyS_fremovexattr' was not declared. Should it be static?
ipc/msg.c:312:1: sparse: symbol 'SyS_msgget' was not declared. Should it be static?
ipc/msg.c:472:1: sparse: symbol 'SyS_msgctl' was not declared. Should it be static?
ipc/msg.c:729:1: sparse: symbol 'SyS_msgsnd' was not declared. Should it be static?
ipc/msg.c:988:1: sparse: symbol 'SyS_msgrcv' was not declared. Should it be static?
ipc/msg.c:577:9: sparse: context imbalance in 'SyS_msgctl' - unexpected unlock
ipc/sem.c:367:1: sparse: symbol 'SyS_semget' was not declared. Should it be static?
ipc/sem.c:1159:17: sparse: symbol 'SyS_semctl' was not declared. Should it be static?
ipc/sem.c:1330:1: sparse: symbol 'SyS_semtimedop' was not declared. Should it be static?
ipc/sem.c:1548:1: sparse: symbol 'SyS_semop' was not declared. Should it be static?
include/linux/rcupdate.h:326:30: sparse: context imbalance in 'SyS_semtimedop' - unexpected unlock
ipc/shm.c:575:1: sparse: symbol 'SyS_shmget' was not declared. Should it be static?
ipc/shm.c:777:1: sparse: symbol 'SyS_shmctl' was not declared. Should it be static?
ipc/shm.c:1111:1: sparse: symbol 'SyS_shmat' was not declared. Should it be static?
ipc/shm.c:1127:1: sparse: symbol 'SyS_shmdt' was not declared. Should it be static?
ipc/shm.c:947:9: sparse: context imbalance in 'SyS_shmctl' - unexpected unlock
ipc/mqueue.c:770:1: sparse: symbol 'SyS_mq_open' was not declared. Should it be static?
ipc/mqueue.c:849:1: sparse: symbol 'SyS_mq_unlink' was not declared. Should it be static?
ipc/mqueue.c:943:1: sparse: symbol 'SyS_mq_timedsend' was not declared. Should it be static?
ipc/mqueue.c:1063:1: sparse: symbol 'SyS_mq_timedreceive' was not declared. Should it be static?
ipc/mqueue.c:1171:1: sparse: symbol 'SyS_mq_notify' was not declared. Should it be static?
ipc/mqueue.c:1303:1: sparse: symbol 'SyS_mq_getsetattr' was not declared. Should it be static?
ipc/mqueue.c:1055:9: sparse: context imbalance in 'SyS_mq_timedsend' - different lock contexts for basic block
ipc/mqueue.c:1161:14: sparse: context imbalance in 'SyS_mq_timedreceive' - different lock contexts for basic block
kernel/acct.c:255:1: sparse: symbol 'SyS_acct' was not declared. Should it be static?
kernel/capability.c:158:1: sparse: symbol 'SyS_capget' was not declared. Should it be static?
kernel/capability.c:232:1: sparse: symbol 'SyS_capset' was not declared. Should it be static?
kernel/compat.c:293:1: sparse: symbol 'compat_SyS_getitimer' was not declared. Should it be static?
kernel/compat.c:305:1: sparse: symbol 'compat_SyS_setitimer' was not declared. Should it be static?
kernel/compat.c:384:1: sparse: symbol 'compat_SyS_sigprocmask' was not declared. Should it be static?
kernel/compat.c:538:1: sparse: symbol 'compat_SyS_wait4' was not declared. Should it be static?
kernel/compat.c:569:1: sparse: symbol 'compat_SyS_waitid' was not declared. Should it be static?
kernel/compat.c:996:1: sparse: symbol 'compat_SyS_rt_sigtimedwait' was not declared. Should it be static?
kernel/compat.c:1206:1: sparse: symbol 'compat_SyS_sched_rr_get_interval' was not declared. Should it be static?
kernel/exec_domain.c:182:1: sparse: symbol 'SyS_personality' was not declared. Should it be static?
kernel/fork.c:1087:1: sparse: symbol 'SyS_set_tid_address' was not declared. Should it be static?
kernel/fork.c:1671:1: sparse: symbol 'SyS_clone' was not declared. Should it be static?
kernel/fork.c:1797:1: sparse: symbol 'SyS_unshare' was not declared. Should it be static?
kernel/futex.c:2442:1: sparse: symbol 'SyS_set_robust_list' was not declared. Should it be static?
kernel/futex.c:2464:1: sparse: symbol 'SyS_get_robust_list' was not declared. Should it be static?
kernel/futex.c:2698:1: sparse: symbol 'SyS_futex' was not declared. Should it be static?
kernel/futex_compat.c:120:1: sparse: symbol 'compat_SyS_set_robust_list' was not declared. Should it be static?
kernel/futex_compat.c:135:1: sparse: symbol 'compat_SyS_get_robust_list' was not declared. Should it be static?
kernel/futex_compat.c:174:1: sparse: symbol 'compat_SyS_futex' was not declared. Should it be static?
kernel/groups.c:202:1: sparse: symbol 'SyS_getgroups' was not declared. Should it be static?
kernel/groups.c:231:1: sparse: symbol 'SyS_setgroups' was not declared. Should it be static?
kernel/hrtimer.c:1623:1: sparse: symbol 'SyS_nanosleep' was not declared. Should it be static?
kernel/itimer.c:103:1: sparse: symbol 'SyS_getitimer' was not declared. Should it be static?
kernel/itimer.c:278:1: sparse: symbol 'SyS_setitimer' was not declared. Should it be static?
ipc/compat.c:372:1: sparse: symbol 'compat_SyS_ipc' was not declared. Should it be static?
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:398:24: sparse: incorrect type in argument 1 (different address spaces)
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:412:1: sparse: symbol 'compat_SyS_semctl' was not declared. Should it be static?
ipc/compat.c:417:1: sparse: symbol 'compat_SyS_msgsnd' was not declared. Should it be static?
ipc/compat.c:428:1: sparse: symbol 'compat_SyS_msgrcv' was not declared. Should it be static?
ipc/compat.c:551:1: sparse: symbol 'compat_SyS_shmat' was not declared. Should it be static?
fs/dcookies.c:207:1: sparse: symbol 'compat_SyS_lookup_dcookie' was not declared. Should it be static?
kernel/debug/kdb/kdb_debugger.c:45:29: sparse: non-ANSI function declaration of function 'kdb_common_deinit_state'
fs/btrfs/raid56.c:827:28: sparse: bad constant expression
arch/x86/xen/mmu.c:2233:17: sparse: no member 'mapping' in struct x86_init_ops
kernel/workqueue.c:3627:79: sparse: Expected ; at end of statement
kernel/workqueue.c:3627:79: sparse: got {
kernel/workqueue.c:3632:9: sparse: Expected ; at the end of type declaration
kernel/workqueue.c:3637:13: sparse: Expected ) in function declarator
kernel/workqueue.c:3643:34: sparse: got (
kernel/workqueue.c:3658:11: sparse: Expected ; at end of declaration
kernel/workqueue.c:3658:11: sparse: got :
kernel/workqueue.c:3661:16: sparse: got pool
kernel/workqueue.c:3665:17: sparse: got put_unbound_pool
kernel/workqueue.c:3672:25: sparse: Expected ) in nested declarator
kernel/workqueue.c:3672:25: sparse: got pool_workqueue
fs/read_write.c:252:1: sparse: symbol 'compat_sys_lseek' was not declared. Should it be static?
drivers/gpio/gpio-stmpe.c:313:30: sparse: no member 'of_node' in struct gpio_chip

[smatch]
drivers/md/dm-cache-target.c:1963 copy_ctr_args() error: potential null dereference 'copy'.  (kzalloc returns null)
kernel/printk.c:768 early_vprintk() warn: 'buf' puts 512 bytes on stack
kernel/printk.c:1653 vprintk_emit() warn: inconsistent returns spin_lock:&logbuf_lock: locked (1653) unlocked (1545)
kernel/printk.c:2168 console_unlock() error: double lock 'irqsave:flags'
kernel/printk.c:2182 console_unlock() error: double unlock 'irqsave:flags'
sound/soc/soc-dapm.c:824 is_connected_output_ep() error: potentially dereferencing uninitialized 'path'.
fs/btrfs/ioctl.c:624 create_snapshot() error: potential NULL dereference 'pending_snapshot'.

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
