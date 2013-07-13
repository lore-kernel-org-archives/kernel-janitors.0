From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 13 Jul 2013 21:06:34 +0000
Subject: build regressions 2013-07-13
Message-Id: <51e1c15a.KuryVJhabZIa6Pom%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/pci/hotplug/acpiphp_ibm.c:69:69: error: 'struct acpiphp_slot' has no member named 'sun'
drivers/pci/hotplug/acpiphp_ibm.c:69:69: error: 'struct acpiphp_slot' has no member named 'sun'
drivers/acpi/video_detect.c:239:6: error: redefinition of 'acpi_video_backlight_quirks'
drivers/acpi/video_detect.c:295:6: error: redefinition of 'acpi_video_verify_backlight_support'
include/linux/dmabuf-sync.h:23:18: error: field 'sync_lock' has incomplete type
include/linux/dmabuf-sync.h:64:24: error: field 'ctx' has incomplete type
fs/ext4/extents_status.c:670:2: error: implicit declaration of function 'EXT4' [-Werror=implicit-function-declaration]
fs/ext4/extents_status.c:672:45: error: 'newns' undeclared (first use in this function)
arch/x86/mm/dump_pagetables.c:316:2: error: implicit declaration of function 'phys_to_virt' [-Werror=implicit-function-declaration]
arch/x86/boot/compressed/../early_serial_console.h:10:22: error: conflicting type qualifiers for 'early_serial_base'

[warnings]
arch/x86/mm/dump_pagetables.c:316:2: warning: passing argument 1 of 'phys_to_virt' makes integer from pointer without a cast [enabled by default]
Warning(drivers/pci/remove.c:119): No description found for parameter 'dev'
arch/x86/kernel/traps.c:74:1: warning: braces around scalar initializer [enabled by default]
arch/x86/kernel/traps.c:74:1: warning: (near initialization for 'idt_table[0].offset_low') [enabled by default]
arch/x86/kernel/traps.c:74:1: warning: braces around scalar initializer [enabled by default]
arch/x86/kernel/traps.c:74:1: warning: (near initialization for 'idt_table[0].offset_low') [enabled by default]
arch/x86/kernel/traps.c:74:1: warning: excess elements in scalar initializer [enabled by default]
arch/x86/kernel/traps.c:74:1: warning: (near initialization for 'idt_table[0].offset_low') [enabled by default]
fs/ext4/extents_status.c:670:2: warning: passing argument 1 of '__es_try_to_reclaim_extents' makes pointer from integer without a cast [enabled by default]
fs/ext4/extents_status.c:791:9: warning: passing argument 1 of '__es_try_to_reclaim_extents' makes pointer from integer without a cast [enabled by default]
arch/x86/mm/dump_pagetables.c:316:6: warning: assignment makes pointer from integer without a cast [enabled by default]
arch/x86/mm/dump_pagetables.c:316:8: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]

[sparse]
arch/x86/mm/dump_pagetables.c:316:28: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned long long [unsigned] [usertype] address @@    got ong [unsigned] [usertype] address @@
arch/x86/boot/early_serial_console.h:36:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:39:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:36:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:39:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:36:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:39:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:36:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:39:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:19:71: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got le [noderef] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:22:71: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got le [noderef] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:36:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:39:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:36:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:39:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:36:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:39:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:36:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:39:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:19:71: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got le [noderef] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:22:71: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got le [noderef] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:36:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:39:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:19:71: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got le [noderef] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:22:71: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got le [noderef] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:19:71: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got le [noderef] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:22:71: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got le [noderef] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:36:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:39:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:19:71: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got le [noderef] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:22:71: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got le [noderef] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:36:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/early_serial_console.h:39:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:19:71: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got le [noderef] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:22:71: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got le [noderef] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:36:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:39:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:36:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:39:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:36:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:39:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:36:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:39:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:36:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:39:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:19:71: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got le [noderef] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:22:71: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got le [noderef] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:36:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:39:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:36:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:39:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:36:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:39:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:36:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:39:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:19:71: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got le [noderef] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:22:71: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got le [noderef] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:36:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:39:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:19:71: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got le [noderef] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:22:71: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got le [noderef] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:19:71: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got le [noderef] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:22:71: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got le [noderef] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:36:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/boot/compressed/../early_serial_console.h:39:66: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got deref] <asn:2>*addr @@
arch/x86/kernel/traps.c:74:59: sparse: bogus scalar initializer
drivers/acpi/video_detect.c:236:6: sparse: symbol 'acpi_video_backlight_quirks' was not declared. Should it be static?
drivers/acpi/video_detect.c:292:6: sparse: symbol 'acpi_video_verify_backlight_support' was not declared. Should it be static?
fs/ext4/extents_status.c:828:65: sparse: undefined identifier 'EXT4'
fs/ext4/extents_status.c:672:52: sparse: undefined identifier 'newns'

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
