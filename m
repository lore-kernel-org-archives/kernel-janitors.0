From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 29 Jan 2013 17:05:52 +0000
Subject: build regressions 2013-01-29
Message-Id: <51080170.BdW/z7Yyc15ODAiZ%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
pl320-ipc.c:(.init.text+0x7df09): undefined reference to `amba_driver_register'
8250.c:(.text+0xf484): undefined reference to `dma_sync_sg_for_cpu'
8250.c:(.text+0xf504): undefined reference to `dma_sync_single_for_cpu'
8250.c:(.text+0xf67c): undefined reference to `dma_sync_sg_for_cpu'
8250.c:(.text+0xf6f8): undefined reference to `dma_sync_single_for_cpu'
8250.c:(.text+0x10520): undefined reference to `dma_free_coherent'
8250.c:(.text+0x10578): undefined reference to `dma_unmap_single'
/c/kernel-tests/src/linux/include/asm-generic/pgtable.h:466:9: error: implicit declaration of function 'page_to_section' [-Werror=implicit-function-declaration]
/c/kernel-tests/src/linux/include/linux/mm.h:737:29: error: conflicting types for 'page_to_section'
/c/kernel-tests/src/tip/include/asm-generic/pgtable.h:466:9: error: implicit declaration of function 'page_to_section' [-Werror=implicit-function-declaration]
/c/kernel-tests/src/tip/include/linux/mm.h:737:29: error: conflicting types for 'page_to_section'
core.c:(.text+0x7b420): undefined reference to `rtit_trace_sampler_fini'
(.text+0x7e8a4): undefined reference to `rtit_trace_sampler_output'
(.text+0x7eb40): undefined reference to `rtit_trace_sampler_trace'
core.c:(.text+0x801f8): undefined reference to `rtit_trace_sampler_init'
drivers/pwm/pwm-lpio.c:140:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'pwm_lpio_add'
drivers/pwm/pwm-lpio.c:171:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'pwm_lpio_remove'
drivers/pwm/pwm-lpio.c:191:10: error: 'pwm_lpio_add' undeclared here (not in a function)
drivers/pwm/pwm-lpio.c:192:13: error: 'pwm_lpio_remove' undeclared here (not in a function)
drivers/spi/spi-pxa2xx-pci.c:51:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'pxa2xx_spi_pci_probe'
drivers/spi/spi-pxa2xx-pci.c:97:23: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'pxa2xx_spi_pci_remove'
drivers/spi/spi-pxa2xx-pci.c:122:20: error: 'pxa2xx_spi_pci_probe' undeclared here (not in a function)
drivers/spi/spi-pxa2xx-pci.c:123:2: error: implicit declaration of function '__devexit_p' [-Werror=implicit-function-declaration]
drivers/spi/spi-pxa2xx-pci.c:123:32: error: 'pxa2xx_spi_pci_remove' undeclared here (not in a function)
drivers/spi/spi-pxa2xx-acpi.c:67:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'pxa2xx_spi_acpi_add'
drivers/spi/spi-pxa2xx-acpi.c:114:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'pxa2xx_spi_acpi_remove'
drivers/spi/spi-pxa2xx-acpi.c:133:10: error: 'pxa2xx_spi_acpi_add' undeclared here (not in a function)
drivers/spi/spi-pxa2xx-acpi.c:134:13: error: 'pxa2xx_spi_acpi_remove' undeclared here (not in a function)
drivers/net/wireless/rt2x00/rt2800lib.c:5094:6: error: 'IEEE80211_HW_TEARDOWN_AGGR_ON_BAR_FAIL' undeclared (first use in this function)
arch/x86/kernel/cpu/rtit2-emu.c:455:2: error: implicit declaration of function 'apic_write' [-Werror=implicit-function-declaration]
arch/x86/kernel/cpu/perf_event_intel_rtit.c:261:2: error: implicit declaration of function 'virt_to_phys' [-Werror=implicit-function-declaration]
arch/x86/kernel/cpu/perf_event_intel_rtit.c:339:2: error: implicit declaration of function 'page_to_phys' [-Werror=implicit-function-declaration]
arch/x86/kernel/cpu/perf_event_intel_rtit.c:353:2: error: implicit declaration of function 'phys_to_virt' [-Werror=implicit-function-declaration]
(.text+0x1cafe): undefined reference to `fake_msr_table_len'
(.text+0x1cb11): undefined reference to `fake_msr_table'
(.text+0x1cb21): undefined reference to `fake_msr_table'

[warnings]
arch/x86/kernel/cpu/rtit2-emu.c:142:2: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'phys_addr_t' [-Wformat]
arch/x86/kernel/cpu/rtit2-emu.c:142:2: warning: format '%ld' expects argument of type 'long int', but argument 6 has type 'size_t' [-Wformat]
arch/x86/kernel/cpu/rtit2-emu.c:171:2: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
arch/x86/kernel/cpu/rtit2-emu.c:171:2: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
arch/x86/kernel/cpu/rtit2-emu.c:489:2: warning: left shift count >= width of type [enabled by default]
arch/x86/kernel/cpu/rtit2-emu.c:721:2: warning: left shift count >= width of type [enabled by default]
arch/x86/kernel/cpu/rtit2-emu.c:743:2: warning: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'size_t' [-Wformat]
arch/x86/kernel/cpu/perf_event_intel_rtit.c:269:2: warning: left shift count >= width of type [enabled by default]
arch/x86/kernel/cpu/perf_event_intel_rtit.c:451:3: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
arch/x86/kernel/cpu/perf_event_intel_rtit.c:451:3: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' [-Wformat]
WARNING: drivers/mailbox/built-in.o(.data+0xf4): Section mismatch in reference from the variable pl320_driver to the function .init.text:pl320_probe()
drivers/net/can/grcan.c:1441:16: warning: 'txstatus' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/x86/mm/extable.c:46:6: warning: unused variable 'cpu' [-Wunused-variable]
arch/x86/kernel/cpu/rtit2-emu.c:306:11: warning: 'off' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/spi/spi-pxa2xx-pci.c:26:37: warning: 'pxa2xx_spi_pci_configs' defined but not used [-Wunused-variable]
drivers/tty/serial/8250/8250_pci.c:1087:2: warning: passing argument 3 of 'pci_default_setup' from incompatible pointer type [enabled by default]
drivers/tty/serial/8250/8250_pci.c:1416:3: warning: initialization from incompatible pointer type [enabled by default]
drivers/tty/serial/8250/8250_pci.c:1416:3: warning: (near initialization for 'pci_serial_quirks[8].setup') [enabled by default]
drivers/tty/serial/8250/8250_pci.c:1423:3: warning: initialization from incompatible pointer type [enabled by default]
drivers/tty/serial/8250/8250_pci.c:1423:3: warning: (near initialization for 'pci_serial_quirks[9].setup') [enabled by default]
drivers/tty/serial/8250/8250_pci.c:1430:3: warning: initialization from incompatible pointer type [enabled by default]
drivers/tty/serial/8250/8250_pci.c:1430:3: warning: (near initialization for 'pci_serial_quirks[10].setup') [enabled by default]
arch/x86/kernel/cpu/perf_event_intel_rtit.c:353:15: warning: initialization makes pointer from integer without a cast [enabled by default]

[sparse]
drivers/mfd/da9052-i2c.c:63:5: sparse: symbol 'da9052_i2c_fix' was not declared. Should it be static?

[cppcheck]
arch/powerpc/include/asm/hw_irq.h:138: style: Statements following return, break, continue, goto or throw will never be executed.
arch/powerpc/include/asm/oprofile_impl.h:76: style: Statements following return, break, continue, goto or throw will never be executed.
arch/powerpc/include/asm/oprofile_impl.h:78: style: Statements following return, break, continue, goto or throw will never be executed.
arch/powerpc/include/asm/oprofile_impl.h:80: style: Statements following return, break, continue, goto or throw will never be executed.
arch/powerpc/include/asm/oprofile_impl.h:82: style: Statements following return, break, continue, goto or throw will never be executed.
arch/powerpc/include/asm/oprofile_impl.h:84: style: Statements following return, break, continue, goto or throw will never be executed.
arch/powerpc/include/asm/oprofile_impl.h:86: style: Statements following return, break, continue, goto or throw will never be executed.
arch/powerpc/oprofile/op_model_power4.c:286: style: The scope of the variable 'slot' can be reduced
include/asm-generic/cmpxchg-local.h:24: warning: Redundant code: Found a statement that begins with numeric constant
include/asm-generic/cmpxchg-local.h:45: warning: Redundant code: Found a statement that begins with numeric constant
include/asm-generic/cmpxchg-local.h:58: warning: Redundant code: Found a statement that begins with numeric constant
include/asm-generic/cmpxchg-local.h:62: warning: Redundant code: Found a statement that begins with numeric constant
include/asm-generic/cmpxchg-local.h:24: error: Uninitialized variable: __dummy
include/asm-generic/cmpxchg-local.h:45: error: Uninitialized variable: __dummy
include/asm-generic/cmpxchg-local.h:58: error: Uninitialized variable: __dummy
include/asm-generic/cmpxchg-local.h:62: error: Uninitialized variable: __dummy

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
