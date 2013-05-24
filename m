From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 24 May 2013 16:02:37 +0000
Subject: build regressions 2013-05-24
Message-Id: <519f8f1d.MTZL83g5cIF3aU5s%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/base/platform.c:488:2: error: implicit declaration of function 'of_device_init_irq' [-Werror=implicit-function-declaration]
anysee.c:(.text+0x6425c0): undefined reference to `isl6423_attach'
anysee.c:(.text+0x68d46a): undefined reference to `stv6110_attach'
anysee.c:(.text+0x68d82c): undefined reference to `cxd2820r_attach'
platform.c:(.text+0x3c110): undefined reference to `of_device_init_irq'
include/linux/of_platform.h:114:19: error: static declaration of 'of_device_init_irq' follows non-static declaration
toshiba_acpi.c:(.text+0x312e28): undefined reference to `i8042_remove_filter'
toshiba_acpi.c:(.devinit.text+0x2413f): undefined reference to `i8042_install_filter'
toshiba_acpi.c:(.devinit.text+0x241fa): undefined reference to `i8042_remove_filter'

[warnings]
kernel/mutex.c:582: warning: '__mutex_lock_reserve_slowpath' defined but not used
kernel/mutex.c:591: warning: '__mutex_lock_interruptible_reserve_slowpath' defined but not used
kernel/mutex.c:727:2: warning: 'ret' is used uninitialized in this function [-Wuninitialized]
kernel/mutex.c:745:2: warning: 'ret' is used uninitialized in this function [-Wuninitialized]
drivers/target/loopback/tcm_loop.c:82:23: warning: unused variable 'tl_cmd' [-Wunused-variable]
security/integrity/ima/ima_crypto.c:132:1: warning: 'ima_calc_dir_hash_tfm' uses dynamic stack allocation [enabled by default]
security/integrity/ima/ima_crypto.c:164:1: warning: 'ima_calc_buffer_hash_tfm' uses dynamic stack allocation [enabled by default]
security/integrity/ima/ima_crypto.c:219:1: warning: 'ima_calc_boot_aggregate_tfm' uses dynamic stack allocation [enabled by default]
include/linux/of_platform.h:113:45: warning: 'struct platform_device' declared inside parameter list [enabled by default]
lib/locking-selftest.c:1250:6: warning: unused variable 'ret' [-Wunused-variable]

[sparse]
drivers/usb/gadget/f_subset.c:490:21: sparse: symbol 'geth_alloc' was not declared. Should it be static?
drivers/usb/gadget/rndis.c:1145:5: sparse: symbol 'rndis_init' was not declared. Should it be static?
drivers/usb/gadget/rndis.c:1179:6: sparse: symbol 'rndis_exit' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
