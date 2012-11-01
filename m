From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 01 Nov 2012 16:52:14 +0000
Subject: build regressions 2012-11-01
Message-Id: <20121101165214.GA17088@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/blackfin/kernel/process.c:166:6: error: 'regs' undeclared (first use in this function)
drivers/usb/phy/rcar-phy.c:75:3: error: implicit declaration of function 'iowrite32' [-Werror=implicit-function-declaration]
drivers/usb/phy/rcar-phy.c:83:4: error: implicit declaration of function 'ioread32' [-Werror=implicit-function-declaration]
arch/cris/arch-v10/kernel/process.c:118:15: error: invalid type argument of unary '*' (have 'int')
lib/atomic64.c:40:11: error: 'L1_CACHE_SHIFT' undeclared (first use in this function)
ERROR: "kernel_stack_pointer" [arch/x86/oprofile/oprofile.ko] undefined!
drivers/acpi/acpica/utmisc.c:677:4: error: 'ACPI_DB_WARN' undeclared (first use in this function)
drivers/acpi/acpica/utmisc.c:677:4: error: too few arguments to function 'acpi_debug_print'
drivers/acpi/acpica/psloop.c:846:2: error: implicit declaration of function 'ACPI_PREEMPTION_POINT' [-Werror=implicit-function-declaration]
arch/m32r/kernel/process.c:200:6: error: 'p' undeclared (first use in this function)
Makefile:911: *** Headers not exportable for the m68k architecture.  Stop.
arch/parisc/kernel/entry.S:1701: Error: Invalid operands
arch/parisc/kernel/entry.S:1691: Error: unexpected end of file in macro `fork_like' definition
Makefile:911: *** Headers not exportable for the tile architecture.  Stop.
drivers/input/touchscreen/bu21013_ts.c:510:2: error: assignment of member 'irq' in read-only object
drivers/mfd/stmpe.c:1025:2: error: implicit declaration of function 'of_property_read_u32' [-Werror=implicit-function-declaration]
drivers/mfd/stmpe.c:1030:2: error: implicit declaration of function 'for_each_child_of_node' [-Werror=implicit-function-declaration]
drivers/mfd/stmpe.c:1030:36: error: expected ';' before '{' token
arch/xtensa/include/uapi/asm/unistd.h:263:1: error: 'sys_clone' undeclared here (not in a function)

[warnings]
WARNING: vmlinux.o(.text+0x68460a): Section mismatch in reference from the function integrity_init_keyring() to the variable .init.data:pubkey
drivers/mfd/tc3589x.c:201:2: warning: format '%d' expects argument of type 'int', but argument 3 has type 'irq_hw_number_t' [-Wformat]
drivers/usb/serial/mos7840.c:2678:16: warning: unused variable 'flags' [-Wunused-variable]
drivers/acpi/acpica/utmisc.c:677:4: warning: passing argument 2 of 'acpi_debug_print' makes integer from pointer without a cast [enabled by default]
warning: (LOCKDEP && FAULT_INJECTION_STACKTRACE_FILTER && LATENCYTOP && KMEMCHECK) selects FRAME_POINTER which has unmet direct dependencies (DEBUG_KERNEL && (CRIS || M68K || FRV || UML || AVR32 || SUPERH || BLACKFIN || MN10300 || METAG) || ARCH_WANT_FRAME_POINTERS)
init/boottime.c:323:37: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
init/boottime.c:369:1: warning: the frame size of 327792 bytes is larger than 2048 bytes [-Wframe-larger-than=]
arch/x86/xen/enlighten.c:109:0: warning: "xen_pvh_domain" redefined [enabled by default]
drivers/gpio/gpio-tc3589x.c:264:2: warning: format '%d' expects argument of type 'int', but argument 3 has type 'irq_hw_number_t' [-Wformat]
lib/swiotlb.c:627:2: warning: 'dev_addr' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/xtensa/kernel/irq.c:87:2: warning: passing argument 1 of 'xtensa_irq_unmask' makes pointer from integer without a cast [enabled by default]
arch/xtensa/kernel/irq.c:92:2: warning: passing argument 1 of 'xtensa_irq_mask' makes pointer from integer without a cast [enabled by default]
drivers/tty/serial/8250/8250_pci.c:921:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/pci/quirks.c:2942:23: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/pci/quirks.c:3102:12: warning: assignment makes pointer from integer without a cast [enabled by default]
include/video/vga.h:226:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]

[sparse]
drivers/staging/ced1401/usb1401.c:1394:10: sparse: unknown field name in initializer
drivers/staging/silicom/bp_mod.c:5915:10: sparse: unknown field name in initializer
init/boottime.c:76:27: sparse: symbol 'boottime_arch_startup' was not declared. Should it be static?
init/boottime.c:401:6: sparse: symbol 'boottime_debugfs_init' was not declared. Should it be static?
init/boottime.c:440:1: sparse: symbol 'dev_attr_kernel' was not declared. Should it be static?
init/boottime.c:441:1: sparse: symbol 'dev_attr_bootloader' was not declared. Should it be static?
drivers/staging/ced1401/usb1401.c:1637:16: sparse: Expected ) in function declarator
drivers/staging/ced1401/usb1401.c:1637:16: sparse: got "GPL"
drivers/staging/ced1401/usb1401.c:147:9: sparse: undefined identifier 'usb_buffer_free'
drivers/staging/ced1401/usb1401.c:162:9: sparse: undefined identifier 'kfree'
drivers/staging/ced1401/usb1401.c:1386:18: sparse: undefined identifier 'THIS_MODULE'
drivers/staging/ced1401/usb1401.c:1420:15: sparse: undefined identifier 'kzalloc'
drivers/staging/ced1401/usb1401.c:1477:13: sparse: undefined identifier 'usb_buffer_alloc'
kernel/fork.c:1638:1: sparse: symbol 'sys_fork' was not declared. Should it be static?
kernel/fork.c:1650:1: sparse: symbol 'sys_vfork' was not declared. Should it be static?
kernel/fork.c:1659:1: sparse: symbol 'sys_clone' was not declared. Should it be static?
drivers/acpi/acpi_platform.c:152:24: sparse: symbol 'acpi_create_platform_device' was not declared. Should it be static?
init/boottime.c:81:27: sparse: symbol 'boottime_bootloader_idle' was not declared. Should it be static?
lib/swiotlb.c:505:13: sparse: symbol 'map_single' was not declared. Should it be static?

[smatch]
drivers/gpio/gpiolib.c:1755 gpio_block_create() error: potential NULL dereference 'gbc->remap'.
drivers/gpio/gpio-max730x.c:165 max7301_get_block() error: buffer overflow 'ts->port_config' 8 <= 8
drivers/acpi/acpica/nsxfname.c:500 acpi_get_object_info() info: redundant null check on sub calling kfree()
drivers/net/usb/smsc95xx.c:1073 smsc95xx_suspend() error: not allocating enough data 4 vs 2
drivers/net/usb/smsc95xx.c:1081 smsc95xx_suspend() error: potential null dereference 'filter_mask'.  (kzalloc returns null)
drivers/net/usb/smsc95xx.c:1085 smsc95xx_suspend() error: potential null dereference 'command'.  (kzalloc returns null)
drivers/net/usb/smsc95xx.c:1086 smsc95xx_suspend() error: potential null dereference 'offset'.  (kzalloc returns null)
drivers/net/usb/smsc95xx.c:1087 smsc95xx_suspend() error: potential null dereference 'crc'.  (kzalloc returns null)
drivers/net/usb/smsc95xx.c:1107 smsc95xx_suspend() error: buffer overflow 'filter_mask' 8 <= 8
drivers/net/usb/smsc95xx.c:1131 smsc95xx_suspend() warn: possible memory leak of 'command'
drivers/net/usb/smsc95xx.c:1131 smsc95xx_suspend() warn: possible memory leak of 'crc'
drivers/net/usb/smsc95xx.c:1131 smsc95xx_suspend() warn: possible memory leak of 'offset'
drivers/net/usb/smsc95xx.c:1136 smsc95xx_suspend() warn: possible memory leak of 'filter_mask'
lib/swiotlb.c:623 swiotlb_alloc_coherent() error: we previously assumed 'hwdev' could be null (see line 598)
drivers/mfd/stmpe.c:1031 stmpe_of_probe() error: potentially derefencing uninitialized 'child'.
init/boottime.c:218 boottime_activate() warn: can 'b' even be NULL?
init/boottime.c:348 boottime_debugfs_summary_show() warn: 'b_zero' puts 2640 bytes on stack

[coccinelle]
drivers/staging/media/easycap/easycap_main.c:1349:5-14: code aligned with following code on line 1350
drivers/vfio/pci/vfio_pci.c:330:10-17: WARNING opportunity for memdup_user

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
