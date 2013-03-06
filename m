From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 06 Mar 2013 16:06:14 +0000
Subject: build regressions 2013-03-06
Message-Id: <51376976.rZlLglyzzO6GYQ+v%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/spi/spi-atmel.c:410: error: 'struct at_dma_slave' has no member named 'rx_reg'
drivers/spi/spi-atmel.c:411: error: 'struct at_dma_slave' has no member named 'tx_reg'
drivers/mtd/nand/nand_ids.c:25: error: unknown field 'dev_id' specified in initializer
drivers/mtd/nand/nand_ids.c:26: error: unknown field 'dev_id' specified in initializer
drivers/mtd/nand/nand_ids.c:27: error: unknown field 'dev_id' specified in initializer
drivers/mtd/nand/nand_ids.c:28: error: unknown field 'dev_id' specified in initializer
drivers/mtd/nand/nand_ids.c:29: error: unknown field 'dev_id' specified in initializer
drivers/mtd/nand/nand_ids.c:31: error: unknown field 'dev_id' specified in initializer
drivers/mtd/nand/nand_ids.c:32: error: unknown field 'dev_id' specified in initializer
drivers/mtd/nand/nand_ids.c:33: error: unknown field 'dev_id' specified in initializer
drivers/mtd/nand/nand_ids.c:34: error: unknown field 'dev_id' specified in initializer
drivers/mtd/nand/nand_ids.c:36: error: unknown field 'dev_id' specified in initializer
drivers/mtd/nand/nand_ids.c:37: error: unknown field 'dev_id' specified in initializer
drivers/mtd/nand/nand_ids.c:38: error: unknown field 'dev_id' specified in initializer
drivers/mtd/nand/nand_ids.c:39: error: unknown field 'dev_id' specified in initializer
drivers/mtd/nand/nand_ids.c:41: error: unknown field 'dev_id' specified in initializer
drivers/mtd/nand/nand_ids.c:42: error: unknown field 'dev_id' specified in initializer
drivers/mtd/nand/nand_ids.c:43: error: unknown field 'dev_id' specified in initializer
drivers/mtd/nand/nand_ids.c:44: error: unknown field 'dev_id' specified in initializer
drivers/mtd/nand/nand_ids.c:46: error: unknown field 'dev_id' specified in initializer
drivers/mtd/nand/nand_ids.c:47: error: unknown field 'dev_id' specified in initializer
drivers/mtd/nand/nand_ids.c:48: error: unknown field 'dev_id' specified in initializer
drivers/net/ethernet/davicom/wemac.c:122:2: error: implicit declaration of function 'writesl' [-Werror=implicit-function-declaration]
drivers/net/ethernet/davicom/wemac.c:127:2: error: implicit declaration of function 'readsl' [-Werror=implicit-function-declaration]
drivers/net/ethernet/davicom/wemac.c:1103:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'wemac_probe'
drivers/net/ethernet/davicom/wemac.c:1222:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'wemac_remove'
drivers/net/ethernet/davicom/wemac.c:1284:11: error: 'wemac_probe' undeclared here (not in a function)
drivers/net/ethernet/davicom/wemac.c:1285:12: error: 'wemac_remove' undeclared here (not in a function)
drivers/net/ethernet/davicom/wemac.c:900:2: error: implicit declaration of function 'of_get_property' [-Werror=implicit-function-declaration]
drivers/net/ethernet/davicom/wemac.c:903:6: error: dereferencing pointer to incomplete type
drivers/net/ethernet/davicom/wemac.c:931:6: error: 'struct net_device' has no member named 'poll_controller'
net/wireless/sysfs.c:94:13: error: redefinition of 'cfg80211_leave_all'
arch/s390/include/asm/cpu_mf.h:61:12: error: 'EINVAL' undeclared (first use in this function)
mm/huge_memory.c:1394:33: error: incompatible type for argument 1 of 'native_pmd_val'
drivers/staging/android/logger.c:315:4: error: incompatible type for argument 3 of 'get_next_entry_by_uid'
drivers/staging/android/logger.c:482:14: error: incompatible types when assigning to type 'uid_t' from type 'kuid_t'
drivers/staging/android/logger.c:630:4: error: incompatible type for argument 3 of 'get_next_entry_by_uid'
drivers/staging/android/logger.c:685:5: error: incompatible type for argument 3 of 'get_next_entry_by_uid'

[warnings]
kernel/workqueue.c:459: warning: 'std_worker_pool_pri' defined but not used
net/9p/trans_virtio.c:353: warning: 'p9_virtio_zc_request' defined but not used
WARNING: drivers/spi/built-in.o(.text+0x2a74): Section mismatch in reference from the function atmel_spi_probe() to the function .init.text:atmel_get_caps()
drivers/mtd/nand/nand_ids.c:25: warning: missing braces around initializer
drivers/mtd/nand/nand_ids.c:25: warning: (near initialization for 'nand_flash_ids[0].<anonymous>')
drivers/net/ethernet/davicom/wemac.c:900:4: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/mtd/chips/cfi_cmdset_0020.c:854:32: warning: 'r.x[0]' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/sched/sched.h:1036:39: warning: 'struct sched_domain' declared inside parameter list [enabled by default]
kernel/sched/sched.h:1036:39: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/acpi/acpi_drivers.h:103:31: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/acpi/acpi_drivers.h:107:43: warning: 'struct acpi_pci_root' declared inside parameter list [enabled by default]

[sparse]
kernel/workqueue.c:492:16: sparse: incompatible types in comparison expression (different address spaces)
drivers/usb/phy/omap-usb3.c:216:23: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/phy/omap-usb3.c:217:35: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/phy/omap-control-usb.c:223:31: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/phy/omap-control-usb.c:224:43: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/phy/omap-control-usb.c:231:39: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/phy/omap-control-usb.c:232:51: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/phy/omap-control-usb.c:240:39: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/phy/omap-control-usb.c:241:51: sparse: incorrect type in argument 1 (different address spaces)
ipc/sem.c:940:9: sparse: context imbalance in 'semctl_setval' - unexpected unlock
drivers/net/ethernet/intel/igb/igb_hwmon.c:42:23: sparse: symbol 'i350_sensor_info' was not declared. Should it be static?

[smatch]
kernel/workqueue.c:2378 rescuer_thread() error: double unlock 'irq:'
kernel/workqueue.c:2819 start_flush_work() warn: inconsistent returns irq:: locked (2785) unlocked (2816,2819)
kernel/workqueue.c:4084 workqueue_congested() error: buffer overflow '__per_cpu_offset' 32 <= 32
kernel/workqueue.c:4084 workqueue_congested() error: buffer overflow '__per_cpu_offset' 32 <= 32
kernel/workqueue.c:4084 workqueue_congested() error: buffer overflow '__per_cpu_offset' 32 <= 32
kernel/workqueue.c:4084 workqueue_congested() error: buffer overflow '__per_cpu_offset' 32 <= 32

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
