From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 01 Oct 2013 16:47:18 +0000
Subject: build regressions 2013-10-01
Message-Id: <524afc96.f1D2QrwyJHjbY+IO%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/acpi/thermal.c:989:15: error: 'thermal_act' undeclared here (not in a function)
drivers/acpi/thermal.c:997:15: error: 'thermal_psv' undeclared here (not in a function)
drivers/acpi/thermal.c:1005:15: error: 'thermal_tzp' undeclared here (not in a function)
drivers/acpi/thermal.c:1013:15: error: 'thermal_nocrt' undeclared here (not in a function)
arch/x86/include/asm/rwsem.h:247:2: error: implicit declaration of function 'elide_unlock_check' [-Werror=implicit-function-declaration]
fs/xfs/xfs_log_recover.c:1588:4: error: implicit declaration of function 'free' [-Werror=implicit-function-declaration]
mm/filemap.c:667:3: error: implicit declaration of function 'up_read_state' [-Werror=implicit-function-declaration]
kernel/futex.c:404:2: error: implicit declaration of function 'down_read_state' [-Werror=implicit-function-declaration]
kernel/futex.c:407:2: error: implicit declaration of function 'up_read_state' [-Werror=implicit-function-declaration]
drivers/i2c/Kconfig:5:error: recursive dependency detected!
drivers/i2c/Kconfig:5:error: recursive dependency detected!
include/linux/list_bl.h:65:2: error: implicit declaration of function '_xtest' [-Werror=implicit-function-declaration]
arch/x86/mm/fault.c:789:2: error: implicit declaration of function 'elide_abort' [-Werror=implicit-function-declaration]

[warnings]
drivers/staging/comedi/drivers/ni_labpc_isadma.c:54:2: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:114) [-Wdeprecated-declarations]
drivers/net/wireless/ath/ath10k/core.c:406:7: warning: format '%d' expects argument of type 'int', but argument 2 has type 'size_t' [-Wformat=]
drivers/net/wireless/ath/ath10k/core.c:433:8: warning: format '%d' expects argument of type 'int', but argument 3 has type 'size_t' [-Wformat=]
drivers/net/wireless/ath/ath10k/core.c:433:8: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat=]
fs/xfs/xfs_log_recover.c:1588:4: warning: incompatible implicit declaration of built-in function 'free' [enabled by default]
include/linux/dynamic_debug.h:64:16: warning: format '%X' expects argument of type 'unsigned int', but argument 8 has type 'ssize_t' [-Wformat=]
drivers/usb/wusbcore/wa-xfer.c:304:4: warning: format '%X' expects argument of type 'unsigned int', but argument 8 has type 'ssize_t' [-Wformat=]
kernel/futex.c:402:6: warning: unused variable 'state' [-Wunused-variable]
include/linux/compiler.h:137:17: warning: format '%X' expects argument of type 'unsigned int', but argument 8 has type 'ssize_t' [-Wformat=]

[sparse]
arch/x86/boot/compressed/../../../../drivers/firmware/efi/efi-stub-helper.c:550:15: sparse: memset with byte count of 0
fs/xfs/xfs_log_recover.c:1588:25: sparse: undefined identifier 'free'
arch/x86/kernel/smpboot.c:650:6: sparse: symbol 'smp_announce' was not declared. Should it be static?
kernel/smp.c:527:13: sparse: symbol 'smp_announce' was not declared. Should it be static?

[coccinelle]
drivers/net/wireless/ath/ath10k/core.c:507:2-3: Unneeded semicolon
ipc/sem.c:330:4-10: preceding lock on line 317

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
