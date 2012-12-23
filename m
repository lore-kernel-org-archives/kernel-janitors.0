From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 23 Dec 2012 16:28:38 +0000
Subject: build regressions 2012-12-23
Message-Id: <50d73136.DrSunUTSnwsSlKU0%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
(.data+0x3ec): undefined reference to `sys_sigaltstack'
arch/m32r/kernel/signal.c:214:34: error: 'struct sigaction' has no member named 'sa_restorer'
arch/mips/include/asm/compat.h:302:2: error: unknown type name 'compat_sigset_t'
include/uapi/asm-generic/unistd.h:399:1: error: 'sys_sigaltstack' undeclared here (not in a function)
arch/powerpc/kernel/ppc32.h:72:2: error: unknown type name 'compat_stack_t'
arch/powerpc/kernel/signal_32.c:795:6: error: implicit declaration of function '__compat_save_altstack' [-Werror=implicit-function-declaration]
arch/powerpc/kernel/signal_32.c:997:2: error: implicit declaration of function 'compat_restore_altstack' [-Werror=implicit-function-declaration]
arch/powerpc/perf/../kernel/ppc32.h:63:2: error: unknown type name 'compat_stack_t'
(.text+0x7e78): undefined reference to `.compat_sys_sched_rr_get_interval_wrapper'
machine_kexec.c:(.rodata+0x2a68): undefined reference to `compat_sys_sigaction'
arch/sparc/kernel/signal32.c:64:2: error: unknown type name 'compat_stack_t'
arch/sparc/kernel/signal32.c:296:2: error: implicit declaration of function 'compat_restore_altstack' [-Werror=implicit-function-declaration]
arch/sparc/kernel/signal32.c:633:2: error: implicit declaration of function '__compat_save_altstack' [-Werror=implicit-function-declaration]
arch/sparc/kernel/sys_sparc32.c:255:1: error: conflicting types for 'compat_sys_rt_sigaction'
include/uapi/asm-generic/unistd.h:399:1: error: 'compat_sys_sigaltstack' undeclared here (not in a function)
arch/tile/kernel/compat_signal.c:47:30: error: field 'uc_stack' has incomplete type
arch/tile/kernel/compat_signal.c:211:2: error: implicit declaration of function 'compat_restore_altstack'
arch/tile/kernel/compat_signal.c:288:2: error: implicit declaration of function '__compat_save_altstack'
include/linux/signal.h:253:8: error: redefinition of 'struct k_sigaction'
include/linux/signal.h:254:8: error: redefinition of 'struct sigaction'
include/linux/signal.h:258:2: error: unknown type name '__sigrestore_t'

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
