From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 20 Dec 2012 16:19:11 +0000
Subject: build regressions 2012-12-20
Message-Id: <50d33a7f.ItLgNw7ru/cSaZp8%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/net/wireless/ath/ath9k/debug.c:1589:4: error: 'struct ath_node' has no member named 'node_stat'
drivers/scsi/csiostor/t4fw_api_stor.h:48:2: error: redeclaration of enumerator 'FW_ENOEXEC'
drivers/scsi/csiostor/t4fw_api_stor.h:43:6: error: nested redefinition of 'enum fw_retval'
drivers/scsi/csiostor/t4fw_api_stor.h:43:6: error: redeclaration of 'enum fw_retval'
drivers/scsi/csiostor/t4fw_api_stor.h:50:2: error: redeclaration of enumerator 'FW_ENOMEM'
drivers/scsi/csiostor/t4fw_api_stor.h:58:2: error: redeclaration of enumerator 'FW_EADDRINUSE'

[warnings]
include/linux/acpi.h:518: warning: 'acpi_dev_pm_get_node' defined but not used
drivers/infiniband/hw/cxgb4/cm.c:2694:12: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/infiniband/hw/cxgb4/cm.c:2829:57: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
make[1]: Warning: File `arch/mips/wrppmc/Platform' has modification time 3.6e+08 s in the future
warning: (PMODOLED) selects SPI_GPIO which has unmet direct dependencies (SPI && SPI_MASTER && GENERIC_GPIO)
/dev/shm/bash-redirect-mips-fuloong2e_defconfig: line 1: /dev/shm/build-error-mips-fuloong2e_defconfig/10257-10576-136: No space left on devicemake[3]: Warning: File `scripts/Makefile.host' has modification time 3.6e+08 s in the future

[sparse]
drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:3335:27: sparse: cast from restricted __be16
drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:3335:27: sparse: incorrect type in argument 1 (different base types)
drivers/infiniband/hw/cxgb4/cm.c:1463:25: sparse: incorrect type in assignment (different base types)
drivers/infiniband/hw/cxgb4/cm.c:1484:31: sparse: invalid assignment: |drivers/infiniband/hw/cxgb4/cm.c:1489:25: sparse: cast from restricted __be64
drivers/infiniband/hw/cxgb4/cm.c:1489:25: sparse: incorrect type in argument 1 (different base types)
drivers/infiniband/hw/cxgb4/cm.c:1490:25: sparse: cast from restricted __be32
drivers/infiniband/hw/cxgb4/cm.c:2701:35: sparse: restricted __be32 degrades to integer
drivers/infiniband/hw/cxgb4/cm.c:2762:42: sparse: Using plain integer as NULL pointer
drivers/infiniband/hw/cxgb4/cm.c:2769:24: sparse: restricted __be16 degrades to integer
drivers/infiniband/hw/cxgb4/cm.c:2773:19: sparse: too many warnings
drivers/infiniband/hw/cxgb4/device.c:671:17: sparse: cast to restricted __be64
drivers/atm/solos-pci.c:512:16: sparse: context imbalance in 'geos_gpio_store' - different lock contexts for basic block
drivers/staging/dgrp/dgrp_net_ops.c:229:15: sparse: incompatible types for operation (-)
drivers/gpio/gpiolib.c:2302:14: sparse: symbol 'gpio_block_fop_poll' was not declared. Should it be static?
drivers/scsi/csiostor/t4fw_api_stor.h:43:16: sparse: redefinition of int enum fw_retval
drivers/acpi/device_pm.c:356:20: sparse: symbol 'acpi_dev_pm_get_node' was not declared. Should it be static?

[smatch]
drivers/atm/solos-pci.c:534 geos_gpio_store() error: double lock 'spin_lock:&card->param_queue_lock'
drivers/atm/solos-pci.c:534 geos_gpio_store() error: double lock 'irq:'
drivers/atm/solos-pci.c:535 geos_gpio_store() warn: inconsistent returns spin_lock:&card->param_queue_lock: locked (535) unlocked (521)
drivers/atm/solos-pci.c:535 geos_gpio_store() warn: inconsistent returns irq:: locked (535) unlocked (521)

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
