From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 03 Oct 2013 18:53:47 +0000
Subject: build regressions 2013-10-03
Message-Id: <524dbd3b.98pxhdcSvUULjfJI%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
include/linux/acpi.h:131:1: error: expected identifier or '(' before '{' token
include/linux/acpi.h:131:1: error: expected identifier or '(' before '{' token
drivers/acpi/apic_id.c:282:5: error: redefinition of 'acpi_get_ioapic_id'
drivers/pinctrl/pinctrl-single.c:1740:2: error: implicit declaration of function 'set_irq_flags' [-Werror=implicit-function-declaration]
drivers/pinctrl/pinctrl-single.c:1740:21: error: 'IRQF_VALID' undeclared (first use in this function)
drivers/pinctrl/pinctrl-single.c:1740:34: error: 'IRQF_PROBE' undeclared (first use in this function)
ERROR: "vb2_vmalloc_memops" undefined!
ERROR: "kvm_vfio_ops" [arch/powerpc/kvm/kvm.ko] undefined!
kvm_main.c:(.text+0x29580): undefined reference to `kvm_vfio_ops'
kvm_main.c:(.text+0x29628): undefined reference to `kvm_vfio_ops'
fs/fs-writeback.c:1012:2: error: implicit declaration of function 'dev_name' [-Werror=implicit-function-declaration]
include/linux/cpumask.h:14:41: error: variably modified 'bits' at file scope
include/linux/cpumask.h:715:29: error: variably modified 'cpu_all_bits' at file scope
include/linux/cpumask.h:761:2: error: variably modified 'cpu_bit_bitmap' at file scope
arch/x86/include/asm/processor.h:659:34: error: macro "cpu_relax" passed 1 arguments, but takes just 0
arch/x86/include/asm/processor.h:660:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
arch/x86/include/asm/processor.h:800:10: error: called object is not a function or function pointer
arch/x86/include/asm/processor.h:813:10: error: called object is not a function or function pointer
arch/x86/include/asm/bitops.h:70:1: error: conflicting types for 'set_bit'
arch/x86/include/asm/bitops.h:108:1: error: static declaration of 'clear_bit' follows non-static declaration
arch/x86/include/asm/bitops.h:205:19: error: static declaration of 'test_and_set_bit' follows non-static declaration
arch/x86/include/asm/bitops.h:256:19: error: static declaration of 'test_and_clear_bit' follows non-static declaration
arch/x86/include/asm/bitops.h:326:28: error: conflicting types for 'constant_test_bit'
arch/x86/include/asm/bitops.h:332:19: error: conflicting types for 'variable_test_bit'
arch/x86/include/asm/bitops.h:455:19: error: static declaration of 'fls' follows non-static declaration
arch/x86/include/asm/bitops.h:497:28: error: static declaration of 'fls64' follows non-static declaration
include/asm-generic/bitops/find.h:11:22: error: conflicting types for 'find_next_bit'
include/asm-generic/bitops/find.h:22:22: error: conflicting types for 'find_next_zero_bit'
include/asm-generic/bitops/find.h:35:22: error: conflicting types for 'find_first_bit'
arch/x86/include/asm/io.h:269:20: error: conflicting types for 'outb'
arch/x86/include/asm/io.h:275:29: error: conflicting types for 'inb'
arch/x86/include/asm/io.h:269:20: error: conflicting types for 'outw'
arch/x86/include/asm/io.h:275:29: error: conflicting types for 'inw'
arch/x86/include/asm/io.h:269:20: error: conflicting types for 'outl'
arch/x86/include/asm/io.h:275:29: error: conflicting types for 'inl'
include/linux/nodemask.h:98:33: error: variably modified 'bits' at file scope
arch/x86/xen/setup.c:14:2: error: invalid preprocessing directive #Include
fs/ecryptfs/inode.c:211:3: error: too few arguments to function 'vfs_unlink'
fs/ecryptfs/inode.c:643:4: error: too few arguments to function 'vfs_rename'
fs/ecryptfs/inode.c:894:3: error: too few arguments to function 'notify_change'
drivers/gpu/drm/i915/intel_pm.c:5883:34: error: 'struct intel_gen6_power_mgmt' has no member named 'vlv_work'
drivers/gpu/drm/i915/intel_pm.c:5883:34: error: 'struct intel_gen6_power_mgmt' has no member named 'vlv_work'
drivers/gpu/drm/i915/intel_pm.c:5883:34: error: 'struct intel_gen6_power_mgmt' has no member named 'vlv_work'
drivers/gpu/drm/i915/intel_pm.c:5883:34: error: 'struct intel_gen6_power_mgmt' has no member named 'vlv_work'
drivers/gpu/drm/i915/intel_pm.c:5883:34: error: 'struct intel_gen6_power_mgmt' has no member named 'vlv_work'
drivers/gpu/drm/i915/intel_pm.c:5883:45: error: 'vlv_rps_timer_work' undeclared (first use in this function)
drivers/gpu/drm/i915/intel_pm.c:5883:34: error: 'struct intel_gen6_power_mgmt' has no member named 'vlv_work'
drivers/gpu/drm/i915/intel_pm.c:5883:34: error: 'struct intel_gen6_power_mgmt' has no member named 'vlv_work'
drivers/gpu/drm/i915/intel_pm.c:5883:34: error: 'struct intel_gen6_power_mgmt' has no member named 'vlv_work'
drivers/gpu/drm/i915/intel_pm.c:5883:34: error: 'struct intel_gen6_power_mgmt' has no member named 'vlv_work'

[warnings]
include/linux/acpi.h:129:19: warning: 'acpi_get_ioapic_id' used but never defined [enabled by default]
Warning(drivers/gpu/drm/drm_crtc.c:1120): No description found for parameter 'state'
drivers/gpu/drm/gma500/mdfld_dsi_output.c:413:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/gpu/drm/gma500/mdfld_dsi_output.c:413:2: warning: (near initialization for 'mdfld_dsi_connector_funcs.set_property') [enabled by default]
WARNING: vmlinux.o(.text+0x701f4): Section mismatch in reference from the function __mp_register_ioapic() to the function .init.text:io_apic_unique_id()
arch/x86/kvm/../../../virt/kvm/vfio.c:110:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
arch/x86/kvm/../../../virt/kvm/vfio.c:110:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
arch/x86/kvm/../../../virt/kvm/vfio.c:110:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
arch/x86/kvm/../../../virt/kvm/vfio.c:110:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
arch/x86/kvm/../../../virt/kvm/vfio.c:150:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
arch/x86/kvm/../../../virt/kvm/vfio.c:150:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
arch/x86/kvm/../../../virt/kvm/vfio.c:150:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
arch/x86/kvm/../../../virt/kvm/vfio.c:150:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
fs/fs-writeback.c:1012:2: warning: format '%s' expects type 'char *', but argument 2 has type 'int'
fs/fs-writeback.c:1012:2: warning: format '%s' expects argument of type 'char *', but argument 2 has type 'int' [-Wformat]
net/l2tp/l2tp_core.c:499:22: warning: unused variable 'tunnel' [-Wunused-variable]
include/linux/log2.h:34:2: warning: implicit declaration of function 'fls' [-Wimplicit-function-declaration]
include/linux/log2.h:42:2: warning: implicit declaration of function 'fls64' [-Wimplicit-function-declaration]
include/linux/log2.h:63:2: warning: implicit declaration of function 'fls_long' [-Wimplicit-function-declaration]
include/linux/kernel.h:41:0: warning: "ARRAY_SIZE" redefined [enabled by default]
include/linux/bug.h:73:0: warning: "BUILD_BUG_ON" redefined [enabled by default]
include/linux/bitmap.h:164:3: warning: implicit declaration of function 'BITS_TO_LONGS' [-Wimplicit-function-declaration]
include/linux/bitmap.h:279:3: warning: implicit declaration of function 'hweight_long' [-Wimplicit-function-declaration]
include/linux/cpumask.h:160:2: warning: implicit declaration of function 'find_first_bit' [-Wimplicit-function-declaration]
include/linux/cpumask.h:175:2: warning: implicit declaration of function 'find_next_bit' [-Wimplicit-function-declaration]
include/linux/cpumask.h:190:2: warning: implicit declaration of function 'find_next_zero_bit' [-Wimplicit-function-declaration]
include/linux/cpumask.h:267:2: warning: implicit declaration of function 'clear_bit' [-Wimplicit-function-declaration]
include/linux/cpumask.h:293:2: warning: implicit declaration of function 'test_and_set_bit' [-Wimplicit-function-declaration]
include/linux/cpumask.h:307:2: warning: implicit declaration of function 'test_and_clear_bit' [-Wimplicit-function-declaration]
include/linux/cpumask.h:862:2: warning: passing argument 2 of 'set_bit' discards 'volatile' qualifier from pointer target type [enabled by default]
arch/x86/include/asm/processor.h:797:2: warning: implicit declaration of function 'alternative_input' [-Wimplicit-function-declaration]
arch/x86/include/asm/bitops.h:108:1: warning: conflicting types for 'clear_bit' [enabled by default]
arch/x86/include/asm/bitops.h:353:0: warning: "test_bit" redefined [enabled by default]
arch/x86/include/asm/spinlock.h:238:8: warning: left shift count >= width of type [enabled by default]
arch/x86/include/asm/spinlock.h:271:8: warning: left shift count >= width of type [enabled by default]

[sparse]
drivers/pci/ioapic.c:194:6: sparse: symbol 'acpi_pci_ioapic_add' was not declared. Should it be static?
drivers/pci/ioapic.c:206:6: sparse: symbol 'acpi_pci_ioapic_remove' was not declared. Should it be static?
drivers/gpu/drm/i915/intel_pm.c:5883:9: sparse: no member 'vlv_work' in struct intel_gen6_power_mgmt
drivers/media/pci/cx23885/cx23885-cards.c:459:36: sparse: Initializer entry defined twice

[coccinelle]
drivers/staging/rtl8188eu/os_dep/osdep_service.c:54:2-17: code aligned with following code on line 55

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
