From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 15 Jan 2013 17:11:39 +0000
Subject: build regressions 2013-01-15
Message-Id: <50f58dcb.w05/tXXoZ2jllPe4%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/mmc/core/slot-gpio.c:123:2: error: implicit declaration of function 'devm_gpio_request_one' [-Werror=implicit-function-declaration]
drivers/mmc/core/slot-gpio.c:216:2: error: implicit declaration of function 'devm_gpio_free' [-Werror=implicit-function-declaration]
initramfs.c:(.init.text+0x32ab): undefined reference to `__initramfs_size'
initramfs.c:(.init.text+0x228c): undefined reference to `__initramfs_size'
security/keys/Kconfig:5:error: recursive dependency detected!

[warnings]
sound/pci/hda/patch_sigmatel.c:2219:24: warning: unused variable 'spec' [-Wunused-variable]

[sparse]
drivers/ata/libata-core.c:102:10: sparse: symbol 'host_print_id' was not declared. Should it be static?
drivers/nfc/pn533.c:488:24: sparse: symbol 'pn533_std_frame_ops' was not declared. Should it be static?
sound/pci/hda/patch_sigmatel.c:2260:26: sparse: obsolete array initializer, use C99 syntax
drivers/mmc/host/sdhci.c:2475:6: sparse: symbol 'sdhci_disable_irq_wakeups' was not declared. Should it be static?

[smatch]
drivers/ata/libata-core.c:2332 ata_dev_configure() warn: 'sata_setting' puts 512 bytes on stack

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
