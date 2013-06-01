From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 01 Jun 2013 01:14:35 +0000
Subject: build regressions 2013-05-31
Message-Id: <51a94afb.UNslmpP0NRUymqzG%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
microcode_amd_early.c:(.init.text+0xe1b9): undefined reference to `ucode_cpu_info'
microcode_amd_early.c:(.init.text+0xe2e1): undefined reference to `__apply_microcode_amd'
(.init.text+0xe332): undefined reference to `ucode_cpu_info'
(.init.text+0xe38c): undefined reference to `load_microcode_amd'
(.cpuinit.text+0x5a94): undefined reference to `__apply_microcode_amd'
drivers/gpio/gpio-msm-v2.c:373:2: error: implicit declaration of function 'set_irq_flags' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-msm-v2.c:373:21: error: 'IRQF_VALID' undeclared (first use in this function)
drivers/gpio/gpio-msm-v2.c:450:18: error: 'TLMM_SCSS_SUMMARY_IRQ' undeclared (first use in this function)
(.cpuinit.text+0xa666): undefined reference to `apply_microcode_amd'

[warnings]
WARNING: arch/x86/built-in.o(.text+0x21f7f): Section mismatch in reference from the function load_microcode_amd() to the variable .cpuinit.data:amd_bsp_mpb
WARNING: arch/x86/built-in.o(.cpuinit.text+0x6584): Section mismatch in reference from the function load_ucode_amd_ap() to the function .init.text:apply_ucode_in_initrd()
WARNING: arch/x86/built-in.o(.cpuinit.text+0x76ec): Section mismatch in reference from the function load_ucode_amd_ap() to the function .init.text:find_ucode_in_initrd()

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
