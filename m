From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 18 Dec 2012 20:11:35 +0000
Subject: build regressions 2012-12-18
Message-Id: <50d0cdf7.IA9JNESLuUFCGPYO%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
scripts/checksyscalls.sh: line 1: map_hwmod_class_sysconfig: command not found
scripts/checksyscalls.sh: line 2: .sysc_offs: command not found
scripts/gcc-version.sh: line 1: =: command not found
/bin/bash: line 0: [: -lt: unary operator expected
scripts/gcc-x86_32-has-stack-protector.sh: line 1: _i2c2: command not found
scripts/gcc-x86_32-has-stack-protector.sh: line 2: .master: command not found
scripts/gcc-x86_32-has-stack-protector.sh: line 2: omap44xx_l4_per_hwmod,: command not found
scripts/gcc-x86_32-has-stack-protector.sh: line 3: .slave: command not found
scripts/gcc-x86_32-has-stack-protector.sh: line 3: omap44xx_i2c2_hwmod,: command not found
scripts/gcc-x86_32-has-stack-protector.sh: line 4: .clk: command not found
scripts/gcc-x86_32-has-stack-protector.sh: line 5: .addr: command not found
scripts/gcc-x86_32-has-stack-protector.sh: line 6: OCP_USER_SDMA,: command not found
scripts/gcc-x86_32-has-stack-protector.sh: line 6: .user: command not found
drivers/net/can/sja1000/sja1000_of_platform.c:126:13: error: 'NO_IRQ' undeclared (first use in this function)
arch/x86/xen/smp.c:257:2: error: implicit declaration of function 'smp_store_boot_cpu_info' [-Werror=implicit-function-declaration]

[warnings]
net/sunrpc/svcsock.c:1075:3: warning: format '%d' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat]
drivers/regulator/tps80031-regulator.c:653:33: warning: 'smps_mult' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/regulator/tps80031-regulator.c:652:34: warning: 'smps_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/scsi/csiostor/csio_hw.c:2268:2: warning: 'cfcsum' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/scsi/csiostor/csio_hw.c:2239:3: warning: 'finicsum' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/scsi/csiostor/csio_hw.c:2268:2: warning: 'finiver' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
drivers/char/random.c:745:8: sparse: symbol 'irq_randomness' was not declared. Should it be static?
kernel/lockdep.c:153:8: sparse: symbol 'cpu_lock_stats' was not declared. Should it be static?
kernel/lockdep.c:1231:15: sparse: symbol '__lockdep_count_forward_deps' was not declared. Should it be static?
kernel/lockdep.c:1257:15: sparse: symbol '__lockdep_count_backward_deps' was not declared. Should it be static?
kernel/lockdep.c:4160:11: sparse: context imbalance in 'debug_show_all_locks' - different lock contexts for basic block
kernel/timer.c:91:8: sparse: symbol 'tvec_bases' was not declared. Should it be static?
kernel/workqueue.c:466:8: sparse: symbol 'global_cwq' was not declared. Should it be static?
kernel/workqueue.c:467:8: sparse: symbol 'pool_nr_running' was not declared. Should it be static?
kernel/workqueue.c:500:54: sparse: incorrect type in return expression (different modifiers)
kernel/workqueue.c:3515:22: sparse: context imbalance in 'gcwq_claim_assoc_and_lock' - wrong count at exit
kernel/workqueue.c:3519:13: sparse: context imbalance in 'gcwq_release_assoc_and_unlock' - unexpected unlock
include/trace/events/rcu.h:486:1: sparse: expression using sizeof bool
arch/x86/kvm/mmu.c:352:18: sparse: cast to non-scalar
kernel/trace/trace_entries.h:216:1: sparse: symbol 'ftrace_define_fields_bprint' was not declared. Should it be static?
kernel/trace/trace_entries.h:232:1: sparse: symbol 'ftrace_define_fields_print' was not declared. Should it be static?
kernel/trace/trace_entries.h:247:1: sparse: symbol 'ftrace_define_fields_mmiotrace_rw' was not declared. Should it be static?
kernel/trace/trace_entries.h:268:1: sparse: symbol 'ftrace_define_fields_mmiotrace_map' was not declared. Should it be static?
kernel/trace/trace_entries.h:292:1: sparse: symbol 'ftrace_define_fields_branch' was not declared. Should it be static?
kernel/trace/trace_entries.h:58:1: sparse: symbol 'event_class_ftrace_function' was not declared. Should it be static?
kernel/trace/trace_entries.h:58:1: sparse: symbol '__event_function' was not declared. Should it be static?
kernel/trace/trace_entries.h:75:1: sparse: symbol 'event_class_ftrace_funcgraph_entry' was not declared. Should it be static?
kernel/trace/trace_entries.h:75:1: sparse: symbol '__event_funcgraph_entry' was not declared. Should it be static?
kernel/trace/trace_entries.h:91:1: sparse: symbol 'event_class_ftrace_funcgraph_exit' was not declared. Should it be static?
kernel/trace/trace_entries.h:91:1: sparse: symbol '__event_funcgraph_exit' was not declared. Should it be static?
kernel/trace/trace_entries.h:127:1: sparse: symbol 'event_class_ftrace_context_switch' was not declared. Should it be static?
kernel/trace/trace_entries.h:127:1: sparse: symbol '__event_context_switch' was not declared. Should it be static?
kernel/trace/trace_entries.h:147:1: sparse: symbol 'event_class_ftrace_wakeup' was not declared. Should it be static?
kernel/trace/trace_entries.h:147:1: sparse: symbol '__event_wakeup' was not declared. Should it be static?
kernel/trace/trace_entries.h:175:1: sparse: symbol 'event_class_ftrace_kernel_stack' was not declared. Should it be static?
kernel/trace/trace_entries.h:175:1: sparse: symbol '__event_kernel_stack' was not declared. Should it be static?
kernel/trace/trace_entries.h:194:1: sparse: symbol 'event_class_ftrace_user_stack' was not declared. Should it be static?
kernel/trace/trace_entries.h:194:1: sparse: symbol '__event_user_stack' was not declared. Should it be static?
kernel/trace/trace_entries.h:216:1: sparse: symbol 'event_class_ftrace_bprint' was not declared. Should it be static?
kernel/trace/trace_entries.h:216:1: sparse: symbol '__event_bprint' was not declared. Should it be static?
kernel/trace/trace_entries.h:232:1: sparse: symbol 'event_class_ftrace_print' was not declared. Should it be static?
kernel/trace/trace_entries.h:232:1: sparse: symbol '__event_print' was not declared. Should it be static?
kernel/trace/trace_entries.h:247:1: sparse: symbol 'event_class_ftrace_mmiotrace_rw' was not declared. Should it be static?
kernel/trace/trace_entries.h:247:1: sparse: symbol '__event_mmiotrace_rw' was not declared. Should it be static?
kernel/trace/trace_entries.h:268:1: sparse: symbol 'event_class_ftrace_mmiotrace_map' was not declared. Should it be static?
kernel/trace/trace_entries.h:268:1: sparse: symbol '__event_mmiotrace_map' was not declared. Should it be static?
kernel/trace/trace_entries.h:292:1: sparse: symbol 'event_class_ftrace_branch' was not declared. Should it be static?
kernel/trace/trace_entries.h:292:1: sparse: symbol '__event_branch' was not declared. Should it be static?
kernel/lockdep.c:2557:6: sparse: symbol 'trace_hardirqs_on_caller' was not declared. Should it be static?
kernel/lockdep.c:2610:6: sparse: symbol 'trace_hardirqs_off_caller' was not declared. Should it be static?

[smatch]
sound/pci/hda/patch_ca0132.c:714 dspio_send() warn: always true condition '(res >= 0) => (0-u32max >= 0)'
drivers/staging/bcm/CmHost.c:1231 DumpCmControlPacket() debug: remove_pools: nr_children over 4000 (5594). (psfCSType 4096-s64max,4096-(-1),4096-s64max,4096-s64max,4096-s64max,4096-s64max,4096-s64max,4096-s64max,4096-s64max,4096-(-1),4096-s64max,4096-(-1),4096-s64max,4096-s64max,4096-s64max,4096-s64max,4096-s64max,4096-s64max,4096-s64max,4096-s64max,4096-s64max,4096-s64)
drivers/media/usb/sn9c102/sn9c102_hv7131d.c:57 hv7131d_get_ctrl() info: why not propagate 'ctrl->value' from sn9c102_i2c_read() instead of (-5)?
drivers/staging/bcm/CmHost.c:1189 DumpCmControlPacket() debug: remove_pools: nr_children over 4000 (9388). (pvBuffer 4096-s64max)
drivers/staging/bcm/CmHost.c:1207 DumpCmControlPacket() debug: remove_pools: nr_children over 4000 (25204). (Adapter->stDebugState.subtype s32min-s32max)

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
