From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 26 Dec 2012 16:01:48 +0000
Subject: build regressions 2012-12-26
Message-Id: <50db1f6c.VlgdZSskahDHMGF1%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
kernel/sched/core.c:2010:3: error: invalid use of undefined type 'struct task_group'
(.text+0x22004): undefined reference to `sys32_exit'
(.text+0x222f0): undefined reference to `sys32_exit_group'
arch/sparc/kernel/sys_sparc32.c:255:1: error: conflicting types for 'C_SYSC_rt_sigaction'
arch/sparc/kernel/sys_sparc32.c:269:9: error: dereferencing pointer to incomplete type
drivers/platform/x86/asus-wmi.c:1421:12: error: invalid storage class for function 'parse_arg'
drivers/platform/x86/asus-wmi.c:1430:16: error: invalid storage class for function 'store_sys_wmi'
drivers/platform/x86/asus-wmi.c:1449:16: error: invalid storage class for function 'show_sys_wmi'
drivers/platform/x86/asus-wmi.c:1484:1: error: invalid storage class for function 'show_touchpad'
drivers/platform/x86/asus-wmi.c:1484:1: error: invalid storage class for function 'store_touchpad'
drivers/platform/x86/asus-wmi.c:1484:1: error: initializer element is not constant
drivers/platform/x86/asus-wmi.c:1485:1: error: invalid storage class for function 'show_camera'
drivers/platform/x86/asus-wmi.c:1485:1: error: invalid storage class for function 'store_camera'
drivers/platform/x86/asus-wmi.c:1486:1: error: invalid storage class for function 'show_cardr'
drivers/platform/x86/asus-wmi.c:1486:1: error: invalid storage class for function 'store_cardr'
kernel/signal.c:3370:1: error: conflicting types for 'compat_sys_rt_sigaction'
kernel/signal.c:3385:9: error: dereferencing pointer to incomplete type
kernel/sched/fair.c:727:28: error: 'struct sched_entity' has no member named 'cfs_rq'
kernel/sched/core.c:2010:25: error: 'struct task_group' has no member named 'cfs_rq'

[warnings]
drivers/platform/x86/msi-laptop.c:478:27: warning: 'quirk_load_scm_ro_model' defined but not used [-Wunused-variable]
drivers/platform/x86/asus-wmi.c:1421:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
include/linux/compat.h:625:6: warning: 'struct compat_sigaction' declared inside parameter list [enabled by default]
include/linux/compat.h:625:6: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
kernel/signal.c:3370:1: warning: 'struct compat_sigaction' declared inside parameter list [enabled by default]

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
