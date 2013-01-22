From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 22 Jan 2013 16:24:57 +0000
Subject: build regressions 2013-01-22
Message-Id: <50febd59.lnqlY7+tQPRF0blE%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
sound/soc/fsl/imx-audmux.c:255:2: error: implicit declaration of function 'devm_ioremap_resource' [-Werror=implicit-function-declaration]
sound/soc/fsl/imx-ssi.c:553:2: error: implicit declaration of function 'devm_ioremap_resource' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-palmas.c:46:2: error: implicit declaration of function 'palmas_read' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-palmas.c:62:3: error: implicit declaration of function 'palmas_write' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-palmas.c:83:2: error: implicit declaration of function 'palmas_update_bits' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-palmas.c:108:2: error: implicit declaration of function 'palmas_irq_get_virq' [-Werror=implicit-function-declaration]
sound/soc/codecs/jz4740.c:364:2: error: implicit declaration of function 'devm_ioremap_resource' [-Werror=implicit-function-declaration]
drivers/net/ethernet/i825xx/82596.c:624:0: error: unterminated #if
drivers/mailbox/mailbox.c:41:39: error: 'CONFIG_OMAP_MBOX_KFIFO_SIZE' undeclared here (not in a function)
ERROR: "pci_next_resource_idx" [drivers/pci/xen-pcifront.ko] undefined!

[warnings]
drivers/mfd/vexpress-config.c:87:1: warning: data definition has no type or storage class [enabled by default]
drivers/mfd/vexpress-config.c:87:1: warning: type defaults to 'int' in declaration of 'EXPOPORT_SYMBOL' [-Wimplicit-int]
drivers/mfd/vexpress-config.c:87:1: warning: parameter names (without types) in function declaration [enabled by default]
sound/soc/fsl/imx-audmux.c:255:14: warning: assignment makes pointer from integer without a cast [enabled by default]
sound/soc/fsl/imx-ssi.c:553:12: warning: assignment makes pointer from integer without a cast [enabled by default]
WARNING: vmlinux.o(.data+0xfcd4): Section mismatch in reference from the variable gpioblock_of_driver to the (unknown reference) .init.data:(unknown)
include/linux/acpi.h:611: warning: 'acpi_early_console_probe' defined but not used
WARNING: drivers/firmware/built-in.o(.text+0xc9e): Section mismatch in reference from the function release_firmware_map_entry() to the function .meminit.text:firmware_map_find_entry()
WARNING: vmlinux.o(.text+0x798dd): Section mismatch in reference from the function mrst_early_console_init() to the function .init.text:mid_spi_early_console_init()
drivers/gpu/drm/qxl/qxl_ttm.c:444:6: warning: unused variable 'ret' [-Wunused-variable]
sound/soc/codecs/jz4740.c:403:21: warning: assignment makes pointer from integer without a cast [enabled by default]
kernel/resource.c:470:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/pci/iov.c:36:6: warning: unused variable 'rc' [-Wunused-variable]
drivers/video/cirrusfb.c:1947:2: warning: passing argument 1 of 'pci_dev_resource_n' discards 'const' qualifier from pointer target type [enabled by default]
drivers/net/netconsole.c:280:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/mailbox/mailbox.c:155:5: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/vhost/vringh.c:216:3: warning: passing argument 2 of 'rcheck' from incompatible pointer type [enabled by default]
WARNING: drivers/gpio/built-in.o(.data+0x23c): Section mismatch in reference from the variable gpioblock_of_driver to the function .init.text:gpiolib_debugfs_init()

[sparse]
net/ipv4/ipmr.c:1810:18: sparse: restricted __be32 degrades to integer
net/ipv4/ipmr.c:835:20: sparse: cast to restricted __be32
net/core/flow_dissector.c:280:37: sparse: incompatible types in comparison expression (different address spaces)
drivers/video/cirrusfb.c:1947:13: sparse: incorrect type in argument 1 (different modifiers)
drivers/pci/probe.c:143:31: sparse: symbol '__add_pci_dev_addon_resource' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_object.c:153:40: sparse: incorrect type in return expression (different address spaces)
drivers/gpu/drm/qxl/qxl_object.c:189:33: sparse: incorrect type in argument 1 (different address spaces)
drivers/platform/x86/early/intel_mid_spi.c:108:9: sparse: incorrect type in argument 2 (different address spaces)
net/core/dev.c:2741:8: sparse: symbol 'xmit_recursion' was not declared. Should it be static?
drivers/acpi/pci_root.c:779:13: sparse: symbol 'acpi_pci_root_hp_init' was not declared. Should it be static?
drivers/vhost/vringh.c:643:6: sparse: symbol 'vringh_notify_enable_user' was not declared. Should it be static?
drivers/vhost/vringh.c:655:6: sparse: symbol 'vringh_notify_disable_user' was not declared. Should it be static?
sound/soc/codecs/jz4740.c:364:16: sparse: undefined identifier 'devm_ioremap_resource'

[smatch]
arch/x86/kernel/kprobes/core.c:703 trampoline_handler() error: potential NULL dereference 'ri'.
arch/x86/kernel/kprobes/core.c:956 kprobe_exceptions_notify() error: we previously assumed 'args->regs' could be null (see line 951)
drivers/ata/libata-zpodd.c:83 zpodd_wake_dev() warn: variable dereferenced before check 'ata_dev' (see line 80)
net/ipv4/tcp.c:2708 do_tcp_setsockopt() warn: check for integer over/underflow 'val'

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
