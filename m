From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 13 May 2013 17:02:46 +0000
Subject: build regressions 2013-05-13
Message-Id: <51911cb6.ag9dk/whXihWHMEm%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/mach-versatile/core.c:48:32: fatal error: asm/hardware/pl080.h: No such file or directory
arch/arm/kernel/traps.c:565:35: error: invalid application of 'sizeof' to incomplete type 'struct iovec'
arch/arm/kernel/traps.c:579:3: error: invalid use of undefined type 'struct iovec'
arch/arm/kernel/traps.c:579:51: error: dereferencing pointer to incomplete type
arch/arm/kernel/traps.c:580:3: error: invalid use of undefined type 'struct iovec'
arch/arm/kernel/traps.c:580:34: error: dereferencing pointer to incomplete type
arch/arm/kernel/traps.c:589:2: error: implicit declaration of function 'iov_length' [-Werror=implicit-function-declaration]
cpu_pm.c:(.text+0x40b4): undefined reference to `printascii'
drivers/mtd/nand/nand_base.c:216:2: error: implicit declaration of function 'iowrite8_rep' [-Werror=implicit-function-declaration]
drivers/mtd/nand/nand_base.c:231:2: error: implicit declaration of function 'ioread8_rep' [-Werror=implicit-function-declaration]
drivers/mtd/nand/nand_base.c:247:2: error: implicit declaration of function 'iowrite16_rep' [-Werror=implicit-function-declaration]
drivers/mtd/nand/nand_base.c:263:2: error: implicit declaration of function 'ioread16_rep' [-Werror=implicit-function-declaration]
lib/locking-selftest.c:1137:75: error: 'MAX_UINT' undeclared (first use in this function)
lib/locking-selftest.c:1171:75: error: 'MAX_UINT' undeclared (first use in this function)
lib/locking-selftest.c:1229:75: error: 'MAX_UINT' undeclared (first use in this function)
lib/locking-selftest.c:1235:75: error: 'MAX_UINT' undeclared (first use in this function)
lib/locking-selftest.c:1264:75: error: 'MAX_UINT' undeclared (first use in this function)
lib/locking-selftest.c:1282:75: error: 'MAX_UINT' undeclared (first use in this function)
lib/locking-selftest.c:1295:75: error: 'MAX_UINT' undeclared (first use in this function)
lib/locking-selftest.c:1306:75: error: 'MAX_UINT' undeclared (first use in this function)
lib/locking-selftest.c:1321:75: error: 'MAX_UINT' undeclared (first use in this function)
lib/locking-selftest.c:1364:75: error: 'MAX_UINT' undeclared (first use in this function)
lib/locking-selftest.c:1390:75: error: 'MAX_UINT' undeclared (first use in this function)
lib/locking-selftest.c:1439:75: error: 'MAX_UINT' undeclared (first use in this function)
drivers/scsi/ufs/ufshcd-pltfrm.c:121:2: error: implicit declaration of function 'ioremap_nocache' [-Werror=implicit-function-declaration]
drivers/scsi/ufs/ufshcd-pltfrm.c:152:2: error: implicit declaration of function 'iounmap' [-Werror=implicit-function-declaration]

[warnings]
arch/arm/plat-versatile/fpga-id.c:173:1: warning: initialization from incompatible pointer type [enabled by default]
drivers/scsi/ufs/ufshcd-pltfrm.c:121:12: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/irqchip/percpu-mux.c:71:24: warning: 'percpu_mux' defined but not used [-Wunused-variable]

[sparse]
drivers/irqchip/percpu-mux.c:109:17: sparse: symbol 'alloc_percpu_irq_mux' was not declared. Should it be static?
lib/locking-selftest.c:1137:9: sparse: undefined identifier 'MAX_UINT'

[coccinelle]
drivers/usb/host/isp116x-hcd.c:175:3-49: code aligned with following code on line 177
drivers/usb/host/isp116x-hcd.c:128:3-48: code aligned with following code on line 130
drivers/usb/host/isp116x-hcd.c:175:3-49: code aligned with following code on line 177
drivers/usb/host/isp116x-hcd.c:128:3-48: code aligned with following code on line 130

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
