From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 03 Feb 2013 17:14:39 +0000
Subject: build regressions 2013-02-03
Message-Id: <510e9aff.NOmRb/uqHdP/GK0e%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/include/asm/cputype.h:130:36: error: 'ARM_CPU_XSCALE_ARCH_MASK' undeclared (first use in this function)
arch/arm/include/asm/smp_scu.h:14:37: error: 'ARM_CPU_PART_CORTEX_A9' undeclared (first use in this function)
arch/arm/kernel/perf_event_cpu.c:211:21: error: 'ARM_CPU_IMP_ARM' undeclared (first use in this function)
arch/arm/kernel/perf_event_cpu.c:213:8: error: 'ARM_CPU_PART_ARM1136' undeclared (first use in this function)
arch/arm/kernel/perf_event_cpu.c:214:8: error: 'ARM_CPU_PART_ARM1156' undeclared (first use in this function)
arch/arm/kernel/perf_event_cpu.c:215:8: error: 'ARM_CPU_PART_ARM1176' undeclared (first use in this function)
arch/arm/kernel/perf_event_cpu.c:218:8: error: 'ARM_CPU_PART_ARM11MPCORE' undeclared (first use in this function)
arch/arm/kernel/perf_event_cpu.c:221:8: error: 'ARM_CPU_PART_CORTEX_A8' undeclared (first use in this function)
arch/arm/kernel/perf_event_cpu.c:224:8: error: 'ARM_CPU_PART_CORTEX_A9' undeclared (first use in this function)
arch/arm/kernel/perf_event_cpu.c:227:8: error: 'ARM_CPU_PART_CORTEX_A5' undeclared (first use in this function)
arch/arm/kernel/perf_event_cpu.c:230:8: error: 'ARM_CPU_PART_CORTEX_A15' undeclared (first use in this function)
arch/arm/kernel/perf_event_cpu.c:233:8: error: 'ARM_CPU_PART_CORTEX_A7' undeclared (first use in this function)
arch/arm/kernel/perf_event_cpu.c:238:28: error: 'ARM_CPU_IMP_INTEL' undeclared (first use in this function)
arch/arm/kernel/perf_event_cpu.c:240:8: error: 'ARM_CPU_XSCALE_ARCH_V1' undeclared (first use in this function)
arch/arm/kernel/perf_event_cpu.c:243:8: error: 'ARM_CPU_XSCALE_ARCH_V2' undeclared (first use in this function)
drivers/i2c/busses/i2c-s3c2410.c:1048:3: error: label 'err_clk' used but not defined
/c/kernel-tests/src/tip/include/linux/kvm_host.h:333:34: error: 'KVM_USER_MEM_SLOTS' undeclared here (not in a function)
drivers/base/regmap/regmap.c:1616:3: error: 'TASK_NORMAL' undeclared (first use in this function)
drivers/base/regmap/regmap.c:1648:2: error: 'TASK_UNINTERRUPTIBLE' undeclared (first use in this function)
drivers/base/regmap/regmap.c:1648:2: error: implicit declaration of function 'schedule' [-Werror=implicit-function-declaration]
fs/bio.c:1444:32: error: 'error' undeclared (first use in this function)
include/linux/bio.h:260:2: error: implicit declaration of function 'bio_endio_batch' [-Werror=implicit-function-declaration]
include/linux/bio.h:260:2: error: implicit declaration of function 'bio_endio_batch' [-Werror=implicit-function-declaration]
include/linux/bio.h:260:2: error: implicit declaration of function 'bio_endio_batch' [-Werror=implicit-function-declaration]
include/linux/bio.h:260:2: error: implicit declaration of function 'bio_endio_batch' [-Werror=implicit-function-declaration]
make[2]: *** No rule to make target `arch/x86/include/asm/io_32.h', needed by `Documentation/DocBook/deviceiobook.xml'.
make[2]: *** No rule to make target `arch/x86/include/asm/atomic_32.h', needed by `Documentation/DocBook/kernel-api.xml'.
make[2]: *** No rule to make target `block/blk-barrier.c', needed by `Documentation/DocBook/kernel-api.xml'.
make[2]: *** No rule to make target `block/blktrace.c', needed by `Documentation/DocBook/kernel-api.xml'.
make[2]: *** No rule to make target `drivers/serial/serial_core.c', needed by `Documentation/DocBook/kernel-api.xml'.
make[2]: *** No rule to make target `drivers/serial/8250.c', needed by `Documentation/DocBook/kernel-api.xml'.
make[2]: *** No rule to make target `drivers/net/wan/syncppp.c', needed by `Documentation/DocBook/networking.xml'.
fs/bio.c:330:19: error: 'UIO_MAXIOV' undeclared (first use in this function)
fs/bio.c:686:18: error: 'UIO_MAXIOV' undeclared (first use in this function)
net/ipv6/ip6_flowlabel.c:261:2: error: 'ipv6_sk_fl_lock' undeclared (first use in this function)
arch/x86/mm/init_64.c:1021:3: error: implicit declaration of function 'get_page_bootmem' [-Werror=implicit-function-declaration]
arch/x86/mm/init_64.c:1021:48: error: 'MIX_SECTION_INFO' undeclared (first use in this function)
arch/x86/mm/init_64.c:1042:7: error: 'SECTION_INFO' undeclared (first use in this function)
arch/x86/mm/init_64.c:1323:2: error: implicit declaration of function 'remove_pagetable' [-Werror=implicit-function-declaration]

[warnings]
arch/arm/include/asm/smp_scu.h:15:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/infiniband/hw/mlx4/cm.c:365:2: warning: 'idr_pre_get' is deprecated (declared at include/linux/idr.h:144) [-Wdeprecated-declarations]
fs/nfsd/nfs4state.c:240:2: warning: 'idr_get_new_above' is deprecated (declared at include/linux/idr.h:159) [-Wdeprecated-declarations]
fs/nfsd/nfs4state.c:282:2: warning: 'idr_pre_get' is deprecated (declared at include/linux/idr.h:144) [-Wdeprecated-declarations]
drivers/staging/zcache/zcache-main.c:1702:3: warning: 'idr_pre_get' is deprecated (declared at include/linux/idr.h:144) [-Wdeprecated-declarations]
drivers/staging/zcache/zcache-main.c:1708:3: warning: 'idr_get_new' is deprecated (declared at include/linux/idr.h:174) [-Wdeprecated-declarations]
warning: (LOCKDEP && FAULT_INJECTION_STACKTRACE_FILTER && LATENCYTOP && KMEMCHECK) selects FRAME_POINTER which has unmet direct dependencies (DEBUG_KERNEL && (CRIS || M68K || FRV || UML || AVR32 || SUPERH || BLACKFIN || MN10300 || METAG) || ARCH_WANT_FRAME_POINTERS)
warning: (LOCKDEP && FAULT_INJECTION_STACKTRACE_FILTER && LATENCYTOP && KMEMCHECK) selects FRAME_POINTER which has unmet direct dependencies (DEBUG_KERNEL && (CRIS || M68K || FRV || UML || AVR32 || SUPERH || BLACKFIN || MN10300 || METAG) || ARCH_WANT_FRAME_POINTERS)
warning: (LOCKDEP && FAULT_INJECTION_STACKTRACE_FILTER && LATENCYTOP && KMEMCHECK) selects FRAME_POINTER which has unmet direct dependencies (DEBUG_KERNEL && (CRIS || M68K || FRV || UML || AVR32 || SUPERH || BLACKFIN || MN10300 || METAG) || ARCH_WANT_FRAME_POINTERS)
Warning(/kernel/signal.c:2691): No description found for parameter 'uset'
Warning(/kernel/signal.c:2691): Excess function parameter 'set' description in 'sys_rt_sigpending'
include/linux/bio.h:553:6: warning: conflicting types for 'bio_endio_batch' [enabled by default]
include/linux/bio.h:553:6: warning: conflicting types for 'bio_endio_batch' [enabled by default]
include/linux/bio.h:553:6: warning: conflicting types for 'bio_endio_batch' [enabled by default]
include/linux/bio.h:553:6: warning: conflicting types for 'bio_endio_batch' [enabled by default]
net/sunrpc/auth_gss/svcauth_gss.c:457:31: warning: 'id' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
drivers/media/dvb-frontends/mb86a20s.c:1006:24: sparse: symbol 'cnr_qpsk_table' was not declared. Should it be static?
drivers/mmc/host/android-goldfish.c:226:25: sparse: incorrect type in argument 2 (different address spaces)
drivers/mmc/host/android-goldfish.c:409:17: sparse: incorrect type in argument 1 (different address spaces)
drivers/mmc/host/android-goldfish.c:484:25: sparse: incorrect type in assignment (different address spaces)
drivers/mmc/host/android-goldfish.c:487:32: sparse: Using plain integer as NULL pointer
drivers/mmc/host/android-goldfish.c:535:9: sparse: incorrect type in argument 3 (different address spaces)
drivers/mmc/host/android-goldfish.c:555:9: sparse: incorrect type in argument 3 (different address spaces)
drivers/dma/dw_dmac.c:1494:20: sparse: incorrect type in argument 1 (different address spaces)
drivers/dma/dw_dmac.c:1495:32: sparse: incorrect type in argument 1 (different address spaces)
drivers/mfd/intel_msic.c:429:24: sparse: incorrect type in argument 1 (different address spaces)
drivers/mfd/intel_msic.c:430:36: sparse: incorrect type in argument 1 (different address spaces)
lib/idr.c:42:8: sparse: symbol 'idr_preload_head' was not declared. Should it be static?
lib/idr.c:43:8: sparse: symbol 'idr_preload_cnt' was not declared. Should it be static?
lib/idr.c:90:25: sparse: cast removes address space of expression
lib/idr.c:90:25: sparse: cast removes address space of expression
lib/idr.c:90:25: sparse: cast removes address space of expression
lib/idr.c:90:25: sparse: cast removes address space of expression
lib/idr.c:90:25: sparse: cast removes address space of expression
lib/idr.c:90:25: sparse: cast removes address space of expression
lib/idr.c:90:25: sparse: cast removes address space of expression
lib/idr.c:90:25: sparse: cast removes address space of expression
lib/idr.c:90:25: sparse: cast removes address space of expression
lib/idr.c:90:25: sparse: cast removes address space of expression
lib/idr.c:90:25: sparse: cast removes address space of expression
lib/idr.c:90:25: sparse: cast removes address space of expression
drivers/misc/sgi-xp/xpnet.c:141:15: sparse: symbol 'xpnet' was not declared. Should it be static?
arch/x86/include/asm/insn.h:65:23: sparse: Expected } at end of struct-union-enum-specifier
arch/x86/include/asm/insn.h:65:23: sparse: got 1
arch/x86/include/asm/insn.h:69:1: sparse: Expected ; at the end of type declaration
arch/x86/include/asm/insn.h:99:65: sparse: Expected ) in function declarator
arch/x86/ia32/syscall_ia32.c:18:22: sparse: symbol 'ia32_sys_call_table' was not declared. Should it be static?
arch/x86/ia32/syscall_ia32.c:23:10: sparse: Initializer entry defined twice
arch/x86/kernel/signal.c:846:17: sparse: symbol 'sys32_x32_rt_sigreturn' was not declared. Should it be static?
arch/x86/kernel/syscall_64.c:26:22: sparse: symbol 'sys_call_table' was not declared. Should it be static?
arch/x86/kernel/syscall_64.c:31:10: sparse: Initializer entry defined twice
arch/x86/kernel/process.c:42:8: sparse: symbol 'is_idle' was not declared. Should it be static?
arch/x86/mm/init_64.c:899:15: sparse: symbol 'memory_block_size_bytes' was not declared. Should it be static?
kernel/compat.c:357:17: sparse: symbol 'compat_sys_sigpending' was not declared. Should it be static?
kernel/compat.c:384:17: sparse: symbol 'compat_sys_sigprocmask' was not declared. Should it be static?
kernel/compat.c:446:17: sparse: symbol 'compat_sys_old_getrlimit' was not declared. Should it be static?
mm/memory_hotplug.c:48:1: sparse: symbol 'mem_hotplug_mutex' was not declared. Should it be static?
fs/compat.c:57:5: sparse: symbol 'compat_log' was not declared. Should it be static?
fs/compat.c:1165:1: sparse: symbol 'compat_sys_preadv64' was not declared. Should it be static?
fs/compat.c:1231:1: sparse: symbol 'compat_sys_pwritev64' was not declared. Should it be static?
kernel/trace/trace_functions_graph.c:185:15: sparse: symbol 'ftrace_return_to_handler' was not declared. Should it be static?
arch/x86/power/cpu.c:35:22: sparse: symbol 'saved_context' was not declared. Should it be static?
arch/x86/power/hibernate_64.c:30:15: sparse: symbol 'restore_jump_address' was not declared. Should it be static?
arch/x86/power/hibernate_64.c:36:15: sparse: symbol 'restore_cr3' was not declared. Should it be static?
arch/x86/power/hibernate_64.c:38:7: sparse: symbol 'temp_level4_pgt' was not declared. Should it be static?
arch/x86/power/hibernate_64.c:40:6: sparse: symbol 'relocated_restore_code' was not declared. Should it be static?
arch/x86/power/hibernate_64.c:105:5: sparse: symbol 'swsusp_arch_resume' was not declared. Should it be static?
arch/x86/power/hibernate_64.c:127:5: sparse: symbol 'pfn_is_nosave' was not declared. Should it be static?
arch/x86/kernel/apic/apic.c:2149:6: sparse: symbol 'default_init_apic_ldr' was not declared. Should it be static?
drivers/gpu/drm/mga/mga_ioc32.c:192:20: sparse: symbol 'mga_compat_ioctls' was not declared. Should it be static?
drivers/gpu/drm/mga/mga_ioc32.c:207:6: sparse: symbol 'mga_compat_ioctl' was not declared. Should it be static?

[smatch]
drivers/media/dvb-core/dvb_frontend.c:338 dvb_frontend_swzigzag_autotune() warn: 'tmp' puts 576 bytes on stack
drivers/media/dvb-core/dvb_frontend.c:435 dvb_frontend_swzigzag() warn: 'tmp' puts 576 bytes on stack
drivers/media/dvb-frontends/dib7000m.c:964 dib7000m_autosearch_start() warn: 'schan' puts 576 bytes on stack
drivers/media/dvb-frontends/dib7000p.c:1103 dib7000p_autosearch_start() warn: 'schan' puts 576 bytes on stack
drivers/media/dvb-frontends/dib3000mc.c:555 dib3000mc_autosearch_start() warn: 'schan' puts 576 bytes on stack
drivers/media/dvb-frontends/mb86a20s.c:595 mb86a20s_layer_bitrate() error: buffer overflow 'state->estimated_rate' 3 <= 3
drivers/scsi/fnic/fnic_scsi.c:769 fnic_fcpio_icmnd_cmpl_handler() warn: was && intended here instead of ||?
drivers/scsi/fnic/fnic_debugfs.c:135 fnic_trace_debugfs_open() warn: possible memory leak of 'fnic_dbg_prt'
mm/slab_common.c:415 create_kmalloc_caches() warn: we never enter this loop
drivers/gpio/gpiolib-acpi.c:125 acpi_gpiochip_request_interrupts() warn: unsigned 'irq' is never less than zero.
drivers/atm/nicstar.c:1031 push_rxbufs() warn: unsigned 'id1' is never less than zero.
drivers/atm/nicstar.c:1039 push_rxbufs() warn: unsigned 'id2' is never less than zero.

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
