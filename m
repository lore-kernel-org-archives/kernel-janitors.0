From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 22 Jul 2012 13:51:08 +0000
Subject: Re: [uapi:uapi-split 25/74] arch/ia64/include/asm/bitops.h:47:1: error: macro "__paravirt_getreg" pa
Message-Id: <20120722135108.GA12128@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <23199.1342949300@warthog.procyon.org.uk>
In-Reply-To: <23199.1342949300@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi David,

On Sun, Jul 22, 2012 at 10:28:20AM +0100, David Howells wrote:
> 
> Hmmm...  I'm not sure this is something I've introduced.  I can't actually
> build IA-64 anyway, even without patches:

I can reproduce this on an native Itanium box.  With the patch, the
kernel build does fail much earlier:

wfg@hive /c/kernel-tests/src/next/obj% /usr/bin/make -C source O=/c/kernel-tests/src/next/obj
make: Entering directory `/c/kernel-tests/src/next'
make[2]: `include/generated/nr-irqs.h' is up to date.
  Using /c/kernel-tests/src/next as source for kernel
  GEN     /c/kernel-tests/src/next/obj/Makefile
  CHK     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
  CC      kernel/bounds.s
In file included from /c/kernel-tests/src/next/include/linux/bitops.h:22:0,
                 from /c/kernel-tests/src/next/include/linux/kernel.h:19,
                 from /c/kernel-tests/src/next/include/asm-generic/bug.h:13,
                 from /c/kernel-tests/src/next/arch/ia64/include/asm/bug.h:12,
                 from /c/kernel-tests/src/next/include/linux/bug.h:4,
                 from /c/kernel-tests/src/next/include/linux/page-flags.h:9,
                 from /c/kernel-tests/src/next/kernel/bounds.c:9:
/c/kernel-tests/src/next/arch/ia64/include/asm/bitops.h: In function 'set_bit':
/c/kernel-tests/src/next/arch/ia64/include/asm/bitops.h:47:1: error: macro "__paravirt_getreg" passed 1 arguments, but takes just 0
/c/kernel-tests/src/next/arch/ia64/include/asm/bitops.h:47:1: error: '__paravirt_getreg' undeclared (first use in this function)
/c/kernel-tests/src/next/arch/ia64/include/asm/bitops.h:47:1: note: each undeclared identifier is reported only once for each function it appears in
/c/kernel-tests/src/next/arch/ia64/include/asm/bitops.h: In function 'clear_bit':
/c/kernel-tests/src/next/arch/ia64/include/asm/bitops.h:94:1: error: macro "__paravirt_getreg" passed 1 arguments, but takes just 0
/c/kernel-tests/src/next/arch/ia64/include/asm/bitops.h:94:1: error: '__paravirt_getreg' undeclared (first use in this function)
/c/kernel-tests/src/next/arch/ia64/include/asm/bitops.h: In function 'clear_bit_unlock':
/c/kernel-tests/src/next/arch/ia64/include/asm/bitops.h:118:1: error: macro "__paravirt_getreg" passed 1 arguments, but takes just 0
/c/kernel-tests/src/next/arch/ia64/include/asm/bitops.h:118:1: error: '__paravirt_getreg' undeclared (first use in this function)
/c/kernel-tests/src/next/arch/ia64/include/asm/bitops.h: In function 'change_bit':
/c/kernel-tests/src/next/arch/ia64/include/asm/bitops.h:175:1: error: macro "__paravirt_getreg" passed 1 arguments, but takes just 0
/c/kernel-tests/src/next/arch/ia64/include/asm/bitops.h:175:1: error: '__paravirt_getreg' undeclared (first use in this function)
/c/kernel-tests/src/next/arch/ia64/include/asm/bitops.h: In function 'test_and_set_bit':
/c/kernel-tests/src/next/arch/ia64/include/asm/bitops.h:214:1: error: macro "__paravirt_getreg" passed 1 arguments, but takes just 0
/c/kernel-tests/src/next/arch/ia64/include/asm/bitops.h:214:1: error: '__paravirt_getreg' undeclared (first use in this function)
/c/kernel-tests/src/next/arch/ia64/include/asm/bitops.h: In function 'test_and_clear_bit':
/c/kernel-tests/src/next/arch/ia64/include/asm/bitops.h:268:1: error: macro "__paravirt_getreg" passed 1 arguments, but takes just 0
/c/kernel-tests/src/next/arch/ia64/include/asm/bitops.h:268:1: error: '__paravirt_getreg' undeclared (first use in this function)
/c/kernel-tests/src/next/arch/ia64/include/asm/bitops.h: In function 'test_and_change_bit':
/c/kernel-tests/src/next/arch/ia64/include/asm/bitops.h:313:1: error: macro "__paravirt_getreg" passed 1 arguments, but takes just 0
/c/kernel-tests/src/next/arch/ia64/include/asm/bitops.h:313:1: error: '__paravirt_getreg' undeclared (first use in this function)
make[2]: *** [kernel/bounds.s] Error 1
make[1]: *** [prepare0] Error 2
make: *** [sub-make] Error 2
make: Leaving directory `/c/kernel-tests/src/next'
wfg@hive /c/kernel-tests/src/next/obj% ..
wfg@hive /c/kernel-tests/src/next% git checkout 8789f3074811aa20435bfab7a8759416a31720e8                                    
M       lib/Kconfig.debug
cd -Previous HEAD position was b17f422... UAPI: (Scripted) Disintegrate arch/ia64/include/asm
HEAD is now at 8789f30... UAPI: (Scripted) Disintegrate arch/hexagon/include/asm
wfg@hive /c/kernel-tests/src/next% cd -
/c/kernel-tests/src/next/obj
wfg@hive /c/kernel-tests/src/next/obj%
wfg@hive /c/kernel-tests/src/next/obj% /usr/bin/make -C source O=/c/kernel-tests/src/next/obj
make: Entering directory `/c/kernel-tests/src/next'
make[2]: `include/generated/nr-irqs.h' is up to date.
  Using /c/kernel-tests/src/next as source for kernel
  GEN     /c/kernel-tests/src/next/obj/Makefile
  CHK     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
  UPD     include/generated/utsrelease.h
  CC      kernel/bounds.s
  GEN     include/generated/bounds.h
  CC      arch/ia64/kernel/asm-offsets.s
  GEN     include/generated/asm-offsets.h
  CALL    /c/kernel-tests/src/next/scripts/checksyscalls.sh
  HOSTCC  scripts/genksyms/genksyms.o
  SHIPPED scripts/genksyms/lex.lex.c
  SHIPPED scripts/genksyms/keywords.hash.c
  SHIPPED scripts/genksyms/parse.tab.h
  HOSTCC  scripts/genksyms/lex.lex.o
  SHIPPED scripts/genksyms/parse.tab.c
  HOSTCC  scripts/genksyms/parse.tab.o
  HOSTLD  scripts/genksyms/genksyms
  CC      scripts/mod/empty.o
  HOSTCC  scripts/mod/mk_elfconfig
  MKELF   scripts/mod/elfconfig.h
  HOSTCC  scripts/mod/file2alias.o
  HOSTCC  scripts/mod/modpost.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTLD  scripts/mod/modpost
  HOSTCC  scripts/selinux/genheaders/genheaders
  HOSTCC  scripts/selinux/mdp/mdp
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/pnmtologo
  HOSTCC  scripts/conmakehash
  HOSTCC  scripts/bin2c
  CC      init/main.o
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  CC      init/do_mounts.o
  CC      init/do_mounts_initrd.o
  LD      init/mounts.o
  CC      init/initramfs.o
  CC      init/calibrate.o
  LD      init/built-in.o
  HOSTCC  usr/gen_init_cpio
  GEN     usr/initramfs_data.cpio
  AS      usr/initramfs_data.o
  LD      usr/built-in.o
  AS      arch/ia64/kernel/entry.o
  CC      arch/ia64/kernel/efi.o
  AS      arch/ia64/kernel/efi_stub.o
  LDS     arch/ia64/kernel/gate.lds
  AS      arch/ia64/kernel/gate.o
  GATE arch/ia64/kernel/gate.so
  AS      arch/ia64/kernel/gate-data.o
  AS      arch/ia64/kernel/fsys.o
  CC      arch/ia64/kernel/ia64_ksyms.o
  CC      arch/ia64/kernel/irq.o
  CC      arch/ia64/kernel/irq_ia64.o
  CC      arch/ia64/kernel/irq_lsapic.o
  AS      arch/ia64/kernel/ivt.o
  CC      arch/ia64/kernel/machvec.o
  AS      arch/ia64/kernel/pal.o
  CC      arch/ia64/kernel/paravirt_patchlist.o
  CC      arch/ia64/kernel/patch.o
  CC      arch/ia64/kernel/process.o
  CC      arch/ia64/kernel/perfmon.o
  CC      arch/ia64/kernel/ptrace.o
  CC      arch/ia64/kernel/sal.o
  CC      arch/ia64/kernel/salinfo.o
  CC      arch/ia64/kernel/setup.o
  CC      arch/ia64/kernel/signal.o
  CC      arch/ia64/kernel/sys_ia64.o
  CC      arch/ia64/kernel/time.o
  CC      arch/ia64/kernel/traps.o
  CC      arch/ia64/kernel/unaligned.o
/c/kernel-tests/src/next/arch/ia64/kernel/unaligned.c: In function 'ia64_handle_unaligned':
/c/kernel-tests/src/next/arch/ia64/kernel/unaligned.c:1382:16: warning: 'u.l' may be used uninitialized in this function [-Wmaybe-uninitialized]
  CC      arch/ia64/kernel/unwind.o
  CC      arch/ia64/kernel/mca.o
  AS      arch/ia64/kernel/mca_asm.o
  CC      arch/ia64/kernel/topology.o
  CC      arch/ia64/kernel/dma-mapping.o
  CC      arch/ia64/kernel/acpi.o
  CC      arch/ia64/kernel/acpi-ext.o
  CC      arch/ia64/kernel/brl_emu.o
  CC      arch/ia64/kernel/iosapic.o
  CC      arch/ia64/kernel/module.o
  CC      arch/ia64/kernel/smp.o
  CC      arch/ia64/kernel/smpboot.o
  CC      arch/ia64/kernel/numa.o
  CC      arch/ia64/kernel/perfmon_default_smpl.o
  CC      arch/ia64/kernel/cyclone.o
  LD      arch/ia64/kernel/cpufreq/built-in.o
  CC [M]  arch/ia64/kernel/cpufreq/acpi-cpufreq.o
/c/kernel-tests/src/next/arch/ia64/kernel/cpufreq/acpi-cpufreq.c: In function 'processor_set_pstate':
/c/kernel-tests/src/next/arch/ia64/kernel/cpufreq/acpi-cpufreq.c:53:3: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 's64' [-Wformat]
/c/kernel-tests/src/next/arch/ia64/kernel/cpufreq/acpi-cpufreq.c: In function 'processor_get_pstate':
/c/kernel-tests/src/next/arch/ia64/kernel/cpufreq/acpi-cpufreq.c:75:3: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 's64' [-Wformat]
  CC      arch/ia64/kernel/kprobes.o
  AS      arch/ia64/kernel/jprobes.o
  CC      arch/ia64/kernel/machine_kexec.o
  AS      arch/ia64/kernel/relocate_kernel.o
  CC      arch/ia64/kernel/crash.o
  CC      arch/ia64/kernel/crash_dump.o
  CC      arch/ia64/kernel/uncached.o
  CC      arch/ia64/kernel/audit.o
  CC      arch/ia64/kernel/msi_ia64.o
  CC      arch/ia64/kernel/stacktrace.o
  CC      arch/ia64/kernel/paravirt.o
  AS      arch/ia64/kernel/paravirtentry.o
  CC      arch/ia64/kernel/paravirt_patch.o
  CC      arch/ia64/kernel/esi.o
  AS      arch/ia64/kernel/esi_stub.o
  CC      arch/ia64/kernel/pci-dma.o
  CC      arch/ia64/kernel/pci-swiotlb.o
  CC      arch/ia64/kernel/elfcore.o
  GATE arch/ia64/kernel/gate-syms.o
  LD      arch/ia64/kernel/built-in.o
  AS      arch/ia64/kernel/head.o
  CC      arch/ia64/kernel/init_task.o
  LDS     arch/ia64/kernel/vmlinux.lds
  CPP     arch/ia64/kernel/pvchk-sed-ivt.s
  PVCHK   arch/ia64/kernel/pvchk-ivt.s
  AS      arch/ia64/kernel/pvchk-ivt.o
  CPP     arch/ia64/kernel/pvchk-sed-entry.s
  PVCHK   arch/ia64/kernel/pvchk-entry.s
  AS      arch/ia64/kernel/pvchk-entry.o
  CPP     arch/ia64/kernel/pvchk-sed-fsys.s
  PVCHK   arch/ia64/kernel/pvchk-fsys.s
  AS      arch/ia64/kernel/pvchk-fsys.o
  CC [M]  arch/ia64/kernel/palinfo.o
  CC [M]  arch/ia64/kernel/mca_drv.o
  AS [M]  arch/ia64/kernel/mca_drv_asm.o
  LD [M]  arch/ia64/kernel/mca_recovery.o
  CC [M]  arch/ia64/kernel/err_inject.o
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c: In function 'show_call_start':
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c:75:1: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'u64' [-Wformat]
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c: In function 'store_call_start':
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c:89:2: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'u64' [-Wformat]
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c:90:2: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'u64' [-Wformat]
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c:94:6: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'u64' [-Wformat]
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c:94:6: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'u64' [-Wformat]
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c:94:6: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'u64' [-Wformat]
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c:120:2: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'u64' [-Wformat]
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c:121:2: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'u64' [-Wformat]
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c: In function 'show_err_type_info':
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c:126:1: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'u64' [-Wformat]
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c: In function 'show_virtual_to_phys':
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c:134:2: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'u64' [-Wformat]
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c: In function 'store_virtual_to_phys':
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c:149:3: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'u64' [-Wformat]
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c: In function 'show_err_struct_info':
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c:158:1: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'u64' [-Wformat]
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c: In function 'show_err_data_buffer':
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c:170:4: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'u64' [-Wformat]
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c:170:4: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'u64' [-Wformat]
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c:170:4: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'u64' [-Wformat]
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c: In function 'store_err_data_buffer':
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c:186:4: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'u64' [-Wformat]
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c:186:4: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'u64' [-Wformat]
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c:186:4: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'u64' [-Wformat]
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c:191:4: warning: format '%lx' expects argument of type 'long unsigned int *', but argument 3 has type 'u64 *' [-Wformat]
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c:191:4: warning: format '%lx' expects argument of type 'long unsigned int *', but argument 4 has type 'u64 *' [-Wformat]
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c:191:4: warning: format '%lx' expects argument of type 'long unsigned int *', but argument 5 has type 'u64 *' [-Wformat]
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c: In function 'show_status':
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c:198:1: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 's64' [-Wformat]
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c: In function 'show_capabilities':
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c:199:1: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'u64' [-Wformat]
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c: In function 'show_resources':
/c/kernel-tests/src/next/arch/ia64/kernel/err_inject.c:200:1: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'u64' [-Wformat]
  CC      arch/ia64/mm/init.o
  CC      arch/ia64/mm/fault.o
  CC      arch/ia64/mm/tlb.o
  CC      arch/ia64/mm/extable.o
  CC      arch/ia64/mm/ioremap.o
  CC      arch/ia64/mm/hugetlbpage.o
  CC      arch/ia64/mm/numa.o
  CC      arch/ia64/mm/discontig.o
  LD      arch/ia64/mm/built-in.o
  CC      arch/ia64/dig/setup.o
  CC      arch/ia64/dig/machvec.o
  CC      arch/ia64/dig/machvec_vtd.o
  LD      arch/ia64/dig/built-in.o
  CC      kernel/fork.o
  CC      kernel/exec_domain.o
  CC      kernel/panic.o
  CC      kernel/printk.o
  CC      kernel/cpu.o
  CC      kernel/exit.o
  CC      kernel/itimer.o
/c/kernel-tests/src/next/kernel/itimer.c: In function 'set_cpu_itimer':
/c/kernel-tests/src/next/kernel/itimer.c:152:2: warning: passing argument 1 of 'timeval_to_cputime' discards 'const' qualifier from pointer target type [enabled by default]
In file included from /c/kernel-tests/src/next/include/linux/sched.h:68:0,
                 from /c/kernel-tests/src/next/arch/ia64/include/asm/pgtable.h:153,
                 from /c/kernel-tests/src/next/include/linux/mm.h:44,
                 from /c/kernel-tests/src/next/kernel/itimer.c:9:
/c/kernel-tests/src/next/arch/ia64/include/asm/cputime.h:81:25: note: expected 'struct timeval *' but argument is of type 'const struct timeval *'
/c/kernel-tests/src/next/kernel/itimer.c:154:2: warning: passing argument 1 of 'timeval_to_cputime' discards 'const' qualifier from pointer target type [enabled by default]
In file included from /c/kernel-tests/src/next/include/linux/sched.h:68:0,
                 from /c/kernel-tests/src/next/arch/ia64/include/asm/pgtable.h:153,
                 from /c/kernel-tests/src/next/include/linux/mm.h:44,
                 from /c/kernel-tests/src/next/kernel/itimer.c:9:
/c/kernel-tests/src/next/arch/ia64/include/asm/cputime.h:81:25: note: expected 'struct timeval *' but argument is of type 'const struct timeval *'
  TIMEC   kernel/timeconst.h
  CC      kernel/time.o
  CC      kernel/softirq.o
  CC      kernel/resource.o
  CC      kernel/sysctl.o
  CC      kernel/sysctl_binary.o
  CC      kernel/capability.o
  CC      kernel/ptrace.o
  CC      kernel/timer.o
  CC      kernel/user.o
  CC      kernel/signal.o
  CC      kernel/sys.o
  CC      kernel/kmod.o
  CC      kernel/workqueue.o
  CC      kernel/pid.o
  CC      kernel/task_work.o
  CC      kernel/rcupdate.o
  CC      kernel/extable.o
  CC      kernel/params.o
  CC      kernel/posix-timers.o
  CC      kernel/kthread.o
  CC      kernel/wait.o
  CC      kernel/kfifo.o
  CC      kernel/sys_ni.o
  CC      kernel/posix-cpu-timers.o
  CC      kernel/mutex.o
  CC      kernel/hrtimer.o
  CC      kernel/rwsem.o
  CC      kernel/nsproxy.o
  CC      kernel/srcu.o
  CC      kernel/semaphore.o
  CC      kernel/notifier.o
  CC      kernel/ksysfs.o
  CC      kernel/cred.o
  CC      kernel/async.o
  CC      kernel/range.o
  CC      kernel/groups.o
  CC      kernel/lglock.o
  CC      kernel/gcov/base.o
  CC      kernel/gcov/fs.o
  CC      kernel/gcov/gcc_3_4.o
  LD      kernel/gcov/built-in.o
  CC      kernel/irq/irqdesc.o
  CC      kernel/irq/handle.o
  CC      kernel/irq/manage.o
  CC      kernel/irq/spurious.o
  CC      kernel/irq/resend.o
  CC      kernel/irq/chip.o
  CC      kernel/irq/dummychip.o
  CC      kernel/irq/devres.o
  CC      kernel/irq/generic-chip.o
  CC      kernel/irq/autoprobe.o
  CC      kernel/irq/irqdomain.o
  CC      kernel/irq/proc.o
  CC      kernel/irq/migration.o
  LD      kernel/irq/built-in.o
  CC      kernel/power/qos.o
  CC      kernel/power/main.o
  CC      kernel/power/process.o
  CC      kernel/power/poweroff.o
  LD      kernel/power/built-in.o
  CC      kernel/sched/core.o
/c/kernel-tests/src/next/kernel/sched/core.c: In function 'steal_account_process_tick':
/c/kernel-tests/src/next/kernel/sched/core.c:2982:3: error: implicit declaration of function 'paravirt_steal_clock' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
make[3]: *** [kernel/sched/core.o] Error 1
make[2]: *** [kernel/sched] Error 2
make[1]: *** [kernel] Error 2
make: *** [sub-make] Error 2
make: Leaving directory `/c/kernel-tests/src/next'

> include/linux/sched.h: In function 'stack_not_used':
> include/linux/sched.h:2517:21: error: 'IA64_TASK_SIZE' undeclared (first use in this function)
> include/linux/sched.h:2517:21: note: each undeclared identifier is reported only once for each function it appears in
> include/linux/sched.h:2517:21: error: 'IA64_THREAD_INFO_SIZE' undeclared (first use in this function
> 
> Do you have more success?

Yeah, Tony worked out a fix for that (the below email) some days ago.

Thanks,
Fengguang
---
From: Tony Luck <tony.luck@intel.com>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@elte.hu>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	linux-ia64@vger.kernel.org, Fengguang Wu <fengguang.wu@intel.com>
Bcc: 
Subject: [PATCH] debug: Do not permit CONFIG_DEBUG_STACK_USAGE=y on IA64 or
 PARISC
Reply-To: 

The stack_not_used() function in <linux/sched.h> assumes that stacks
grow downwards. This is not true on IA64 or PARISC, so this function
would walk off in the wrong direction and into the weeds.

Found on IA64 because of a compilation failure with recursive dependencies
on IA64_TASKSIZE and IA64_THREAD_INFO_SIZE.

Fixing the code is possible, but should be combined with other
infrastructure additions to set up the "canary" at the end of the stack.

Reported-by: Fengguang Wu <fengguang.wu@intel.com> (failed allmodconfig build)
Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 lib/Kconfig.debug | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index ff5bdee..4a18650 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -714,7 +714,7 @@ config STACKTRACE
 
 config DEBUG_STACK_USAGE
 	bool "Stack utilization instrumentation"
-	depends on DEBUG_KERNEL
+	depends on DEBUG_KERNEL && !IA64 && !PARISC
 	help
 	  Enables the display of the minimum amount of free stack which each
 	  task has ever had available in the sysrq-T and sysrq-P debug output.
-- 
1.7.10.2.552.gaa3bb87
