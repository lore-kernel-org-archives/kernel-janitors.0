From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 25 Sep 2013 17:31:45 +0000
Subject: build regressions 2013-09-25
Message-Id: <52431e01.z+fZFsmjqLni+w2p%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/usb/serial/mxuport.c:1106:7: error: 'TIOCSRS485' undeclared (first use in this function)
drivers/usb/serial/mxuport.c:1112:7: error: 'TIOCGRS485' undeclared (first use in this function)
security/keys/persistent.c:147: error: invalid operands to binary !security/keys/persistent.c:148: error: invalid operands to binary !security/keys/persistent.c:149: error: invalid operands to binary !security/keys/persistent.c:150: error: invalid operands to binary !include/linux/acpi.h:613:19: error: static declaration of 'acpi_gsi_to_irq' follows non-static declaration
arch/x86/lguest/boot.c:1420:2: error: 'acpi_disabled' undeclared (first use in this function)
arch/x86/kernel/early-quirks.c:83:6: error: 'acpi_use_timer_override' undeclared (first use in this function)
arch/x86/kernel/early-quirks.c:87:3: error: 'acpi_skip_timer_override' undeclared (first use in this function)
arch/x86/kernel/early-quirks.c:124:6: error: 'acpi_use_timer_override' undeclared (first use in this function)
arch/x86/kernel/early-quirks.c:129:3: error: 'acpi_skip_timer_override' undeclared (first use in this function)
arch/x86/kernel/early-quirks.c:161:3: error: 'acpi_fix_pin2_polarity' undeclared (first use in this function)
arch/x86/kernel/early-quirks.c:171:6: error: 'acpi_use_timer_override' undeclared (first use in this function)
arch/x86/kernel/early-quirks.c:177:3: error: 'acpi_skip_timer_override' undeclared (first use in this function)
include/acpi/platform/aclinux.h:238:2: error: implicit declaration of function 'kmalloc' [-Werror=implicit-function-declaration]
include/acpi/platform/aclinux.h:238:41: error: 'GFP_ATOMIC' undeclared (first use in this function)
include/acpi/platform/aclinux.h:238:54: error: 'GFP_KERNEL' undeclared (first use in this function)
include/acpi/platform/aclinux.h:243:2: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
include/acpi/platform/aclinux.h:243:41: error: 'GFP_ATOMIC' undeclared (first use in this function)
include/acpi/platform/aclinux.h:243:54: error: 'GFP_KERNEL' undeclared (first use in this function)
include/acpi/platform/aclinux.h:248:2: error: implicit declaration of function 'kmem_cache_zalloc' [-Werror=implicit-function-declaration]
include/acpi/platform/aclinux.h:249:21: error: 'GFP_ATOMIC' undeclared (first use in this function)
include/acpi/platform/aclinux.h:249:34: error: 'GFP_KERNEL' undeclared (first use in this function)
include/acpi/platform/aclinux.h:254:2: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
arch/x86/include/asm/smp.h:93:20: error: static declaration of 'smp_send_stop' follows non-static declaration
arch/x86/include/asm/smp.h:103:20: error: static declaration of 'smp_prepare_boot_cpu' follows non-static declaration
arch/x86/include/asm/smp.h:108:20: error: static declaration of 'smp_prepare_cpus' follows non-static declaration
arch/x86/include/asm/smp.h:113:20: error: static declaration of 'smp_cpus_done' follows non-static declaration
arch/x86/include/asm/smp.h:118:19: error: static declaration of '__cpu_up' follows non-static declaration
arch/x86/include/asm/smp.h:138:20: error: static declaration of 'smp_send_reschedule' follows non-static declaration
include/linux/slub_def.h:158:30: error: conflicting types for 'kmalloc'
include/linux/slab.h:534:21: error: conflicting types for 'kmem_cache_zalloc'
include/linux/slab.h:544:21: error: conflicting types for 'kzalloc'
arch/x86/kernel/apic/io_apic.c:2051:6: error: 'acpi_ioapic' undeclared (first use in this function)
drivers/platform/x86/pvpanic.c:61:2: error: implicit declaration of function 'outb' [-Werror=implicit-function-declaration]
include/linux/slob_def.h:21:30: error: conflicting types for 'kmalloc'
arch/x86/platform/efi/efi-bgrt.c:52:3: error: implicit declaration of function 'ioremap' [-Werror=implicit-function-declaration]
arch/x86/platform/efi/efi-bgrt.c:58:2: error: implicit declaration of function 'memcpy_fromio' [-Werror=implicit-function-declaration]
arch/x86/platform/efi/efi-bgrt.c:60:3: error: implicit declaration of function 'iounmap' [-Werror=implicit-function-declaration]
crypto/built-in.o:(.data+0x2740): undefined reference to `RSA_public_key_algorithm'
include/linux/acpi.h:97:1: error: expected ';' before '}' token
security/keys/persistent.c:147:11: error: invalid operands to binary != (have 'kuid_t' and 'kuid_t')
security/keys/persistent.c:148:11: error: invalid operands to binary != (have 'kuid_t' and 'kuid_t')
security/keys/persistent.c:149:11: error: invalid operands to binary != (have 'kuid_t' and 'kuid_t')
security/keys/persistent.c:150:11: error: invalid operands to binary != (have 'kuid_t' and 'kuid_t')
kernel/user_namespace.c:105:2: error: implicit declaration of function 'rwsem_init' [-Werror=implicit-function-declaration]
include/acpi/platform/aclinux.h:82:31: error: expected ',' or ';' before '{' token
include/acpi/platform/aclinux.h:82:31: error: expected ',' or ';' before '{' token
include/acpi/platform/aclinux.h:82:31: error: expected ',' or ';' before '{' token
include/acpi/platform/aclinux.h:82:31: error: expected ',' or ';' before '{' token
include/acpi/platform/aclinux.h:82:31: error: expected ',' or ';' before '{' token
include/acpi/platform/aclinux.h:82:31: error: expected ',' or ';' before '{' token
arch/x86/kernel/irqinit.c:212:7: error: 'acpi_ioapic' undeclared (first use in this function)
arch/x86/kernel/smpboot.c:1005:28: error: 'acpi_lapic' undeclared (first use in this function)
arch/x86/kernel/apic/apic.c:1808:8: error: 'acpi_lapic' undeclared (first use in this function)
arch/x86/kernel/mpparse.c:214:7: error: 'acpi_lapic' undeclared (first use in this function)
arch/x86/kernel/mpparse.c:509:6: error: 'acpi_lapic' undeclared (first use in this function)
arch/x86/kernel/mpparse.c:516:20: error: 'acpi_ioapic' undeclared (first use in this function)
arch/x86/pci/common.c:557:3: error: implicit declaration of function 'acpi_noirq_set' [-Werror=implicit-function-declaration]

[warnings]
arch/arm/mach-imx/time.c:126:2: warning: 'setup_sched_clock' is deprecated (declared at include/linux/sched_clock.h:18) [-Wdeprecated-declarations]
arch/arm/plat-omap/counter_32k.c:118:2: warning: 'setup_sched_clock' is deprecated (declared at include/linux/sched_clock.h:18) [-Wdeprecated-declarations]
arch/arm/mach-omap2/timer.c:464:2: warning: 'setup_sched_clock' is deprecated (declared at include/linux/sched_clock.h:18) [-Wdeprecated-declarations]
include/linux/slab.h:132:6: warning: conflicting types for 'kfree' [enabled by default]
arch/x86/platform/efi/efi-bgrt.c:52:9: warning: assignment makes pointer from integer without a cast [enabled by default]
arch/x86/platform/efi/efi-bgrt.c:68:9: warning: assignment makes pointer from integer without a cast [enabled by default]
sound/soc/codecs/tlv320aic23.c:562:16: warning: unused variable 'aic23' [-Wunused-variable]
drivers/usb/serial/mxuport.c:809:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
fs/nfs/fscache.c:263:21: warning: unused variable 'nfsi' [-Wunused-variable]
fs/nfs/fscache.c:286:20: warning: unused variable 'nfsi' [-Wunused-variable]
arch/xtensa/kernel/time.c:144:2: warning: 'setup_sched_clock' is deprecated (declared at include/linux/sched_clock.h:18) [-Wdeprecated-declarations]

[sparse]
drivers/gpu/drm/i915/i915_gem.c:3162:1: sparse: symbol 'i915_gem_object_bind_to_vm' was not declared. Should it be static?

[coccinelle]
sound/soc/codecs/max98095.c:466:9-10: WARNING: return of 0/1 in function 'max98095_readable' with return type bool
sound/soc/codecs/max98095.c:473:9-10: WARNING: return of 0/1 in function 'max98095_volatile' with return type bool
sound/soc/codecs/max9850.c:55:9-10: WARNING: return of 0/1 in function 'max9850_volatile_register' with return type bool

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
