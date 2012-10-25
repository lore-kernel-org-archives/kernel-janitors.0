From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 25 Oct 2012 17:24:15 +0000
Subject: build regressions 2012-10-25
Message-Id: <20121025172415.GA30706@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
ERROR: "of_regulator_match" [drivers/mfd/tps65217.ko] undefined!
ERROR: ".vtime_account_system_irqsafe" undefined!
ERROR: "bprm_change_interp" undefined!
arch/x86/kvm/pmu.c:242:29: error: 'vcpu' undeclared (first use in this function)
init/main.c:163:6: error: '__setup_very_end' undeclared (first use in this function)
init/main.c:163:6: error: '__setup_very_very_end' undeclared (first use in this function)

[warnings]
drivers/char/random.c:1141:3: warning: format '%d' expects argument of type 'int', but argument 5 has type 'long int' [-Wformat]
drivers/char/sonypi.c:779:9: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/bus/omap-ocp2scp.c:57:6: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/regulator/anatop-regulator.c:76:13: warning: 'val' may be used uninitialized in this function [-Wuninitialized]
drivers/char/random.c:827:3: warning: format '%zu' expects argument of type 'size_t', but argument 7 has type 'unsigned int' [-Wformat]
mm/rmap.c:1361:9: warning: unused variable 'pud' [-Wunused-variable]
mm/rmap.c:1360:9: warning: unused variable 'pgd' [-Wunused-variable]
drivers/hid/hid-logitech-dj.c:323:10: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/iio/industrialio-event.c:58:12: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/iio/kfifo_buf.c:102:8: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/infiniband/hw/cxgb3/cxio_resource.c:62:3: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/media/i2c/cx25840/cx25840-ir.c:613:8: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/media/pci/cx23885/cx23888-ir.c:615:8: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/media/pci/meye/meye.c:805:7: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/media/rc/ir-raw.c:62:12: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/memstick/host/r592.c:335:18: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/mmc/card/sdio_uart.c:475:8: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/net/wireless/libertas/main.c:549:8: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/net/wireless/rt2x00/rt2800pci.c:904:8: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/net/wireless/rt2x00/rt2800usb.c:164:8: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/pci/pcie/aer/aerdrv_core.c:583:6: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/platform/x86/fujitsu-laptop.c:1008:14: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/platform/x86/sony-laptop.c:356:6: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/rapidio/devices/tsi721.c:266:4: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/scsi/libiscsi.c:507:2: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/scsi/libiscsi_tcp.c:462:3: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/scsi/libsrp.c:66:3: warning: comparison of distinct pointer types lacks a cast [enabled by default]
include/media/lirc_dev.h:108:9: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/tty/n_gsm.c:836:3: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/tty/nozomi.c:797:9: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/tty/serial/ifx6x60.c:432:17: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/tty/serial/kgdb_nmi.c:122:2: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/usb/serial/aircable.c:91:10: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/usb/serial/cypress_m8.c:681:10: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/usb/serial/ftdi_sio.c:1939:8: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/usb/serial/generic.c:223:10: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/usb/serial/io_ti.c:2023:10: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/usb/serial/ir-usb.c:281:10: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/usb/serial/kl5kusb105.c:383:10: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/usb/serial/oti6858.c:369:10: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/usb/serial/safe_serial.c:255:10: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/usb/serial/ti_usb_3410_5052.c:659:10: warning: comparison of distinct pointer types lacks a cast [enabled by default]
mm/memory-failure.c:1238:6: warning: comparison of distinct pointer types lacks a cast [enabled by default]
net/dccp/probe.c:71:2: warning: comparison of distinct pointer types lacks a cast [enabled by default]
net/sctp/probe.c:76:2: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/char/random.c:827:3: warning: format '%d' expects argument of type 'int', but argument 7 has type 'size_t' [-Wformat]
drivers/char/random.c:1141:3: warning: format '%d' expects argument of type 'int', but argument 5 has type 'ssize_t' [-Wformat]
drivers/char/random.c:1145:3: warning: format '%d' expects argument of type 'int', but argument 6 has type 'long unsigned int' [-Wformat]
drivers/staging/rtl8192e/rtl8192e/../rtllib.h:2690:3: warning: '______f' is static but declared in inline function 'rtllib_get_hdrlen' which is not static [enabled by default]
drivers/staging/rtl8192e/rtl8192e/../rtllib.h:2674:2: warning: '______f' is static but declared in inline function 'rtllib_is_valid_mode' which is not static [enabled by default]
drivers/staging/rtl8192e/rtl8192e/../rtllib.h:2649:3: warning: '______f' is static but declared in inline function 'rtllib_is_empty_essid' which is not static [enabled by default]
fs/isofs/namei.c:39:11: warning: 'dlen' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/wireless/nl80211.c:89:4: warning: 'wdev_id' may be used uninitialized in this function [-Wmaybe-uninitialized]
warning: (KVMTOOL_TEST_ENABLE) selects VIRTIO_NET which has unmet direct dependencies (NETDEVICES && NET_CORE && VIRTIO)

[sparse]
drivers/staging/dgrp/dgrp_net_ops.c:216:34: sparse: no member 'real_raw' in struct tty_struct
drivers/staging/dgrp/dgrp_net_ops.c:229:15: sparse: no member 'read_cnt' in struct tty_struct
drivers/staging/dgrp/dgrp_net_ops.c:229:15: sparse: incompatible types for operation (-)
drivers/staging/dgrp/dgrp_net_ops.c:229:15: sparse: incompatible types in comparison expression (different base types)
drivers/staging/dgrp/dgrp_net_ops.c:229:15: sparse: incompatible types in conditional expression (different base types)
net/bluetooth/l2cap_core.c:4495:6: sparse: symbol 'l2cap_physical_cfm' was not declared. Should it be static?
arch/x86/kernel/cpu/perf_event.c:1356:18: sparse: symbol 'events_attr' was not declared. Should it be static?
drivers/char/sonypi.c:779:16: sparse: incompatible types in comparison expression (different base types)
drivers/hid/hid-logitech-dj.c:323:17: sparse: incompatible types in comparison expression (different base types)
drivers/iio/industrialio-event.c:58:26: sparse: incompatible types in comparison expression (different modifiers)
drivers/iio/kfifo_buf.c:102:15: sparse: incompatible types in comparison expression (different base types)
drivers/infiniband/hw/cxgb3/cxio_resource.c:62:17: sparse: incompatible types in comparison expression (different base types)
drivers/media/i2c/cx25840/cx25840-ir.c:613:29: sparse: incompatible types in comparison expression (different base types)
drivers/media/pci/cx23885/cx23888-ir.c:615:29: sparse: incompatible types in comparison expression (different base types)
drivers/media/pci/meye/meye.c:805:21: sparse: incompatible types in comparison expression (different base types)
drivers/media/rc/ir-raw.c:62:26: sparse: incompatible types in comparison expression (different base types)
drivers/memstick/host/r592.c:335:32: sparse: incompatible types in comparison expression (different modifiers)
drivers/mmc/card/sdio_uart.c:475:15: sparse: incompatible types in comparison expression (different base types)
drivers/mtd/sm_ftl.c:497:17: sparse: incompatible types in comparison expression (different base types)
drivers/net/wireless/libertas/main.c:549:29: sparse: incompatible types in comparison expression (different base types)
drivers/net/wireless/rt2x00/rt2800pci.c:904:22: sparse: incompatible types in comparison expression (different modifiers)
drivers/net/wireless/rt2x00/rt2800usb.c:164:22: sparse: incompatible types in comparison expression (different modifiers)
drivers/pci/pcie/aer/aerdrv_core.c:583:13: sparse: incompatible types in comparison expression (different modifiers)
drivers/platform/x86/fujitsu-laptop.c:1008:42: sparse: incompatible types in comparison expression (different base types)
drivers/platform/x86/sony-laptop.c:356:13: sparse: incompatible types in comparison expression (different base types)
drivers/rapidio/devices/tsi721.c:266:25: sparse: incompatible types in comparison expression (different base types)
drivers/scsi/libiscsi.c:507:9: sparse: incompatible types in comparison expression (different modifiers)
drivers/scsi/libiscsi_tcp.c:462:17: sparse: incompatible types in comparison expression (different modifiers)
drivers/scsi/libsrp.c:66:17: sparse: incompatible types in comparison expression (different modifiers)
include/media/lirc_dev.h:119:15: sparse: incompatible types in comparison expression (different base types)
drivers/tty/n_gsm.c:836:17: sparse: incompatible types in comparison expression (different base types)
drivers/tty/nozomi.c:797:16: sparse: incompatible types in comparison expression (different base types)
drivers/tty/serial/ifx6x60.c:432:38: sparse: incompatible types in comparison expression (different base types)
drivers/tty/serial/kgdb_nmi.c:122:9: sparse: incompatible types in comparison expression (different modifiers)
drivers/usb/serial/aircable.c:91:17: sparse: incompatible types in comparison expression (different base types)
drivers/usb/serial/cypress_m8.c:681:17: sparse: incompatible types in comparison expression (different base types)
drivers/usb/serial/ftdi_sio.c:1939:29: sparse: incompatible types in comparison expression (different base types)
drivers/usb/serial/generic.c:223:17: sparse: incompatible types in comparison expression (different base types)
drivers/usb/serial/io_ti.c:2023:17: sparse: incompatible types in comparison expression (different base types)
drivers/usb/serial/ir-usb.c:281:17: sparse: incompatible types in comparison expression (different base types)
drivers/usb/serial/kl5kusb105.c:383:17: sparse: incompatible types in comparison expression (different base types)
drivers/usb/serial/oti6858.c:369:17: sparse: incompatible types in comparison expression (different base types)
drivers/usb/serial/safe_serial.c:255:17: sparse: incompatible types in comparison expression (different base types)
drivers/usb/serial/ti_usb_3410_5052.c:659:17: sparse: incompatible types in comparison expression (different base types)
fs/proc/task_mmu.c:540:18: sparse: bad integer constant expression
kernel/rcutorture.c:585:1: sparse: symbol 'srcu_ctl_srcu_array' was not declared. Should it be static?
net/dccp/probe.c:71:9: sparse: incompatible types in comparison expression (different base types)
net/sctp/probe.c:76:9: sparse: incompatible types in comparison expression (different base types)
drivers/staging/rts5139/sd_cprm.c:272:5: sparse: symbol 'ext_rts51x_sd_execute_no_data' was not declared. Should it be static?
drivers/staging/rts5139/sd_cprm.c:340:5: sparse: symbol 'ext_rts51x_sd_execute_read_data' was not declared. Should it be static?
drivers/staging/rts5139/sd_cprm.c:545:5: sparse: symbol 'ext_rts51x_sd_execute_write_data' was not declared. Should it be static?
drivers/staging/rts5139/sd_cprm.c:781:5: sparse: symbol 'rts51x_sd_pass_thru_mode' was not declared. Should it be static?
drivers/staging/rts5139/sd_cprm.c:853:5: sparse: symbol 'rts51x_sd_execute_no_data' was not declared. Should it be static?
drivers/staging/rts5139/sd_cprm.c:885:5: sparse: symbol 'rts51x_sd_execute_read_data' was not declared. Should it be static?
drivers/staging/rts5139/sd_cprm.c:923:5: sparse: symbol 'rts51x_sd_execute_write_data' was not declared. Should it be static?
drivers/staging/rts5139/sd_cprm.c:961:5: sparse: symbol 'rts51x_sd_get_cmd_rsp' was not declared. Should it be static?
drivers/staging/rts5139/sd_cprm.c:1000:5: sparse: symbol 'rts51x_sd_hw_rst' was not declared. Should it be static?
drivers/staging/rts5139/ms_mg.c:122:5: sparse: symbol 'rts51x_mg_set_leaf_id' was not declared. Should it be static?
drivers/staging/rts5139/ms_mg.c:173:5: sparse: symbol 'rts51x_mg_get_local_EKB' was not declared. Should it be static?
drivers/staging/rts5139/ms_mg.c:232:5: sparse: symbol 'rts51x_mg_chg' was not declared. Should it be static?
drivers/staging/rts5139/ms_mg.c:323:5: sparse: symbol 'rts51x_mg_get_rsp_chg' was not declared. Should it be static?
drivers/staging/rts5139/ms_mg.c:392:5: sparse: symbol 'rts51x_mg_rsp' was not declared. Should it be static?
drivers/staging/rts5139/ms_mg.c:450:5: sparse: symbol 'rts51x_mg_get_ICV' was not declared. Should it be static?
drivers/staging/rts5139/ms_mg.c:514:5: sparse: symbol 'rts51x_mg_set_ICV' was not declared. Should it be static?
arch/x86/kernel/cpu/perf_event.c:1344:9: sparse: symbol 'events_sysfs_show' was not declared. Should it be static?
fs/xfs/xfs_icache.c:101:1: sparse: symbol 'xfs_inode_free' was not declared. Should it be static?
drivers/cpufreq/cpufreq_governor.c:41:13: sparse: symbol 'get_cpu_idle_time' was not declared. Should it be static?
kernel/ksysfs.c:144:5: sparse: symbol 'rcu_expedited' was not declared. Should it be static?

[cppcheck]
In file included from arch/x86/boot/compressed/eboot.c:
include/linux/rcupdate.h:250: error: "Unknown RCU implementation specified to kernel configuration"
include/linux/jiffies.h:39: error: Invalid value of HZ.
include/linux/rcupdate.h:250: error: #error "Unknown RCU implementation specified to kernel configuration"

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
