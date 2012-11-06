From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 06 Nov 2012 17:26:12 +0000
Subject: build regressions 2012-11-06
Message-Id: <20121106172612.GA3184@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
ERROR: Input tree has errors, aborting (use -f to force output)
drivers/irqchip/gic.c:62:9: error: implicit declaration of function 'irq_data_get_irq_chip_data' [-Werror=implicit-function-declaration]
drivers/irqchip/gic.c:74:10: error: dereferencing pointer to incomplete type
drivers/irqchip/gic.c:118:14: error: 'IRQ_TYPE_LEVEL_HIGH' undeclared (first use in this function)
drivers/irqchip/gic.c:118:45: error: 'IRQ_TYPE_EDGE_RISING' undeclared (first use in this function)
drivers/irqchip/gic.c:168:9: error: 'IRQ_SET_MASK_OK' undeclared (first use in this function)
drivers/irqchip/gic.c:200:9: error: implicit declaration of function 'irq_desc_get_handler_data' [-Werror=implicit-function-declaration]
drivers/irqchip/gic.c:201:9: error: implicit declaration of function 'irq_get_chip' [-Werror=implicit-function-declaration]
drivers/irqchip/gic.c:215:3: error: implicit declaration of function 'handle_bad_irq' [-Werror=implicit-function-declaration]
drivers/irqchip/gic.c:217:3: error: implicit declaration of function 'generic_handle_irq' [-Werror=implicit-function-declaration]
drivers/irqchip/gic.c:224:15: error: variable 'gic_chip' has initializer but incomplete type
drivers/irqchip/gic.c:225:2: error: unknown field 'name' specified in initializer
drivers/irqchip/gic.c:226:2: error: unknown field 'irq_mask' specified in initializer
drivers/irqchip/gic.c:227:2: error: unknown field 'irq_unmask' specified in initializer
drivers/irqchip/gic.c:228:2: error: unknown field 'irq_eoi' specified in initializer
drivers/irqchip/gic.c:229:2: error: unknown field 'irq_set_type' specified in initializer
drivers/irqchip/gic.c:231:2: error: unknown field 'irq_set_affinity' specified in initializer
drivers/irqchip/gic.c:238:2: error: implicit declaration of function 'irq_set_handler_data' [-Werror=implicit-function-declaration]
drivers/irqchip/gic.c:240:2: error: implicit declaration of function 'irq_set_chained_handler' [-Werror=implicit-function-declaration]
arch/arm/kernel/hw_breakpoint.c:283:7: error: 'TYPE_INST' undeclared (first use in this function)
arch/arm/kernel/hw_breakpoint.c:285:7: error: 'TYPE_DATA' undeclared (first use in this function)
arch/arm/kernel/hw_breakpoint.c:481:15: error: 'HW_BREAKPOINT_X' undeclared (first use in this function)
arch/arm/kernel/hw_breakpoint.c:484:15: error: 'HW_BREAKPOINT_R' undeclared (first use in this function)
arch/arm/kernel/hw_breakpoint.c:487:15: error: 'HW_BREAKPOINT_W' undeclared (first use in this function)
arch/arm/kernel/hw_breakpoint.c:490:15: error: 'HW_BREAKPOINT_RW' undeclared (first use in this function)
arch/arm/kernel/hw_breakpoint.c:499:14: error: 'HW_BREAKPOINT_LEN_1' undeclared (first use in this function)
arch/arm/kernel/hw_breakpoint.c:502:14: error: 'HW_BREAKPOINT_LEN_2' undeclared (first use in this function)
arch/arm/kernel/hw_breakpoint.c:505:14: error: 'HW_BREAKPOINT_LEN_4' undeclared (first use in this function)
arch/arm/kernel/hw_breakpoint.c:508:14: error: 'HW_BREAKPOINT_LEN_8' undeclared (first use in this function)
arch/arm/kernel/ptrace.c:440:33: error: 'TYPE_INST' undeclared (first use in this function)
arch/arm/kernel/ptrace.c:441:33: error: 'TYPE_DATA' undeclared (first use in this function)
arch/arm/kernel/ptrace.c:464:16: error: 'HW_BREAKPOINT_LEN_4' undeclared (first use in this function)
arch/arm/kernel/ptrace.c:530:18: error: 'HW_BREAKPOINT_RW' undeclared (first use in this function)
arch/arm/kernel/ptrace.c:532:18: error: 'HW_BREAKPOINT_X' undeclared (first use in this function)
include/linux/rculist_bl.h:20:2: error: 'n' undeclared (first use in this function)
arch/x86/kernel/hw_breakpoint.c:215:15: error: 'HW_BREAKPOINT_X' undeclared (first use in this function)
arch/x86/kernel/hw_breakpoint.c:219:15: error: 'HW_BREAKPOINT_W' undeclared (first use in this function)
arch/x86/kernel/hw_breakpoint.c:222:33: error: 'HW_BREAKPOINT_R' undeclared (first use in this function)
arch/x86/kernel/hw_breakpoint.c:231:14: error: 'HW_BREAKPOINT_LEN_1' undeclared (first use in this function)
arch/x86/kernel/hw_breakpoint.c:234:14: error: 'HW_BREAKPOINT_LEN_2' undeclared (first use in this function)
arch/x86/kernel/hw_breakpoint.c:237:14: error: 'HW_BREAKPOINT_LEN_4' undeclared (first use in this function)
arch/x86/kernel/ptrace.c:716:17: error: 'HW_BREAKPOINT_LEN_1' undeclared (first use in this function)
arch/x86/kernel/ptrace.c:717:18: error: 'HW_BREAKPOINT_W' undeclared (first use in this function)
kernel/events/hw_breakpoint.c:56:8: error: 'TYPE_MAX' undeclared here (not in a function)
kernel/events/hw_breakpoint.c:85:32: error: return type is an incomplete type
kernel/events/hw_breakpoint.c:87:25: error: 'HW_BREAKPOINT_RW' undeclared (first use in this function)
kernel/events/hw_breakpoint.c:88:10: error: 'TYPE_DATA' undeclared (first use in this function)
kernel/events/hw_breakpoint.c:90:9: error: 'TYPE_INST' undeclared (first use in this function)
kernel/events/hw_breakpoint.c:97:66: error: parameter 2 ('type') has incomplete type
kernel/events/hw_breakpoint.c:121:3: error: void value not ignored as it ought to be
kernel/events/hw_breakpoint.c:299:19: error: storage size of 'type' isn't known
kernel/events/hw_breakpoint.c:307:26: error: 'HW_BREAKPOINT_EMPTY' undeclared (first use in this function)
kernel/events/hw_breakpoint.c:308:26: error: 'HW_BREAKPOINT_INVALID' undeclared (first use in this function)
ERROR: "timekeeping_suspended" [fs/pstore/ramoops.ko] undefined!
drivers/gpio/gpiolib-of.c:280:2: error: implicit declaration of function 'gpiochip_remove_pin_ranges' [-Werror=implicit-function-declaration]
arch/powerpc/kernel/hw_breakpoint.c:50:14: error: 'TYPE_DATA' undeclared (first use in this function)
arch/powerpc/kernel/hw_breakpoint.c:132:18: error: 'HW_BREAKPOINT_R' undeclared (first use in this function)
arch/powerpc/kernel/hw_breakpoint.c:135:18: error: 'HW_BREAKPOINT_W' undeclared (first use in this function)
arch/sh/kernel/hw_breakpoint.c:144:14: error: 'HW_BREAKPOINT_LEN_1' undeclared (first use in this function)
arch/sh/kernel/hw_breakpoint.c:147:14: error: 'HW_BREAKPOINT_LEN_2' undeclared (first use in this function)
arch/sh/kernel/hw_breakpoint.c:150:14: error: 'HW_BREAKPOINT_LEN_4' undeclared (first use in this function)
arch/sh/kernel/hw_breakpoint.c:153:14: error: 'HW_BREAKPOINT_LEN_8' undeclared (first use in this function)
arch/sh/kernel/hw_breakpoint.c:162:15: error: 'HW_BREAKPOINT_R' undeclared (first use in this function)
arch/sh/kernel/hw_breakpoint.c:164:15: error: 'HW_BREAKPOINT_W' undeclared (first use in this function)
arch/sh/kernel/ptrace_32.c:90:17: error: 'HW_BREAKPOINT_LEN_2' undeclared (first use in this function)
arch/sh/kernel/ptrace_32.c:91:18: error: 'HW_BREAKPOINT_R' undeclared (first use in this function)
arch/x86/kernel/hw_breakpoint.c:241:14: error: 'HW_BREAKPOINT_LEN_8' undeclared (first use in this function)
arch/x86/kernel/kgdb.c:666:16: error: 'HW_BREAKPOINT_LEN_1' undeclared (first use in this function)
arch/x86/kernel/kgdb.c:667:17: error: 'HW_BREAKPOINT_W' undeclared (first use in this function)
drivers/gpio/gpiolib.c:1128:2: error: implicit declaration of function 'gpiochip_remove_pin_ranges' [-Werror=implicit-function-declaration]
(.init.text+0x4d52): undefined reference to `create_sysfs_sched_policy_group'

[warnings]
drivers/irqchip/gic.c:60:50: warning: 'struct irq_data' declared inside parameter list [enabled by default]
drivers/irqchip/gic.c:60:50: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
drivers/irqchip/gic.c:62:35: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/irqchip/gic.c:82:2: warning: passing argument 1 of 'gic_irq' from incompatible pointer type [enabled by default]
drivers/irqchip/gic.c:85:2: warning: passing argument 1 of 'gic_dist_base' from incompatible pointer type [enabled by default]
drivers/irqchip/gic.c:100:2: warning: passing argument 1 of 'gic_cpu_base' from incompatible pointer type [enabled by default]
drivers/irqchip/gic.c:225:2: warning: excess elements in struct initializer [enabled by default]
drivers/irqchip/gic.c:225:2: warning: (near initialization for 'gic_chip') [enabled by default]
include/linux/bit_spinlock.h:49:3: warning: 'return' with no value, in function returning non-void [-Wreturn-type]
include/linux/bit_spinlock.h:68:3: warning: 'return' with a value, in function returning void [enabled by default]
kernel/events/hw_breakpoint.c:88:3: warning: 'return' with a value, in function returning void [enabled by default]
kernel/events/hw_breakpoint.c:97:21: warning: function declaration isn't a prototype [-Wstrict-prototypes]
kernel/events/hw_breakpoint.c:299:19: warning: unused variable 'type' [-Wunused-variable]
kernel/events/hw_breakpoint.c:56:8: warning: 'nr_cpu_bp_pinned' defined but not used [-Wunused-variable]
kernel/events/hw_breakpoint.c:59:8: warning: 'nr_task_bp_pinned' defined but not used [-Wunused-variable]
kernel/events/hw_breakpoint.c:62:8: warning: 'nr_bp_flexible' defined but not used [-Wunused-variable]
kernel/events/hw_breakpoint.c:64:12: warning: 'nr_slots' defined but not used [-Wunused-variable]
warning: (DM_THIN_PROVISIONING) selects DM_BIO_PRISON which has unmet direct dependencies (MD && BLK_DEV_DM && EXPERIMENTAL)
kernel/events/hw_breakpoint.c:56:1: warning: '__pcpu_scope_nr_cpu_bp_pinned' defined but not used [-Wunused-variable]
kernel/events/hw_breakpoint.c:59:1: warning: '__pcpu_scope_nr_task_bp_pinned' defined but not used [-Wunused-variable]
kernel/events/hw_breakpoint.c:62:1: warning: '__pcpu_scope_nr_bp_flexible' defined but not used [-Wunused-variable]
WARNING: drivers/video/omap2/dss/omapdss.o(.init.text+0x2c1c): Section mismatch in reference from the function omapdss_hdmihw_probe() to the function .exit.text:hdmi_uninit_display.isra.10()
drivers/acpi/pci_bind.c:48:2: warning: passing argument 1 of 'acpi_power_resource_unregister_device' from incompatible pointer type [enabled by default]
drivers/acpi/pci_bind.c:75:2: warning: passing argument 1 of 'acpi_power_resource_register_device' from incompatible pointer type [enabled by default]
arch/x86/mm/init.c:240:7: warning: 'good_end' is used uninitialized in this function [-Wuninitialized]

[sparse]
net/ipv4/netfilter/nft_chain_nat_ipv4.c:48:35: sparse: incorrect type in assignment (different base types)
drivers/acpi/pci_bind.c:48:47: sparse: incorrect type in argument 1 (different base types)
arch/x86/kernel/hw_breakpoint.c:260:14: sparse: incompatible types for 'case' statement
kernel/events/hw_breakpoint.c:56:8: sparse: bad constant expression type
kernel/events/hw_breakpoint.c:100:36: sparse: incompatible types for operation (+)
kernel/events/hw_breakpoint.c:59:8: sparse: bad constant expression
kernel/events/hw_breakpoint.c:100:36: sparse: cannot dereference this type
kernel/events/hw_breakpoint.c:100:36: sparse: cast from unknown type
kernel/events/hw_breakpoint.c:62:8: sparse: too many errors
drivers/tty/serial/serial_core.c:617:22: sparse: invalid assignment: |drivers/tty/serial/serial_core.c:621:17: sparse: restricted upf_t degrades to integer
drivers/gpio/gpiolib.c:1221:6: sparse: symbol 'gpiochip_remove_pin_ranges' was not declared. Should it be static?
net/ipv6/netfilter/nft_chain_route_ipv6.c:42:22: sparse: symbol 'nft_chain_route_ipv6' was not declared. Should it be static?
net/ipv4/netfilter/nft_chain_route_ipv4.c:41:22: sparse: symbol 'nft_chain_route_ipv4' was not declared. Should it be static?
net/ipv4/netfilter/nft_chain_nat_ipv4.c:305:22: sparse: symbol 'nft_chain_nat_ipv4' was not declared. Should it be static?
kernel/events/hw_breakpoint.c:56:8: sparse: undefined identifier 'TYPE_MAX'
kernel/events/hw_breakpoint.c:87:32: sparse: undefined identifier 'HW_BREAKPOINT_RW'
kernel/events/hw_breakpoint.c:88:24: sparse: undefined identifier 'TYPE_DATA'
kernel/events/hw_breakpoint.c:90:16: sparse: undefined identifier 'TYPE_INST'
arch/x86/kernel/ptrace.c:716:31: sparse: undefined identifier 'HW_BREAKPOINT_LEN_1'
arch/x86/kernel/ptrace.c:717:32: sparse: undefined identifier 'HW_BREAKPOINT_W'
arch/x86/kernel/kgdb.c:666:23: sparse: undefined identifier 'HW_BREAKPOINT_LEN_1'
arch/x86/kernel/kgdb.c:667:24: sparse: undefined identifier 'HW_BREAKPOINT_W'
arch/x86/kernel/hw_breakpoint.c:215:29: sparse: undefined identifier 'HW_BREAKPOINT_X'
arch/x86/kernel/hw_breakpoint.c:219:29: sparse: undefined identifier 'HW_BREAKPOINT_W'
arch/x86/kernel/hw_breakpoint.c:231:28: sparse: undefined identifier 'HW_BREAKPOINT_LEN_1'
arch/x86/kernel/hw_breakpoint.c:234:28: sparse: undefined identifier 'HW_BREAKPOINT_LEN_2'
arch/x86/kernel/hw_breakpoint.c:237:28: sparse: undefined identifier 'HW_BREAKPOINT_LEN_4'
arch/x86/kernel/hw_breakpoint.c:263:32: sparse: undefined identifier 'HW_BREAKPOINT_R'
arch/x86/kernel/hw_breakpoint.c:260:14: sparse: Expected constant expression in case statement
drivers/gpio/gpiolib.c:1221:6: sparse: symbol 'gpiochip_add_pin_range' was not declared. Should it be static?

[smatch]
net/netfilter/nf_tables_api.c:718 nf_tables_newchain() info: why not propagate 'type' from nf_tables_chain_type_lookup() instead of -2?
drivers/mfd/ti_am335x_tscadc.c:83 ti_tscadc_probe() info: why not propagate 'irq' from platform_get_irq() instead of -22?

[coccinelle]
drivers/usb/dwc3/core.c:196:2-7: WARNING: invalid free of devm_ allocated data

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
