From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 02 Nov 2012 18:34:17 +0000
Subject: build regressions 2012-11-02
Message-Id: <20121102183417.GA25891@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
usbmisc_imx6q.c:(.text+0xa30): multiple definition of `ehci_init_driver'
drivers/usb/host/built-in.o:ehci-hcd.c:(.text+0x330): first defined here
usbmisc_imx6q.c:(.text+0x4478): multiple definition of `ehci_suspend'
usbmisc_imx6q.c:(.text+0x4568): multiple definition of `ehci_resume'
usbmisc_imx6q.c:(.text+0x86b0): multiple definition of `ehci_setup'
(.text+0x2872): multiple definition of `ehci_init_driver'
drivers/usb/host/built-in.o:(.text+0x4422): first defined here
(.text+0x3ac5): multiple definition of `ehci_suspend'
(.text+0x7243): multiple definition of `ehci_resume'
(.text+0x7359): multiple definition of `ehci_setup'
ERROR: "dbgp_external_startup" undefined!
ERROR: "dbgp_reset_prep" undefined!
kernel/trace/trace.c:491:2: error: 'ARCH_TRACE_CLOCKS' undeclared here (not in a function)
ERROR: "ptp_clock_unregister" [drivers/net/ethernet/sfc/sfc.ko] undefined!
ERROR: "ptp_clock_event" [drivers/net/ethernet/sfc/sfc.ko] undefined!
ERROR: "ptp_clock_register" [drivers/net/ethernet/sfc/sfc.ko] undefined!
ERROR: "ptp_clock_index" [drivers/net/ethernet/sfc/sfc.ko] undefined!
arch/mips/mm/tlbex.c:229:2: error: '_PAGE_SPLITTING_SHIFT' undeclared (first use in this function)
arch/mips/mm/tlbex.c:230:6: error: 'kernel_uses_smartmips_rixi' undeclared (first use in this function)
net/core/sock.c:1080:7: error: 'SO_GET_FILTER' undeclared (first use in this function)
drivers/usb/host/ehci.h:662:3: error: implicit declaration of function 'readl_be' [-Werror=implicit-function-declaration]
drivers/usb/host/ehci.h:663:3: error: implicit declaration of function 'readl' [-Werror=implicit-function-declaration]
drivers/usb/host/ehci.h:674:3: error: implicit declaration of function 'writel_be' [-Werror=implicit-function-declaration]
drivers/usb/host/ehci.h:675:3: error: implicit declaration of function 'writel' [-Werror=implicit-function-declaration]
ERROR: "nfs4_set_task_privileged" undefined!
net/core/filter.c:793:4: error: 'BPF_S_ANC_VLAN_TAG' undeclared (first use in this function)
net/core/filter.c:793:3: error: array index in initializer not of integer type
net/core/filter.c:793:3: error: (near initialization for 'decodes')
net/core/filter.c:794:4: error: 'BPF_S_ANC_VLAN_TAG_PRESENT' undeclared (first use in this function)
nfs4state.c:(.text+0x1733a5): undefined reference to `nfs4_set_task_privileged'

[warnings]
warning: (BLK_DEV_RBD && CEPH_FS) selects CEPH_LIB which has unmet direct dependencies (NET && INET && EXPERIMENTAL)
kernel/trace/trace_output.c:632:28: warning: comparison of distinct pointer types lacks a cast [enabled by default]
kernel/trace/trace_output.c:632:3: warning: right shift count >= width of type [enabled by default]
kernel/trace/trace_output.c:632:3: warning: passing argument 1 of '__div64_32' from incompatible pointer type [enabled by default]
arch/x86/xen/enlighten.c:1560:16: warning: unused variable 'ebx' [-Wunused-variable]
arch/x86/xen/enlighten.c:1560:11: warning: unused variable 'eax' [-Wunused-variable]

[sparse]
drivers/cpuidle/driver.c:81:1: sparse: symbol '__pcpu_scope_cpuidle_drivers' was not declared. Should it be static?
drivers/cpuidle/driver.c:81:1: sparse: symbol 'cpuidle_drivers' was not declared. Should it be static?
kernel/trace/trace_syscalls.c:81:1: sparse: symbol 'print_syscall_enter' was not declared. Should it be static?
kernel/trace/trace_syscalls.c:134:1: sparse: symbol 'print_syscall_exit' was not declared. Should it be static?
kernel/trace/trace_syscalls.c:340:5: sparse: symbol 'reg_event_syscall_enter' was not declared. Should it be static?
kernel/trace/trace_syscalls.c:359:6: sparse: symbol 'unreg_event_syscall_enter' was not declared. Should it be static?
kernel/trace/trace_syscalls.c:374:5: sparse: symbol 'reg_event_syscall_exit' was not declared. Should it be static?
kernel/trace/trace_syscalls.c:393:6: sparse: symbol 'unreg_event_syscall_exit' was not declared. Should it be static?
drivers/acpi/device_pm.c:407:5: sparse: symbol 'acpi_dev_runtime_suspend' was not declared. Should it be static?
drivers/acpi/device_pm.c:438:5: sparse: symbol 'acpi_dev_runtime_resume' was not declared. Should it be static?
drivers/acpi/device_pm.c:459:5: sparse: symbol 'acpi_subsys_runtime_suspend' was not declared. Should it be static?
drivers/acpi/device_pm.c:473:5: sparse: symbol 'acpi_subsys_runtime_resume' was not declared. Should it be static?
drivers/acpi/device_pm.c:491:5: sparse: symbol 'acpi_dev_suspend_late' was not declared. Should it be static?
drivers/acpi/device_pm.c:523:5: sparse: symbol 'acpi_dev_resume_early' was not declared. Should it be static?
drivers/acpi/device_pm.c:541:5: sparse: symbol 'acpi_subsys_prepare' was not declared. Should it be static?
drivers/acpi/device_pm.c:559:5: sparse: symbol 'acpi_subsys_suspend_late' was not declared. Should it be static?
drivers/acpi/device_pm.c:574:5: sparse: symbol 'acpi_subsys_resume_early' was not declared. Should it be static?
drivers/acpi/device_pm.c:613:5: sparse: symbol 'acpi_dev_pm_attach' was not declared. Should it be static?
drivers/acpi/device_pm.c:639:6: sparse: symbol 'acpi_dev_pm_detach' was not declared. Should it be static?
kernel/trace/trace.c:492:9: sparse: undefined identifier 'ARCH_TRACE_CLOCKS'

[smatch]
drivers/staging/comedi/drivers/addi-data/addi_common.c:180 addi_attach_pci() error: we previously assumed 'this_board->pc_EepromChip' could be null (see line 129)
drivers/staging/comedi/drivers/jr3_pci.c:793 jr3_pci_auto_attach() info: why not propagate 'result' from comedi_pci_enable() instead of -5?
drivers/misc/mei/amthif.c:254 mei_amthif_read() warn: inconsistent returns mutex:&dev->device_lock: locked (167,174,181,254) unlocked (193)
drivers/ptp/ptp_chardev.c:36 ptp_ioctl() warn: 'sysoff' puts 832 bytes on stack
drivers/target/target_core_spc.c:943 spc_emulate_modesense() warn: possible memory leak of 'buf'
drivers/target/target_core_spc.c:985 spc_emulate_modeselect() warn: 'tbuf' puts 512 bytes on stack

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
