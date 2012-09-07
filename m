From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 07 Sep 2012 00:09:52 +0000
Subject: [rcu:rcu:idle 2/27] include/linux/rcupdate.h:969:2: error: #endif without #if
Message-Id: <20120907000952.GA7952@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="rwEMma7ioTxnRzrJ"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Frederic,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git rcu/idle
head:   dea42dc2282b9c8f78eb1fb6c4a0c81d700dd31c
commit: f105e7d73a465c74f00d554c855a3ddfdb7fa4ae [2/27] rcu: New rcu_user_enter_irq() and rcu_user_exit_irq() APIs
config: i386-randconfig-m011 (attached as .config)

All related error/warning messages:

In file included from include/linux/srcu.h:31:0,
                 from include/linux/notifier.h:15,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:730,
                 from include/linux/gfp.h:4,
                 from include/linux/slab.h:12,
                 from include/linux/crypto.h:24,
                 from arch/x86/kernel/asm-offsets.c:8:
include/linux/rcupdate.h:969:2: error: #endif without #if
In file included from include/linux/sem.h:81:0,
                 from include/linux/sched.h:71,
                 from arch/x86/kernel/asm-offsets.c:9:
include/linux/rcupdate.h:201:20: error: static declaration of 'rcu_user_enter' follows non-static declaration
In file included from include/linux/srcu.h:31:0,
                 from include/linux/notifier.h:15,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:730,
                 from include/linux/gfp.h:4,
                 from include/linux/slab.h:12,
                 from include/linux/crypto.h:24,
                 from arch/x86/kernel/asm-offsets.c:8:
include/linux/rcupdate.h:194:13: note: previous declaration of 'rcu_user_enter' was here
In file included from include/linux/sem.h:81:0,
                 from include/linux/sched.h:71,
                 from arch/x86/kernel/asm-offsets.c:9:
include/linux/rcupdate.h:202:20: error: static declaration of 'rcu_user_exit' follows non-static declaration
In file included from include/linux/srcu.h:31:0,
                 from include/linux/notifier.h:15,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:730,
                 from include/linux/gfp.h:4,
                 from include/linux/slab.h:12,
                 from include/linux/crypto.h:24,
                 from arch/x86/kernel/asm-offsets.c:8:
include/linux/rcupdate.h:195:13: note: previous declaration of 'rcu_user_exit' was here
In file included from include/linux/sem.h:81:0,
                 from include/linux/sched.h:71,
                 from arch/x86/kernel/asm-offsets.c:9:
include/linux/rcupdate.h:262:20: error: redefinition of 'init_rcu_head_on_stack'
In file included from include/linux/srcu.h:31:0,
                 from include/linux/notifier.h:15,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:730,
                 from include/linux/gfp.h:4,
                 from include/linux/slab.h:12,
                 from include/linux/crypto.h:24,
                 from arch/x86/kernel/asm-offsets.c:8:
include/linux/rcupdate.h:262:20: note: previous definition of 'init_rcu_head_on_stack' was here
In file included from include/linux/sem.h:81:0,
                 from include/linux/sched.h:71,
                 from arch/x86/kernel/asm-offsets.c:9:
include/linux/rcupdate.h:266:20: error: redefinition of 'destroy_rcu_head_on_stack'
In file included from include/linux/srcu.h:31:0,
                 from include/linux/notifier.h:15,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:730,
                 from include/linux/gfp.h:4,
                 from include/linux/slab.h:12,
                 from include/linux/crypto.h:24,
                 from arch/x86/kernel/asm-offsets.c:8:
include/linux/rcupdate.h:266:20: note: previous definition of 'destroy_rcu_head_on_stack' was here
In file included from include/linux/sem.h:81:0,
                 from include/linux/sched.h:71,
                 from arch/x86/kernel/asm-offsets.c:9:
include/linux/rcupdate.h:278:20: error: redefinition of 'rcu_lockdep_current_cpu_online'
In file included from include/linux/srcu.h:31:0,
                 from include/linux/notifier.h:15,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:730,
                 from include/linux/gfp.h:4,
                 from include/linux/slab.h:12,
                 from include/linux/crypto.h:24,
                 from arch/x86/kernel/asm-offsets.c:8:
include/linux/rcupdate.h:278:20: note: previous definition of 'rcu_lockdep_current_cpu_online' was here
In file included from include/linux/sem.h:81:0,
                 from include/linux/sched.h:71,
                 from arch/x86/kernel/asm-offsets.c:9:
include/linux/rcupdate.h:286:20: error: redefinition of 'rcu_lock_acquire'
In file included from include/linux/srcu.h:31:0,
                 from include/linux/notifier.h:15,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:730,
                 from include/linux/gfp.h:4,
                 from include/linux/slab.h:12,
                 from include/linux/crypto.h:24,
                 from arch/x86/kernel/asm-offsets.c:8:
include/linux/rcupdate.h:286:20: note: previous definition of 'rcu_lock_acquire' was here
In file included from include/linux/sem.h:81:0,
                 from include/linux/sched.h:71,
                 from arch/x86/kernel/asm-offsets.c:9:
include/linux/rcupdate.h:291:20: error: redefinition of 'rcu_lock_release'
In file included from include/linux/srcu.h:31:0,
                 from include/linux/notifier.h:15,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:730,
                 from include/linux/gfp.h:4,
                 from include/linux/slab.h:12,
                 from include/linux/crypto.h:24,
                 from arch/x86/kernel/asm-offsets.c:8:
include/linux/rcupdate.h:291:20: note: previous definition of 'rcu_lock_release' was here
In file included from include/linux/sem.h:81:0,
                 from include/linux/sched.h:71,
                 from arch/x86/kernel/asm-offsets.c:9:
include/linux/rcupdate.h:321:19: error: redefinition of 'rcu_read_lock_held'
In file included from include/linux/srcu.h:31:0,
                 from include/linux/notifier.h:15,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:730,
                 from include/linux/gfp.h:4,
                 from include/linux/slab.h:12,
                 from include/linux/crypto.h:24,
                 from arch/x86/kernel/asm-offsets.c:8:
include/linux/rcupdate.h:321:19: note: previous definition of 'rcu_read_lock_held' was here
In file included from include/linux/sem.h:81:0,
                 from include/linux/sched.h:71,
                 from arch/x86/kernel/asm-offsets.c:9:
include/linux/rcupdate.h:370:19: error: redefinition of 'rcu_read_lock_sched_held'
In file included from include/linux/srcu.h:31:0,
                 from include/linux/notifier.h:15,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:730,
                 from include/linux/gfp.h:4,
                 from include/linux/slab.h:12,
                 from include/linux/crypto.h:24,
                 from arch/x86/kernel/asm-offsets.c:8:
include/linux/rcupdate.h:370:19: note: previous definition of 'rcu_read_lock_sched_held' was here
In file included from include/linux/sem.h:81:0,
                 from include/linux/sched.h:71,
                 from arch/x86/kernel/asm-offsets.c:9:
include/linux/rcupdate.h:731:20: error: redefinition of 'rcu_read_lock'
In file included from include/linux/srcu.h:31:0,
                 from include/linux/notifier.h:15,
                 from include/linux/memory_hotplug.h:6,
                 from include/linux/mmzone.h:730,
                 from include/linux/gfp.h:4,
                 from include/linux/slab.h:12,
                 from include/linux/crypto.h:24,
                 from arch/x86/kernel/asm-offsets.c:8:

vim +969 include/linux/rcupdate.h
   964	 * checks are done in macros here.
   965	 */
   966	#define kfree_rcu(ptr, rcu_head)					\
   967		__kfree_rcu(&((ptr)->rcu_head), offsetof(typeof(*(ptr)), rcu_head))
   968	
 > 969	#endif /* __LINUX_RCUPDATE_H */

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=".config"

#
# Automatically generated file; DO NOT EDIT.
# Linux/i386 3.6.0-rc1 Kernel Configuration
#
# CONFIG_64BIT is not set
CONFIG_X86_32=y
# CONFIG_X86_64 is not set
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf32-i386"
CONFIG_ARCH_DEFCONFIG="arch/x86/configs/i386_defconfig"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_HAVE_LATENCYTOP_SUPPORT=y
CONFIG_MMU=y
# CONFIG_NEED_DMA_MAP_STATE is not set
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_GPIO=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
# CONFIG_RWSEM_GENERIC_SPINLOCK is not set
CONFIG_RWSEM_XCHGADD_ALGORITHM=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HAS_DEFAULT_IDLE=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CPU_AUTOPROBE=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
# CONFIG_ZONE_DMA32 is not set
# CONFIG_AUDIT_ARCH is not set
CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_X86_32_LAZY_GS=y
CONFIG_ARCH_HWEIGHT_CFLAGS="-fcall-saved-ecx -fcall-saved-edx"
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
CONFIG_HAVE_IRQ_WORK=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_EXTABLE_SORT=y

#
# General setup
#
# CONFIG_EXPERIMENTAL is not set
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_CROSS_COMPILE=""
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
CONFIG_BSD_PROCESS_ACCT=y
# CONFIG_BSD_PROCESS_ACCT_V3 is not set
# CONFIG_FHANDLE is not set
# CONFIG_TASKSTATS is not set
# CONFIG_AUDIT is not set
CONFIG_HAVE_GENERIC_HARDIRQS=y

#
# IRQ subsystem
#
CONFIG_GENERIC_HARDIRQS=y
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_DOMAIN_DEBUG=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_KTIME_SCALAR=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y

#
# Timers subsystem
#
# CONFIG_NO_HZ is not set
# CONFIG_HIGH_RES_TIMERS is not set

#
# RCU Subsystem
#
CONFIG_TINY_RCU=y
# CONFIG_PREEMPT_RCU is not set
# CONFIG_TREE_RCU_TRACE is not set
CONFIG_IKCONFIG=y
# CONFIG_IKCONFIG_PROC is not set
CONFIG_LOG_BUF_SHIFT=17
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y
CONFIG_CGROUPS=y
# CONFIG_CGROUP_DEBUG is not set
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_DEVICE=y
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
CONFIG_CGROUP_CPUACCT=y
# CONFIG_RESOURCE_COUNTERS is not set
# CONFIG_CGROUP_PERF is not set
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_NAMESPACES=y
# CONFIG_UTS_NS is not set
CONFIG_PID_NS=y
CONFIG_NET_NS=y
CONFIG_SCHED_AUTOGROUP=y
# CONFIG_SYSFS_DEPRECATED is not set
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
# CONFIG_RD_BZIP2 is not set
# CONFIG_RD_LZMA is not set
# CONFIG_RD_XZ is not set
# CONFIG_RD_LZO is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_ANON_INODES=y
CONFIG_EXPERT=y
CONFIG_UID16=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_HOTPLUG=y
CONFIG_PRINTK=y
CONFIG_BUG=y
# CONFIG_ELF_CORE is not set
# CONFIG_PCSPKR_PLATFORM is not set
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
# CONFIG_EPOLL is not set
# CONFIG_SIGNALFD is not set
# CONFIG_TIMERFD is not set
CONFIG_EVENTFD=y
# CONFIG_SHMEM is not set
# CONFIG_AIO is not set
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# CONFIG_VM_EVENT_COUNTERS is not set
CONFIG_PCI_QUIRKS=y
# CONFIG_SLUB_DEBUG is not set
# CONFIG_COMPAT_BRK is not set
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLOB is not set
# CONFIG_PROFILING is not set
CONFIG_TRACEPOINTS=y
CONFIG_HAVE_OPROFILE=y
CONFIG_OPROFILE_NMI_TIMER=y
# CONFIG_KPROBES is not set
# CONFIG_JUMP_LABEL is not set
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_ATTRS=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_DMA_API_DEBUG=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP_FILTER=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_HAVE_GENERIC_DMA_COHERENT=y
CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULES=y
# CONFIG_MODULE_FORCE_LOAD is not set
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODVERSIONS is not set
CONFIG_MODULE_SRCVERSION_ALL=y
# CONFIG_BLOCK is not set
# CONFIG_INLINE_SPIN_TRYLOCK is not set
# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
# CONFIG_INLINE_SPIN_LOCK is not set
# CONFIG_INLINE_SPIN_LOCK_BH is not set
# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
CONFIG_UNINLINE_SPIN_UNLOCK=y
# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
# CONFIG_INLINE_SPIN_UNLOCK_IRQ is not set
# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
# CONFIG_INLINE_READ_TRYLOCK is not set
# CONFIG_INLINE_READ_LOCK is not set
# CONFIG_INLINE_READ_LOCK_BH is not set
# CONFIG_INLINE_READ_LOCK_IRQ is not set
# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
# CONFIG_INLINE_READ_UNLOCK is not set
# CONFIG_INLINE_READ_UNLOCK_BH is not set
# CONFIG_INLINE_READ_UNLOCK_IRQ is not set
# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
# CONFIG_INLINE_WRITE_TRYLOCK is not set
# CONFIG_INLINE_WRITE_LOCK is not set
# CONFIG_INLINE_WRITE_LOCK_BH is not set
# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
# CONFIG_INLINE_WRITE_UNLOCK is not set
# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
# CONFIG_INLINE_WRITE_UNLOCK_IRQ is not set
# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
# CONFIG_MUTEX_SPIN_ON_OWNER is not set
CONFIG_FREEZER=y

#
# Processor type and features
#
# CONFIG_ZONE_DMA is not set
# CONFIG_SMP is not set
CONFIG_X86_MPPARSE=y
# CONFIG_X86_EXTENDED_PLATFORM is not set
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
CONFIG_X86_32_IRIS=m
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_PARAVIRT_GUEST=y
# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
# CONFIG_XEN_PRIVILEGED_GUEST is not set
# CONFIG_KVM_CLOCK is not set
CONFIG_KVM_GUEST=y
CONFIG_LGUEST_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
CONFIG_NO_BOOTMEM=y
CONFIG_MEMTEST=y
# CONFIG_M386 is not set
# CONFIG_M486 is not set
# CONFIG_M586 is not set
# CONFIG_M586TSC is not set
# CONFIG_M586MMX is not set
CONFIG_M686=y
# CONFIG_MPENTIUMII is not set
# CONFIG_MPENTIUMIII is not set
# CONFIG_MPENTIUMM is not set
# CONFIG_MPENTIUM4 is not set
# CONFIG_MK6 is not set
# CONFIG_MK7 is not set
# CONFIG_MK8 is not set
# CONFIG_MCRUSOE is not set
# CONFIG_MEFFICEON is not set
# CONFIG_MWINCHIPC6 is not set
# CONFIG_MWINCHIP3D is not set
# CONFIG_MELAN is not set
# CONFIG_MGEODEGX1 is not set
# CONFIG_MGEODE_LX is not set
# CONFIG_MCYRIXIII is not set
# CONFIG_MVIAC3_2 is not set
# CONFIG_MVIAC7 is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
# CONFIG_X86_GENERIC is not set
CONFIG_X86_INTERNODE_CACHE_SHIFT=5
CONFIG_X86_CMPXCHG=y
CONFIG_X86_L1_CACHE_SHIFT=5
CONFIG_X86_XADD=y
CONFIG_X86_PPRO_FENCE=y
CONFIG_X86_WP_WORKS_OK=y
CONFIG_X86_INVLPG=y
CONFIG_X86_BSWAP=y
CONFIG_X86_POPAD_OK=y
CONFIG_X86_USE_PPRO_CHECKSUM=y
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=5
CONFIG_X86_DEBUGCTLMSR=y
# CONFIG_PROCESSOR_SELECT is not set
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_CYRIX_32=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_TRANSMETA_32=y
CONFIG_CPU_SUP_UMC_32=y
CONFIG_HPET_TIMER=y
# CONFIG_DMI is not set
# CONFIG_IOMMU_HELPER is not set
CONFIG_NR_CPUS=1
# CONFIG_IRQ_TIME_ACCOUNTING is not set
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
CONFIG_X86_UP_APIC=y
CONFIG_X86_UP_IOAPIC=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
# CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
CONFIG_X86_MCE=y
# CONFIG_X86_MCE_INTEL is not set
CONFIG_X86_MCE_AMD=y
CONFIG_X86_ANCIENT_MCE=y
CONFIG_X86_MCE_THRESHOLD=y
# CONFIG_X86_MCE_INJECT is not set
# CONFIG_VM86 is not set
CONFIG_TOSHIBA=m
CONFIG_I8K=m
CONFIG_X86_REBOOTFIXUPS=y
CONFIG_MICROCODE=m
CONFIG_MICROCODE_INTEL=y
# CONFIG_MICROCODE_AMD is not set
CONFIG_MICROCODE_OLD_INTERFACE=y
# CONFIG_X86_MSR is not set
# CONFIG_X86_CPUID is not set
# CONFIG_NOHIGHMEM is not set
CONFIG_HIGHMEM4G=y
# CONFIG_HIGHMEM64G is not set
CONFIG_PAGE_OFFSET=0xC0000000
CONFIG_HIGHMEM=y
# CONFIG_ARCH_PHYS_ADDR_T_64BIT is not set
# CONFIG_ARCH_DMA_ADDR_T_64BIT is not set
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_ILLEGAL_POINTER_VALUE=0
CONFIG_FLATMEM=y
CONFIG_FLAT_NODE_MEM_MAP=y
CONFIG_HAVE_MEMBLOCK=y
CONFIG_HAVE_MEMBLOCK_NODE_MAP=y
CONFIG_ARCH_DISCARD_MEMBLOCK=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_PAGEFLAGS_EXTENDED=y
CONFIG_SPLIT_PTLOCK_CPUS=999999
# CONFIG_COMPACTION is not set
# CONFIG_PHYS_ADDR_T_64BIT is not set
CONFIG_ZONE_DMA_FLAG=0
CONFIG_VIRT_TO_BUS=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
CONFIG_MEMORY_FAILURE=y
CONFIG_HWPOISON_INJECT=m
# CONFIG_TRANSPARENT_HUGEPAGE is not set
# CONFIG_CROSS_MEMORY_ATTACH is not set
CONFIG_NEED_PER_CPU_KM=y
# CONFIG_CLEANCACHE is not set
# CONFIG_HIGHPTE is not set
# CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
CONFIG_X86_RESERVE_LOW=64
CONFIG_MATH_EMULATION=y
CONFIG_MTRR=y
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=0
CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
# CONFIG_X86_PAT is not set
# CONFIG_ARCH_RANDOM is not set
# CONFIG_EFI is not set
CONFIG_SECCOMP=y
# CONFIG_CC_STACKPROTECTOR is not set
CONFIG_HZ_100=y
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=100
# CONFIG_SCHED_HRTICK is not set
CONFIG_KEXEC=y
# CONFIG_CRASH_DUMP is not set
CONFIG_PHYSICAL_START=0x1000000
# CONFIG_RELOCATABLE is not set
CONFIG_PHYSICAL_ALIGN=0x1000000
# CONFIG_COMPAT_VDSO is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y

#
# Power management and ACPI options
#
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
CONFIG_PM_SLEEP=y
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM_RUNTIME=y
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_ACPI=y
CONFIG_ACPI_SLEEP=y
# CONFIG_ACPI_PROCFS is not set
# CONFIG_ACPI_PROCFS_POWER is not set
# CONFIG_ACPI_EC_DEBUGFS is not set
CONFIG_ACPI_PROC_EVENT=y
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_FAN=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_THERMAL=y
# CONFIG_ACPI_CUSTOM_DSDT is not set
CONFIG_ACPI_BLACKLIST_YEAR=0
# CONFIG_ACPI_DEBUG is not set
# CONFIG_ACPI_PCI_SLOT is not set
CONFIG_X86_PM_TIMER=y
# CONFIG_ACPI_SBS is not set
# CONFIG_ACPI_HED is not set
# CONFIG_ACPI_CUSTOM_METHOD is not set
# CONFIG_ACPI_BGRT is not set
# CONFIG_ACPI_APEI is not set
CONFIG_SFI=y
# CONFIG_APM is not set

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_TABLE=m
CONFIG_CPU_FREQ_STAT=m
# CONFIG_CPU_FREQ_STAT_DETAILS is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE=y
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=m
CONFIG_CPU_FREQ_GOV_USERSPACE=m
# CONFIG_CPU_FREQ_GOV_ONDEMAND is not set
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y

#
# x86 CPU frequency scaling drivers
#
# CONFIG_X86_PCC_CPUFREQ is not set
# CONFIG_X86_ACPI_CPUFREQ is not set
# CONFIG_X86_POWERNOW_K6 is not set
CONFIG_X86_POWERNOW_K7=m
CONFIG_X86_POWERNOW_K7_ACPI=y
# CONFIG_X86_POWERNOW_K8 is not set
CONFIG_X86_GX_SUSPMOD=m
CONFIG_X86_SPEEDSTEP_CENTRINO=m
CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=y
# CONFIG_X86_SPEEDSTEP_ICH is not set
# CONFIG_X86_P4_CLOCKMOD is not set
# CONFIG_X86_LONGRUN is not set
# CONFIG_X86_LONGHAUL is not set

#
# shared options
#
# CONFIG_X86_SPEEDSTEP_LIB is not set
CONFIG_CPU_IDLE=y
CONFIG_CPU_IDLE_GOV_LADDER=y
# CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
# CONFIG_INTEL_IDLE is not set

#
# Bus options (PCI etc.)
#
CONFIG_PCI=y
# CONFIG_PCI_GOBIOS is not set
# CONFIG_PCI_GOMMCONFIG is not set
# CONFIG_PCI_GODIRECT is not set
CONFIG_PCI_GOANY=y
CONFIG_PCI_BIOS=y
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_PCI_DOMAINS=y
# CONFIG_PCIEPORTBUS is not set
CONFIG_ARCH_SUPPORTS_MSI=y
# CONFIG_PCI_MSI is not set
CONFIG_PCI_DEBUG=y
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
CONFIG_PCI_STUB=m
CONFIG_HT_IRQ=y
CONFIG_PCI_ATS=y
CONFIG_PCI_IOV=y
CONFIG_PCI_PRI=y
# CONFIG_PCI_PASID is not set
# CONFIG_PCI_IOAPIC is not set
CONFIG_PCI_LABEL=y
CONFIG_ISA_DMA_API=y
CONFIG_ISA=y
# CONFIG_EISA is not set
# CONFIG_SCx200 is not set
# CONFIG_OLPC is not set
CONFIG_ALIX=y
CONFIG_NET5501=y
CONFIG_AMD_NB=y
# CONFIG_PCCARD is not set
# CONFIG_HOTPLUG_PCI is not set
CONFIG_RAPIDIO=y
CONFIG_RAPIDIO_DISC_TIMEOUT=30
# CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS is not set
CONFIG_RAPIDIO_DMA_ENGINE=y
CONFIG_RAPIDIO_DEBUG=y
# CONFIG_RAPIDIO_TSI57X is not set
# CONFIG_RAPIDIO_CPS_XX is not set
# CONFIG_RAPIDIO_TSI568 is not set
CONFIG_RAPIDIO_CPS_GEN2=y
# CONFIG_RAPIDIO_TSI500 is not set

#
# Executable file formats / Emulations
#
CONFIG_BINFMT_ELF=y
CONFIG_ARCH_BINFMT_ELF_RANDOMIZE_PIE=y
CONFIG_HAVE_AOUT=y
CONFIG_BINFMT_AOUT=m
CONFIG_BINFMT_MISC=m
CONFIG_HAVE_ATOMIC_IOMAP=y
CONFIG_HAVE_TEXT_POKE_SMP=y
CONFIG_NET=y

#
# Networking options
#
# CONFIG_PACKET is not set
CONFIG_UNIX=y
# CONFIG_UNIX_DIAG is not set
# CONFIG_NET_KEY is not set
# CONFIG_INET is not set
# CONFIG_NETWORK_SECMARK is not set
# CONFIG_NETFILTER is not set
# CONFIG_ATM is not set
# CONFIG_BRIDGE is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_DECNET is not set
# CONFIG_LLC2 is not set
# CONFIG_IPX is not set
# CONFIG_ATALK is not set
# CONFIG_PHONET is not set
# CONFIG_NET_SCHED is not set
# CONFIG_DCB is not set
# CONFIG_DNS_RESOLVER is not set
# CONFIG_BATMAN_ADV is not set
# CONFIG_OPENVSWITCH is not set
# CONFIG_NETPRIO_CGROUP is not set
CONFIG_BQL=y

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
# CONFIG_HAMRADIO is not set
# CONFIG_CAN is not set
# CONFIG_IRDA is not set
# CONFIG_BT is not set
CONFIG_WIRELESS=y
# CONFIG_CFG80211 is not set
# CONFIG_LIB80211 is not set

#
# CFG80211 needs to be enabled for MAC80211
#
# CONFIG_WIMAX is not set
# CONFIG_RFKILL is not set
# CONFIG_NET_9P is not set
# CONFIG_CAIF is not set

#
# Device Drivers
#

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER_PATH=""
# CONFIG_DEVTMPFS is not set
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y
CONFIG_FW_LOADER=m
# CONFIG_FIRMWARE_IN_KERNEL is not set
CONFIG_EXTRA_FIRMWARE=""
CONFIG_DEBUG_DRIVER=y
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_SYS_HYPERVISOR is not set
# CONFIG_GENERIC_CPU_DEVICES is not set
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=m
CONFIG_REGMAP_SPI=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_CONNECTOR is not set
# CONFIG_MTD is not set
# CONFIG_PARPORT is not set
CONFIG_PNP=y
CONFIG_PNP_DEBUG_MESSAGES=y

#
# Protocols
#
# CONFIG_ISAPNP is not set
CONFIG_PNPACPI=y

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=m
CONFIG_AD525X_DPOT=m
# CONFIG_AD525X_DPOT_I2C is not set
CONFIG_AD525X_DPOT_SPI=m
# CONFIG_PHANTOM is not set
# CONFIG_INTEL_MID_PTI is not set
# CONFIG_SGI_IOC4 is not set
# CONFIG_ENCLOSURE_SERVICES is not set
# CONFIG_HP_ILO is not set
CONFIG_APDS9802ALS=m
# CONFIG_ISL29003 is not set
# CONFIG_ISL29020 is not set
CONFIG_SENSORS_TSL2550=m
# CONFIG_SENSORS_BH1780 is not set
# CONFIG_SENSORS_BH1770 is not set
CONFIG_SENSORS_APDS990X=m
CONFIG_HMC6352=m
# CONFIG_TI_DAC7512 is not set
CONFIG_VMWARE_BALLOON=m
CONFIG_BMP085=y
CONFIG_BMP085_I2C=m
CONFIG_BMP085_SPI=m
CONFIG_PCH_PHUB=m
CONFIG_USB_SWITCH_FSA9480=m

#
# EEPROM support
#
CONFIG_EEPROM_AT24=m
# CONFIG_EEPROM_AT25 is not set
CONFIG_EEPROM_LEGACY=m
# CONFIG_EEPROM_93CX6 is not set
CONFIG_EEPROM_93XX46=m
# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
CONFIG_SENSORS_LIS3_I2C=m

#
# Altera FPGA firmware download module
#
# CONFIG_ALTERA_STAPL is not set
CONFIG_HAVE_IDE=y

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# CONFIG_SCSI_DMA is not set
# CONFIG_SCSI_NETLINK is not set
CONFIG_FUSION=y
CONFIG_FUSION_MAX_SGE=128
CONFIG_FUSION_LOGGING=y

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
# CONFIG_FIREWIRE_OHCI is not set
CONFIG_FIREWIRE_NOSY=m
CONFIG_I2O=m
# CONFIG_I2O_LCT_NOTIFY_ON_CHANGES is not set
CONFIG_I2O_EXT_ADAPTEC=y
# CONFIG_I2O_CONFIG is not set
# CONFIG_I2O_BUS is not set
# CONFIG_I2O_PROC is not set
# CONFIG_MACINTOSH_DRIVERS is not set
# CONFIG_NETDEVICES is not set
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_FF_MEMLESS=m
CONFIG_INPUT_POLLDEV=m
# CONFIG_INPUT_SPARSEKMAP is not set
CONFIG_INPUT_MATRIXKMAP=m

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=m
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
# CONFIG_INPUT_JOYDEV is not set
# CONFIG_INPUT_EVDEV is not set
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
CONFIG_KEYBOARD_ADP5588=m
# CONFIG_KEYBOARD_ADP5589 is not set
CONFIG_KEYBOARD_ATKBD=y
CONFIG_KEYBOARD_QT1070=m
CONFIG_KEYBOARD_LKKBD=m
# CONFIG_KEYBOARD_GPIO is not set
CONFIG_KEYBOARD_GPIO_POLLED=m
CONFIG_KEYBOARD_TCA6416=m
CONFIG_KEYBOARD_TCA8418=m
CONFIG_KEYBOARD_MATRIX=m
# CONFIG_KEYBOARD_LM8323 is not set
CONFIG_KEYBOARD_LM8333=m
CONFIG_KEYBOARD_MAX7359=m
CONFIG_KEYBOARD_MCS=m
CONFIG_KEYBOARD_MPR121=m
CONFIG_KEYBOARD_NEWTON=m
CONFIG_KEYBOARD_OPENCORES=m
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_OMAP4 is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_INPUT_MOUSE is not set
CONFIG_INPUT_JOYSTICK=y
# CONFIG_JOYSTICK_ANALOG is not set
# CONFIG_JOYSTICK_A3D is not set
CONFIG_JOYSTICK_ADI=m
CONFIG_JOYSTICK_COBRA=m
# CONFIG_JOYSTICK_GF2K is not set
# CONFIG_JOYSTICK_GRIP is not set
# CONFIG_JOYSTICK_GRIP_MP is not set
# CONFIG_JOYSTICK_GUILLEMOT is not set
# CONFIG_JOYSTICK_INTERACT is not set
CONFIG_JOYSTICK_SIDEWINDER=m
CONFIG_JOYSTICK_TMDC=m
CONFIG_JOYSTICK_IFORCE=m
# CONFIG_JOYSTICK_IFORCE_232 is not set
# CONFIG_JOYSTICK_WARRIOR is not set
# CONFIG_JOYSTICK_MAGELLAN is not set
# CONFIG_JOYSTICK_SPACEORB is not set
# CONFIG_JOYSTICK_SPACEBALL is not set
# CONFIG_JOYSTICK_STINGER is not set
# CONFIG_JOYSTICK_TWIDJOY is not set
# CONFIG_JOYSTICK_ZHENHUA is not set
# CONFIG_JOYSTICK_AS5011 is not set
CONFIG_JOYSTICK_JOYDUMP=m
# CONFIG_JOYSTICK_XPAD is not set
CONFIG_INPUT_TABLET=y
# CONFIG_TABLET_USB_ACECAD is not set
# CONFIG_TABLET_USB_AIPTEK is not set
# CONFIG_TABLET_USB_HANWANG is not set
# CONFIG_TABLET_USB_KBTAB is not set
# CONFIG_TABLET_USB_WACOM is not set
CONFIG_INPUT_TOUCHSCREEN=y
# CONFIG_TOUCHSCREEN_ADS7846 is not set
# CONFIG_TOUCHSCREEN_AD7877 is not set
CONFIG_TOUCHSCREEN_AD7879=m
CONFIG_TOUCHSCREEN_AD7879_I2C=m
# CONFIG_TOUCHSCREEN_AD7879_SPI is not set
CONFIG_TOUCHSCREEN_ATMEL_MXT=m
# CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
# CONFIG_TOUCHSCREEN_BU21013 is not set
CONFIG_TOUCHSCREEN_CY8CTMG110=m
# CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
# CONFIG_TOUCHSCREEN_DA9052 is not set
# CONFIG_TOUCHSCREEN_DYNAPRO is not set
CONFIG_TOUCHSCREEN_HAMPSHIRE=m
CONFIG_TOUCHSCREEN_EETI=m
# CONFIG_TOUCHSCREEN_EGALAX is not set
CONFIG_TOUCHSCREEN_FUJITSU=m
# CONFIG_TOUCHSCREEN_ILI210X is not set
CONFIG_TOUCHSCREEN_GUNZE=m
CONFIG_TOUCHSCREEN_ELO=m
CONFIG_TOUCHSCREEN_WACOM_W8001=m
# CONFIG_TOUCHSCREEN_WACOM_I2C is not set
CONFIG_TOUCHSCREEN_MAX11801=m
CONFIG_TOUCHSCREEN_MCS5000=m
# CONFIG_TOUCHSCREEN_MMS114 is not set
CONFIG_TOUCHSCREEN_MTOUCH=m
# CONFIG_TOUCHSCREEN_INEXIO is not set
# CONFIG_TOUCHSCREEN_MK712 is not set
CONFIG_TOUCHSCREEN_HTCPEN=m
# CONFIG_TOUCHSCREEN_PENMOUNT is not set
# CONFIG_TOUCHSCREEN_EDT_FT5X06 is not set
CONFIG_TOUCHSCREEN_TOUCHRIGHT=m
CONFIG_TOUCHSCREEN_TOUCHWIN=m
# CONFIG_TOUCHSCREEN_PIXCIR is not set
# CONFIG_TOUCHSCREEN_WM831X is not set
# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
CONFIG_TOUCHSCREEN_TSC_SERIO=m
CONFIG_TOUCHSCREEN_TSC2005=m
# CONFIG_TOUCHSCREEN_TSC2007 is not set
CONFIG_TOUCHSCREEN_PCAP=m
# CONFIG_TOUCHSCREEN_ST1232 is not set
CONFIG_TOUCHSCREEN_TPS6507X=m
# CONFIG_INPUT_MISC is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=m
# CONFIG_SERIO_CT82C710 is not set
CONFIG_SERIO_PCIPS2=m
CONFIG_SERIO_LIBPS2=y
# CONFIG_SERIO_RAW is not set
# CONFIG_SERIO_ALTERA_PS2 is not set
# CONFIG_SERIO_PS2MULT is not set
CONFIG_GAMEPORT=m
CONFIG_GAMEPORT_NS558=m
CONFIG_GAMEPORT_L4=m
# CONFIG_GAMEPORT_EMU10K1 is not set
# CONFIG_GAMEPORT_FM801 is not set

#
# Character devices
#
# CONFIG_VT is not set
CONFIG_UNIX98_PTYS=y
# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
CONFIG_SERIAL_NONSTANDARD=y
CONFIG_ROCKETPORT=m
# CONFIG_CYCLADES is not set
CONFIG_MOXA_INTELLIO=m
# CONFIG_MOXA_SMARTIO is not set
# CONFIG_SYNCLINK is not set
# CONFIG_SYNCLINKMP is not set
# CONFIG_SYNCLINK_GT is not set
CONFIG_ISI=m
# CONFIG_N_HDLC is not set
# CONFIG_TRACE_ROUTER is not set
CONFIG_TRACE_SINK=m
# CONFIG_DEVKMEM is not set
CONFIG_STALDRV=y

#
# Serial drivers
#
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_SERIAL_8250_PCI=m
CONFIG_SERIAL_8250_PNP=y
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MAX3100 is not set
CONFIG_SERIAL_MAX3107=m
CONFIG_SERIAL_MFD_HSU=m
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
CONFIG_SERIAL_TIMBERDALE=m
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
CONFIG_SERIAL_ALTERA_UART=m
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
CONFIG_SERIAL_PCH_UART=m
# CONFIG_SERIAL_XILINX_PS_UART is not set
# CONFIG_TTY_PRINTK is not set
CONFIG_HVC_DRIVER=y
CONFIG_VIRTIO_CONSOLE=y
# CONFIG_IPMI_HANDLER is not set
# CONFIG_HW_RANDOM is not set
# CONFIG_NVRAM is not set
# CONFIG_DTLK is not set
# CONFIG_R3964 is not set
CONFIG_APPLICOM=m
CONFIG_MWAVE=m
CONFIG_PC8736x_GPIO=m
CONFIG_NSC_GPIO=m
# CONFIG_HPET is not set
CONFIG_HANGCHECK_TIMER=m
# CONFIG_TCG_TPM is not set
CONFIG_DEVPORT=y
CONFIG_I2C=m
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
CONFIG_I2C_CHARDEV=m
# CONFIG_I2C_MUX is not set
# CONFIG_I2C_HELPER_AUTO is not set
# CONFIG_I2C_SMBUS is not set

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=m
CONFIG_I2C_ALGOPCF=m
CONFIG_I2C_ALGOPCA=m

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
CONFIG_I2C_ALI1535=m
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
CONFIG_I2C_AMD8111=m
CONFIG_I2C_I801=m
CONFIG_I2C_ISCH=m
# CONFIG_I2C_PIIX4 is not set
# CONFIG_I2C_NFORCE2 is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
CONFIG_I2C_SIS96X=m
CONFIG_I2C_VIAPRO=m

#
# ACPI drivers
#
# CONFIG_I2C_SCMI is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
CONFIG_I2C_DESIGNWARE_PCI=m
CONFIG_I2C_EG20T=m
CONFIG_I2C_GPIO=m
CONFIG_I2C_INTEL_MID=m
# CONFIG_I2C_PCA_PLATFORM is not set
# CONFIG_I2C_PXA_PCI is not set
CONFIG_I2C_SIMTEC=m

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_PARPORT_LIGHT is not set

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_ELEKTOR is not set
CONFIG_I2C_PCA_ISA=m
# CONFIG_SCx200_ACB is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
CONFIG_I2C_DEBUG_BUS=y
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y

#
# SPI Master Controller Drivers
#
CONFIG_SPI_ALTERA=m
CONFIG_SPI_BITBANG=m
CONFIG_SPI_GPIO=m
# CONFIG_SPI_OC_TINY is not set
# CONFIG_SPI_PXA2XX_PCI is not set
# CONFIG_SPI_TOPCLIFF_PCH is not set
# CONFIG_SPI_XCOMM is not set
# CONFIG_SPI_DESIGNWARE is not set

#
# SPI Protocol Masters
#
# CONFIG_SPI_TLE62X0 is not set
# CONFIG_HSI is not set

#
# PPS support
#

#
# PPS generators support
#

#
# PTP clock support
#

#
# Enable Device Drivers -> PPS to see the PTP clock options.
#
CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=y
CONFIG_GPIOLIB=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_GENERIC=m
CONFIG_GPIO_MAX730X=m

#
# Memory mapped GPIO drivers:
#
CONFIG_GPIO_GENERIC_PLATFORM=m
# CONFIG_GPIO_IT8761E is not set
CONFIG_GPIO_SCH=m
# CONFIG_GPIO_ICH is not set
# CONFIG_GPIO_VX855 is not set

#
# I2C GPIO expanders:
#
CONFIG_GPIO_MAX7300=m
CONFIG_GPIO_MAX732X=m
# CONFIG_GPIO_PCA953X is not set
# CONFIG_GPIO_PCF857X is not set
CONFIG_GPIO_TPS65912=m
CONFIG_GPIO_WM831X=m
# CONFIG_GPIO_ADP5588 is not set

#
# PCI GPIO expanders:
#
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_AMD8111 is not set
CONFIG_GPIO_LANGWELL=y
CONFIG_GPIO_PCH=m
# CONFIG_GPIO_ML_IOH is not set
CONFIG_GPIO_RDC321X=m

#
# SPI GPIO expanders:
#
CONFIG_GPIO_MAX7301=m
CONFIG_GPIO_MCP23S08=m
# CONFIG_GPIO_MC33880 is not set
# CONFIG_GPIO_74X164 is not set

#
# AC97 GPIO expanders:
#

#
# MODULbus GPIO expanders:
#
CONFIG_W1=m

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_MATROX=m
# CONFIG_W1_MASTER_DS1WM is not set
# CONFIG_W1_MASTER_GPIO is not set

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=m
# CONFIG_W1_SLAVE_SMEM is not set
CONFIG_W1_SLAVE_DS2408=m
CONFIG_W1_SLAVE_DS2423=m
# CONFIG_W1_SLAVE_DS2431 is not set
CONFIG_W1_SLAVE_DS2433=m
# CONFIG_W1_SLAVE_DS2433_CRC is not set
CONFIG_W1_SLAVE_DS2760=m
CONFIG_W1_SLAVE_DS2780=m
# CONFIG_W1_SLAVE_DS2781 is not set
# CONFIG_W1_SLAVE_DS28E04 is not set
CONFIG_W1_SLAVE_BQ27000=m
CONFIG_POWER_SUPPLY=y
CONFIG_POWER_SUPPLY_DEBUG=y
CONFIG_PDA_POWER=m
CONFIG_WM831X_BACKUP=m
CONFIG_WM831X_POWER=m
# CONFIG_TEST_POWER is not set
CONFIG_BATTERY_DS2760=m
# CONFIG_BATTERY_DS2780 is not set
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
CONFIG_BATTERY_SBS=m
# CONFIG_BATTERY_BQ27x00 is not set
# CONFIG_BATTERY_MAX17040 is not set
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_CHARGER_PCF50633 is not set
CONFIG_CHARGER_MAX8903=m
CONFIG_CHARGER_LP8727=m
# CONFIG_CHARGER_GPIO is not set
# CONFIG_CHARGER_SMB347 is not set
# CONFIG_POWER_AVS is not set
CONFIG_HWMON=m
CONFIG_HWMON_VID=m
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_ADM1021=m
CONFIG_SENSORS_ADM1025=m
# CONFIG_SENSORS_ADM1026 is not set
# CONFIG_SENSORS_ADM1029 is not set
# CONFIG_SENSORS_ADM1031 is not set
# CONFIG_SENSORS_ADM9240 is not set
# CONFIG_SENSORS_ADT7475 is not set
# CONFIG_SENSORS_ASC7621 is not set
CONFIG_SENSORS_K10TEMP=m
CONFIG_SENSORS_FAM15H_POWER=m
CONFIG_SENSORS_DS620=m
CONFIG_SENSORS_DS1621=m
# CONFIG_SENSORS_DA9052_ADC is not set
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=m
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_FSCHMD=m
# CONFIG_SENSORS_G760A is not set
CONFIG_SENSORS_GL518SM=m
# CONFIG_SENSORS_GL520SM is not set
CONFIG_SENSORS_GPIO_FAN=m
CONFIG_SENSORS_IT87=m
# CONFIG_SENSORS_JC42 is not set
CONFIG_SENSORS_LM63=m
# CONFIG_SENSORS_LM70 is not set
CONFIG_SENSORS_LM73=m
# CONFIG_SENSORS_LM75 is not set
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
# CONFIG_SENSORS_LM80 is not set
CONFIG_SENSORS_LM83=m
# CONFIG_SENSORS_LM85 is not set
# CONFIG_SENSORS_LM87 is not set
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
CONFIG_SENSORS_LM93=m
CONFIG_SENSORS_LTC4151=m
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_MAX1111=m
# CONFIG_SENSORS_MAX16065 is not set
CONFIG_SENSORS_MAX1619=m
# CONFIG_SENSORS_PC87360 is not set
# CONFIG_SENSORS_PC87427 is not set
# CONFIG_SENSORS_PCF8591 is not set
CONFIG_SENSORS_SHT15=m
# CONFIG_SENSORS_SHT21 is not set
# CONFIG_SENSORS_SIS5595 is not set
# CONFIG_SENSORS_EMC1403 is not set
CONFIG_SENSORS_EMC2103=m
CONFIG_SENSORS_EMC6W201=m
# CONFIG_SENSORS_SMSC47M1 is not set
CONFIG_SENSORS_SMSC47M192=m
# CONFIG_SENSORS_SCH56XX_COMMON is not set
# CONFIG_SENSORS_SCH5627 is not set
# CONFIG_SENSORS_SCH5636 is not set
CONFIG_SENSORS_ADS1015=m
CONFIG_SENSORS_ADS7828=m
CONFIG_SENSORS_ADS7871=m
CONFIG_SENSORS_THMC50=m
CONFIG_SENSORS_VIA_CPUTEMP=m
# CONFIG_SENSORS_VIA686A is not set
CONFIG_SENSORS_VT1211=m
CONFIG_SENSORS_VT8231=m
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83627HF=m
CONFIG_SENSORS_W83627EHF=m
# CONFIG_SENSORS_WM831X is not set
CONFIG_SENSORS_APPLESMC=m

#
# ACPI drivers
#
# CONFIG_SENSORS_ACPI_POWER is not set
CONFIG_THERMAL=y
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set

#
# Watchdog Device Drivers
#
# CONFIG_SOFT_WATCHDOG is not set
CONFIG_DA9052_WATCHDOG=m
CONFIG_WM831X_WATCHDOG=m
CONFIG_ACQUIRE_WDT=m
CONFIG_ADVANTECH_WDT=m
# CONFIG_ALIM1535_WDT is not set
# CONFIG_ALIM7101_WDT is not set
# CONFIG_SP5100_TCO is not set
# CONFIG_SC520_WDT is not set
CONFIG_SBC_FITPC2_WATCHDOG=m
# CONFIG_EUROTECH_WDT is not set
CONFIG_IB700_WDT=m
CONFIG_IBMASR=m
CONFIG_WAFER_WDT=m
# CONFIG_I6300ESB_WDT is not set
CONFIG_IE6XX_WDT=m
CONFIG_ITCO_WDT=m
CONFIG_ITCO_VENDOR_SUPPORT=y
# CONFIG_IT8712F_WDT is not set
CONFIG_HP_WATCHDOG=m
# CONFIG_HPWDT_NMI_DECODING is not set
CONFIG_SC1200_WDT=m
CONFIG_PC87413_WDT=m
# CONFIG_NV_TCO is not set
CONFIG_60XX_WDT=m
CONFIG_SBC8360_WDT=m
# CONFIG_SBC7240_WDT is not set
# CONFIG_CPU5_WDT is not set
CONFIG_SMSC_SCH311X_WDT=m
# CONFIG_SMSC37B787_WDT is not set
# CONFIG_VIA_WDT is not set
# CONFIG_W83627HF_WDT is not set
# CONFIG_W83697HF_WDT is not set
CONFIG_W83697UG_WDT=m
# CONFIG_W83877F_WDT is not set
CONFIG_W83977F_WDT=m
CONFIG_MACHZ_WDT=m
CONFIG_SBC_EPX_C3_WATCHDOG=m

#
# ISA-based Watchdog Cards
#
CONFIG_PCWATCHDOG=m
# CONFIG_MIXCOMWD is not set
# CONFIG_WDT is not set

#
# PCI-based Watchdog Cards
#
# CONFIG_PCIPCWATCHDOG is not set
# CONFIG_WDTPCI is not set
CONFIG_SSB_POSSIBLE=y

#
# Sonics Silicon Backplane
#
CONFIG_SSB=m
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
# CONFIG_SSB_B43_PCI_BRIDGE is not set
# CONFIG_SSB_SILENT is not set
CONFIG_SSB_DEBUG=y
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
CONFIG_SSB_DRIVER_PCICORE=y
CONFIG_BCMA_POSSIBLE=y

#
# Broadcom specific AMBA
#
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_SM501=m
# CONFIG_MFD_SM501_GPIO is not set
CONFIG_HTC_PASIC3=m
# CONFIG_MFD_LM3533 is not set
# CONFIG_TPS6105X is not set
CONFIG_TPS65010=m
# CONFIG_TPS6507X is not set
CONFIG_MFD_TPS65217=m
CONFIG_MFD_TPS65912=y
CONFIG_MFD_TPS65912_SPI=y
# CONFIG_MFD_STMPE is not set
# CONFIG_MFD_TMIO is not set
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_SPI=y
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_ARIZONA_SPI is not set
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_SPI=y
CONFIG_MFD_PCF50633=m
CONFIG_PCF50633_ADC=m
CONFIG_PCF50633_GPIO=m
# CONFIG_MFD_MC13XXX_SPI is not set
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_ABX500_CORE is not set
CONFIG_EZX_PCAP=y
# CONFIG_MFD_CS5535 is not set
# CONFIG_MFD_TIMBERDALE is not set
CONFIG_LPC_SCH=m
CONFIG_LPC_ICH=m
CONFIG_MFD_RDC321X=m
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_VX855 is not set
CONFIG_MFD_WL1273_CORE=m
# CONFIG_REGULATOR is not set
CONFIG_MEDIA_SUPPORT=m

#
# Multimedia core support
#
# CONFIG_MEDIA_CAMERA_SUPPORT is not set
# CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
# CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
# CONFIG_MEDIA_RADIO_SUPPORT is not set
# CONFIG_MEDIA_RC_SUPPORT is not set

#
# Media drivers
#

#
# Graphics support
#
# CONFIG_AGP is not set
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_VGA_SWITCHEROO is not set
CONFIG_DRM=m
CONFIG_DRM_KMS_HELPER=m
# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
CONFIG_DRM_TTM=m
# CONFIG_DRM_TDFX is not set
CONFIG_DRM_R128=m
CONFIG_DRM_RADEON=m
CONFIG_DRM_RADEON_KMS=y
CONFIG_DRM_NOUVEAU=m
# CONFIG_DRM_NOUVEAU_BACKLIGHT is not set
CONFIG_DRM_NOUVEAU_DEBUG=y

#
# I2C encoder or helper chips
#
# CONFIG_DRM_I2C_CH7006 is not set
CONFIG_DRM_I2C_SIL164=m
CONFIG_DRM_MGA=m
CONFIG_DRM_VIA=m
CONFIG_DRM_SAVAGE=m
CONFIG_DRM_VMWGFX=m
# CONFIG_STUB_POULSBO is not set
CONFIG_VGASTATE=m
# CONFIG_VIDEO_OUTPUT_CONTROL is not set
CONFIG_FB=m
CONFIG_FIRMWARE_EDID=y
CONFIG_FB_DDC=m
# CONFIG_FB_BOOT_VESA_SUPPORT is not set
CONFIG_FB_CFB_FILLRECT=m
CONFIG_FB_CFB_COPYAREA=m
CONFIG_FB_CFB_IMAGEBLIT=m
# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
CONFIG_FB_FOREIGN_ENDIAN=y
# CONFIG_FB_BOTH_ENDIAN is not set
CONFIG_FB_BIG_ENDIAN=y
# CONFIG_FB_LITTLE_ENDIAN is not set
CONFIG_FB_SYS_FOPS=m
# CONFIG_FB_WMT_GE_ROPS is not set
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_HECUBA=m
CONFIG_FB_SVGALIB=m
# CONFIG_FB_MACMODES is not set
CONFIG_FB_BACKLIGHT=y
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
CONFIG_FB_CIRRUS=m
CONFIG_FB_PM2=m
CONFIG_FB_PM2_FIFO_DISCONNECT=y
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ARC is not set
# CONFIG_FB_VGA16 is not set
CONFIG_FB_N411=m
# CONFIG_FB_HGA is not set
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
CONFIG_FB_RIVA=m
CONFIG_FB_RIVA_I2C=y
CONFIG_FB_RIVA_DEBUG=y
# CONFIG_FB_RIVA_BACKLIGHT is not set
CONFIG_FB_LE80578=m
CONFIG_FB_CARILLO_RANCH=m
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
CONFIG_FB_ATY128=m
CONFIG_FB_ATY128_BACKLIGHT=y
CONFIG_FB_ATY=m
# CONFIG_FB_ATY_CT is not set
# CONFIG_FB_ATY_GX is not set
CONFIG_FB_ATY_BACKLIGHT=y
CONFIG_FB_S3=m
CONFIG_FB_S3_DDC=y
CONFIG_FB_SIS=m
CONFIG_FB_SIS_300=y
# CONFIG_FB_SIS_315 is not set
# CONFIG_FB_VIA is not set
CONFIG_FB_NEOMAGIC=m
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
CONFIG_FB_TRIDENT=m
CONFIG_FB_ARK=m
# CONFIG_FB_CARMINE is not set
CONFIG_FB_TMIO=m
# CONFIG_FB_TMIO_ACCELL is not set
# CONFIG_FB_SM501 is not set
# CONFIG_FB_VIRTUAL is not set
# CONFIG_FB_METRONOME is not set
CONFIG_FB_MB862XX=m
CONFIG_FB_MB862XX_PCI_GDC=y
# CONFIG_FB_MB862XX_I2C is not set
CONFIG_FB_BROADSHEET=m
CONFIG_FB_AUO_K190X=m
CONFIG_FB_AUO_K1900=m
CONFIG_FB_AUO_K1901=m
CONFIG_EXYNOS_VIDEO=y
CONFIG_BACKLIGHT_LCD_SUPPORT=y
CONFIG_LCD_CLASS_DEVICE=m
# CONFIG_LCD_L4F00242T03 is not set
# CONFIG_LCD_LMS283GF05 is not set
CONFIG_LCD_LTV350QV=m
CONFIG_LCD_TDO24M=m
# CONFIG_LCD_VGG2432A4 is not set
CONFIG_LCD_PLATFORM=m
# CONFIG_LCD_S6E63M0 is not set
# CONFIG_LCD_LD9040 is not set
CONFIG_LCD_AMS369FG06=m
CONFIG_BACKLIGHT_CLASS_DEVICE=m
CONFIG_BACKLIGHT_GENERIC=m
CONFIG_BACKLIGHT_PROGEAR=m
# CONFIG_BACKLIGHT_CARILLO_RANCH is not set
# CONFIG_BACKLIGHT_DA9052 is not set
# CONFIG_BACKLIGHT_APPLE is not set
# CONFIG_BACKLIGHT_SAHARA is not set
# CONFIG_BACKLIGHT_WM831X is not set
# CONFIG_BACKLIGHT_ADP8860 is not set
# CONFIG_BACKLIGHT_ADP8870 is not set
# CONFIG_BACKLIGHT_PCF50633 is not set
# CONFIG_BACKLIGHT_LP855X is not set
# CONFIG_LOGO is not set
# CONFIG_SOUND is not set

#
# HID support
#
# CONFIG_HID is not set
CONFIG_USB_ARCH_HAS_OHCI=y
CONFIG_USB_ARCH_HAS_EHCI=y
CONFIG_USB_ARCH_HAS_XHCI=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_ARCH_HAS_HCD=y
# CONFIG_USB is not set
# CONFIG_USB_OTG_WHITELIST is not set
# CONFIG_USB_OTG_BLACKLIST_HUB is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#
# CONFIG_USB_GADGET is not set

#
# OTG and related infrastructure
#
# CONFIG_MMC is not set
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=m

#
# LED drivers
#
CONFIG_LEDS_LM3530=m
# CONFIG_LEDS_GPIO is not set
# CONFIG_LEDS_LP3944 is not set
CONFIG_LEDS_LP5521=m
CONFIG_LEDS_LP5523=m
# CONFIG_LEDS_PCA955X is not set
CONFIG_LEDS_PCA9633=m
CONFIG_LEDS_WM831X_STATUS=m
CONFIG_LEDS_DA9052=m
# CONFIG_LEDS_DAC124S085 is not set
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_LT3593=m
# CONFIG_LEDS_DELL_NETBOOKS is not set
# CONFIG_LEDS_TCA6507 is not set
# CONFIG_LEDS_LM3556 is not set
CONFIG_LEDS_OT200=m
# CONFIG_LEDS_BLINKM is not set
# CONFIG_LEDS_TRIGGERS is not set

#
# LED Triggers
#
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
# CONFIG_EDAC is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_CLASS=y
# CONFIG_RTC_HCTOSYS is not set
# CONFIG_RTC_DEBUG is not set

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
# CONFIG_RTC_INTF_PROC is not set
# CONFIG_RTC_INTF_DEV is not set
CONFIG_RTC_DRV_TEST=m

#
# I2C RTC drivers
#
# CONFIG_RTC_DRV_DS1307 is not set
CONFIG_RTC_DRV_DS1374=m
# CONFIG_RTC_DRV_DS1672 is not set
# CONFIG_RTC_DRV_DS3232 is not set
CONFIG_RTC_DRV_MAX6900=m
CONFIG_RTC_DRV_RS5C372=m
CONFIG_RTC_DRV_ISL1208=m
# CONFIG_RTC_DRV_ISL12022 is not set
CONFIG_RTC_DRV_X1205=m
CONFIG_RTC_DRV_PCF8563=m
CONFIG_RTC_DRV_PCF8583=m
# CONFIG_RTC_DRV_M41T80 is not set
# CONFIG_RTC_DRV_BQ32K is not set
# CONFIG_RTC_DRV_S35390A is not set
CONFIG_RTC_DRV_FM3130=m
# CONFIG_RTC_DRV_RX8581 is not set
CONFIG_RTC_DRV_RX8025=m
CONFIG_RTC_DRV_EM3027=m
# CONFIG_RTC_DRV_RV3029C2 is not set

#
# SPI RTC drivers
#
CONFIG_RTC_DRV_M41T93=m
CONFIG_RTC_DRV_M41T94=m
CONFIG_RTC_DRV_DS1305=m
CONFIG_RTC_DRV_DS1390=m
CONFIG_RTC_DRV_MAX6902=m
CONFIG_RTC_DRV_R9701=m
CONFIG_RTC_DRV_RS5C348=m
CONFIG_RTC_DRV_DS3234=m
# CONFIG_RTC_DRV_PCF2123 is not set

#
# Platform RTC drivers
#
# CONFIG_RTC_DRV_CMOS is not set
CONFIG_RTC_DRV_DS1286=m
CONFIG_RTC_DRV_DS1511=m
# CONFIG_RTC_DRV_DS1553 is not set
CONFIG_RTC_DRV_DS1742=m
CONFIG_RTC_DRV_DA9052=m
# CONFIG_RTC_DRV_STK17TA8 is not set
# CONFIG_RTC_DRV_M48T86 is not set
# CONFIG_RTC_DRV_M48T35 is not set
CONFIG_RTC_DRV_M48T59=m
CONFIG_RTC_DRV_MSM6242=m
CONFIG_RTC_DRV_BQ4802=m
CONFIG_RTC_DRV_RP5C01=m
# CONFIG_RTC_DRV_V3020 is not set
# CONFIG_RTC_DRV_WM831X is not set
# CONFIG_RTC_DRV_PCF50633 is not set

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_PCAP is not set
CONFIG_DMADEVICES=y
CONFIG_DMADEVICES_DEBUG=y
# CONFIG_DMADEVICES_VDEBUG is not set

#
# DMA Devices
#
CONFIG_INTEL_MID_DMAC=m
CONFIG_INTEL_IOATDMA=m
# CONFIG_TIMB_DMA is not set
CONFIG_PCH_DMA=m
CONFIG_DMA_ENGINE=y

#
# DMA Clients
#
CONFIG_NET_DMA=y
CONFIG_ASYNC_TX_DMA=y
# CONFIG_DMATEST is not set
CONFIG_DCA=m
CONFIG_AUXDISPLAY=y
CONFIG_UIO=m
CONFIG_UIO_CIF=m
CONFIG_UIO_PDRV=m
CONFIG_UIO_PDRV_GENIRQ=m
# CONFIG_UIO_AEC is not set
# CONFIG_UIO_SERCOS3 is not set
CONFIG_UIO_PCI_GENERIC=m
CONFIG_UIO_NETX=m
CONFIG_VIRTIO=y
CONFIG_VIRTIO_RING=y

#
# Virtio drivers
#
CONFIG_VIRTIO_BALLOON=m

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
CONFIG_STAGING=y
# CONFIG_SLICOSS is not set
CONFIG_ECHO=m
CONFIG_COMEDI=m
# CONFIG_COMEDI_DEBUG is not set
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
# CONFIG_COMEDI_MISC_DRIVERS is not set
# CONFIG_COMEDI_ISA_DRIVERS is not set
# CONFIG_COMEDI_PCI_DRIVERS is not set
CONFIG_COMEDI_8255=m
CONFIG_DX_SEP=m

#
# IIO staging drivers
#
CONFIG_IIO_ST_HWMON=m
CONFIG_IIO_SW_RING=m

#
# Accelerometers
#
# CONFIG_ADIS16201 is not set
CONFIG_ADIS16203=m
# CONFIG_ADIS16204 is not set
CONFIG_ADIS16209=m
# CONFIG_ADIS16220 is not set
# CONFIG_ADIS16240 is not set
CONFIG_KXSD9=m
# CONFIG_LIS3L02DQ is not set
CONFIG_SCA3000=m

#
# Analog to digital converters
#
CONFIG_AD7291=m
# CONFIG_AD7298 is not set
# CONFIG_AD7606 is not set
CONFIG_AD799X=m
CONFIG_AD799X_RING_BUFFER=y
CONFIG_AD7476=m
# CONFIG_AD7887 is not set
# CONFIG_AD7780 is not set
CONFIG_AD7793=m
CONFIG_AD7816=m
# CONFIG_AD7192 is not set
CONFIG_ADT7310=m
# CONFIG_ADT7410 is not set
CONFIG_AD7280=m
CONFIG_MAX1363=m
CONFIG_MAX1363_RING_BUFFER=y

#
# Analog digital bi-direction converters
#
# CONFIG_ADT7316 is not set

#
# Capacitance to digital converters
#
# CONFIG_AD7150 is not set
# CONFIG_AD7152 is not set
CONFIG_AD7746=m

#
# Direct Digital Synthesis
#
CONFIG_AD5930=m
CONFIG_AD9832=m
CONFIG_AD9834=m
CONFIG_AD9850=m
# CONFIG_AD9852 is not set
CONFIG_AD9910=m
CONFIG_AD9951=m

#
# Digital gyroscope sensors
#
# CONFIG_ADIS16060 is not set
# CONFIG_ADIS16080 is not set
CONFIG_ADIS16130=m
CONFIG_ADIS16260=m
# CONFIG_ADXRS450 is not set

#
# Network Analyzer, Impedance Converters
#
# CONFIG_AD5933 is not set

#
# Inertial measurement units
#
CONFIG_ADIS16400=m

#
# Light sensors
#
CONFIG_SENSORS_ISL29018=m
# CONFIG_SENSORS_ISL29028 is not set
# CONFIG_SENSORS_TSL2563 is not set
CONFIG_TSL2583=m
# CONFIG_TSL2x7x is not set

#
# Magnetometer sensors
#
# CONFIG_SENSORS_AK8975 is not set
CONFIG_SENSORS_HMC5843=m

#
# Active energy metering IC
#
# CONFIG_ADE7753 is not set
# CONFIG_ADE7754 is not set
CONFIG_ADE7758=m
# CONFIG_ADE7759 is not set
CONFIG_ADE7854=m
# CONFIG_ADE7854_I2C is not set
CONFIG_ADE7854_SPI=m

#
# Resolver to digital converters
#
CONFIG_AD2S90=m
# CONFIG_AD2S1200 is not set
CONFIG_AD2S1210=m

#
# Triggers - standalone
#
CONFIG_IIO_PERIODIC_RTC_TRIGGER=m
# CONFIG_IIO_GPIO_TRIGGER is not set
CONFIG_IIO_SYSFS_TRIGGER=m
# CONFIG_IIO_SIMPLE_DUMMY is not set
# CONFIG_ZSMALLOC is not set
# CONFIG_FB_SM7XX is not set
CONFIG_CRYSTALHD=m
CONFIG_FB_XGI=m
# CONFIG_ACPI_QUICKSTART is not set
# CONFIG_FT1000 is not set

#
# Speakup console speech
#
# CONFIG_TOUCHSCREEN_CLEARPAD_TM1217 is not set
# CONFIG_TOUCHSCREEN_SYNAPTICS_I2C_RMI4 is not set
CONFIG_STAGING_MEDIA=y

#
# Android
#
# CONFIG_ANDROID is not set
# CONFIG_PHONE is not set
CONFIG_IPACK_BUS=m
CONFIG_BOARD_TPCI200=m
# CONFIG_SERIAL_IPOCTAL is not set
# CONFIG_WIMAX_GDM72XX is not set
CONFIG_X86_PLATFORM_DEVICES=y
# CONFIG_ACER_WMI is not set
# CONFIG_ACERHDF is not set
# CONFIG_ASUS_LAPTOP is not set
# CONFIG_DELL_WMI is not set
# CONFIG_DELL_WMI_AIO is not set
# CONFIG_FUJITSU_LAPTOP is not set
# CONFIG_FUJITSU_TABLET is not set
# CONFIG_HP_ACCEL is not set
# CONFIG_HP_WMI is not set
# CONFIG_PANASONIC_LAPTOP is not set
# CONFIG_THINKPAD_ACPI is not set
CONFIG_SENSORS_HDAPS=m
# CONFIG_INTEL_MENLOW is not set
CONFIG_ACPI_WMI=m
# CONFIG_MSI_WMI is not set
# CONFIG_TOPSTAR_LAPTOP is not set
# CONFIG_ACPI_TOSHIBA is not set
# CONFIG_TOSHIBA_BT_RFKILL is not set
# CONFIG_ACPI_CMPC is not set
# CONFIG_INTEL_IPS is not set
# CONFIG_IBM_RTL is not set
# CONFIG_XO15_EBOOK is not set
# CONFIG_SAMSUNG_LAPTOP is not set
CONFIG_MXM_WMI=m
CONFIG_SAMSUNG_Q10=m
# CONFIG_APPLE_GMUX is not set

#
# Hardware Spinlock drivers
#
CONFIG_CLKSRC_I8253=y
CONFIG_CLKEVT_I8253=y
CONFIG_CLKBLD_I8253=y
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers (EXPERIMENTAL)
#

#
# Rpmsg drivers (EXPERIMENTAL)
#
CONFIG_VIRT_DRIVERS=y
CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
# CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
# CONFIG_DEVFREQ_GOV_POWERSAVE is not set
# CONFIG_DEVFREQ_GOV_USERSPACE is not set

#
# DEVFREQ Drivers
#
CONFIG_EXTCON=m

#
# Extcon Device Drivers
#
CONFIG_EXTCON_GPIO=m
# CONFIG_MEMORY is not set
CONFIG_IIO=m
CONFIG_IIO_BUFFER=y
CONFIG_IIO_KFIFO_BUF=m
CONFIG_IIO_TRIGGERED_BUFFER=m
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2

#
# Analog to digital converters
#
# CONFIG_AD7266 is not set

#
# Amplifiers
#
CONFIG_AD8366=m

#
# Light sensors
#
# CONFIG_ADJD_S311 is not set
# CONFIG_VCNL4000 is not set

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# CONFIG_AD9523 is not set

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# CONFIG_ADF4350 is not set

#
# Digital to analog converters
#
# CONFIG_AD5064 is not set
CONFIG_AD5360=m
CONFIG_AD5380=m
# CONFIG_AD5421 is not set
CONFIG_AD5624R_SPI=m
CONFIG_AD5446=m
# CONFIG_AD5504 is not set
# CONFIG_AD5764 is not set
CONFIG_AD5791=m
CONFIG_AD5686=m
# CONFIG_MCP4725 is not set
# CONFIG_VME_BUS is not set
# CONFIG_PWM is not set

#
# Firmware Drivers
#
# CONFIG_EDD is not set
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_DELL_RBU=m
CONFIG_DCDBAS=m
# CONFIG_ISCSI_IBFT_FIND is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_FS_POSIX_ACL is not set
CONFIG_FILE_LOCKING=y
# CONFIG_FSNOTIFY is not set
# CONFIG_DNOTIFY is not set
# CONFIG_INOTIFY_USER is not set
# CONFIG_FANOTIFY is not set
# CONFIG_QUOTA is not set
# CONFIG_QUOTACTL is not set
# CONFIG_AUTOFS4_FS is not set
CONFIG_FUSE_FS=m
# CONFIG_CUSE is not set

#
# Caches
#
CONFIG_FSCACHE=m
CONFIG_FSCACHE_STATS=y
# CONFIG_FSCACHE_HISTOGRAM is not set
CONFIG_FSCACHE_DEBUG=y
# CONFIG_FSCACHE_OBJECT_LIST is not set

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
# CONFIG_PROC_KCORE is not set
# CONFIG_PROC_SYSCTL is not set
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_SYSFS=y
# CONFIG_HUGETLBFS is not set
# CONFIG_HUGETLB_PAGE is not set
# CONFIG_CONFIGFS_FS is not set
# CONFIG_MISC_FILESYSTEMS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=m
# CONFIG_NLS_CODEPAGE_737 is not set
# CONFIG_NLS_CODEPAGE_775 is not set
CONFIG_NLS_CODEPAGE_850=m
CONFIG_NLS_CODEPAGE_852=m
# CONFIG_NLS_CODEPAGE_855 is not set
# CONFIG_NLS_CODEPAGE_857 is not set
# CONFIG_NLS_CODEPAGE_860 is not set
CONFIG_NLS_CODEPAGE_861=m
CONFIG_NLS_CODEPAGE_862=m
# CONFIG_NLS_CODEPAGE_863 is not set
# CONFIG_NLS_CODEPAGE_864 is not set
CONFIG_NLS_CODEPAGE_865=m
CONFIG_NLS_CODEPAGE_866=m
# CONFIG_NLS_CODEPAGE_869 is not set
# CONFIG_NLS_CODEPAGE_936 is not set
CONFIG_NLS_CODEPAGE_950=m
# CONFIG_NLS_CODEPAGE_932 is not set
CONFIG_NLS_CODEPAGE_949=m
CONFIG_NLS_CODEPAGE_874=m
CONFIG_NLS_ISO8859_8=m
# CONFIG_NLS_CODEPAGE_1250 is not set
CONFIG_NLS_CODEPAGE_1251=m
# CONFIG_NLS_ASCII is not set
# CONFIG_NLS_ISO8859_1 is not set
# CONFIG_NLS_ISO8859_2 is not set
CONFIG_NLS_ISO8859_3=m
# CONFIG_NLS_ISO8859_4 is not set
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=m
# CONFIG_NLS_ISO8859_7 is not set
CONFIG_NLS_ISO8859_9=m
# CONFIG_NLS_ISO8859_13 is not set
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=m
# CONFIG_NLS_KOI8_R is not set
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_MAC_ROMAN=m
# CONFIG_NLS_MAC_CELTIC is not set
# CONFIG_NLS_MAC_CENTEURO is not set
# CONFIG_NLS_MAC_CROATIAN is not set
CONFIG_NLS_MAC_CYRILLIC=m
CONFIG_NLS_MAC_GAELIC=m
CONFIG_NLS_MAC_GREEK=m
CONFIG_NLS_MAC_ICELAND=m
# CONFIG_NLS_MAC_INUIT is not set
CONFIG_NLS_MAC_ROMANIAN=m
# CONFIG_NLS_MAC_TURKISH is not set
# CONFIG_NLS_UTF8 is not set

#
# Kernel hacking
#
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_PRINTK_TIME=y
CONFIG_DEFAULT_MESSAGE_LOGLEVEL=4
CONFIG_ENABLE_WARN_DEPRECATED=y
CONFIG_ENABLE_MUST_CHECK=y
CONFIG_FRAME_WARN=1024
# CONFIG_MAGIC_SYSRQ is not set
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
CONFIG_UNUSED_SYMBOLS=y
CONFIG_DEBUG_FS=y
# CONFIG_HEADERS_CHECK is not set
# CONFIG_DEBUG_SECTION_MISMATCH is not set
CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_SHIRQ=y
# CONFIG_LOCKUP_DETECTOR is not set
# CONFIG_HARDLOCKUP_DETECTOR is not set
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=0
# CONFIG_SCHED_DEBUG is not set
# CONFIG_SCHEDSTATS is not set
# CONFIG_TIMER_STATS is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SLUB_STATS is not set
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_PI_LIST=y
CONFIG_RT_MUTEX_TESTER=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_LOCK_ALLOC=y
# CONFIG_PROVE_LOCKING is not set
# CONFIG_SPARSE_RCU_POINTER is not set
CONFIG_LOCKDEP=y
# CONFIG_LOCK_STAT is not set
CONFIG_DEBUG_LOCKDEP=y
CONFIG_DEBUG_ATOMIC_SLEEP=y
CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
CONFIG_STACKTRACE=y
CONFIG_DEBUG_STACK_USAGE=y
# CONFIG_DEBUG_KOBJECT is not set
# CONFIG_DEBUG_HIGHMEM is not set
CONFIG_DEBUG_BUGVERBOSE=y
# CONFIG_DEBUG_INFO is not set
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_VIRTUAL is not set
# CONFIG_DEBUG_WRITECOUNT is not set
# CONFIG_DEBUG_MEMORY_INIT is not set
# CONFIG_DEBUG_LIST is not set
CONFIG_TEST_LIST_SORT=y
CONFIG_DEBUG_SG=y
CONFIG_DEBUG_NOTIFIERS=y
CONFIG_DEBUG_CREDENTIALS=y
CONFIG_ARCH_WANT_FRAME_POINTERS=y
CONFIG_FRAME_POINTER=y
# CONFIG_BOOT_PRINTK_DELAY is not set
# CONFIG_RCU_TORTURE_TEST is not set
# CONFIG_RCU_TRACE is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
CONFIG_FAULT_INJECTION=y
CONFIG_FAILSLAB=y
CONFIG_FAIL_PAGE_ALLOC=y
# CONFIG_FAULT_INJECTION_DEBUG_FS is not set
# CONFIG_LATENCYTOP is not set
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_FP_TEST=y
CONFIG_HAVE_FUNCTION_TRACE_MCOUNT_TEST=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_EVENT_POWER_TRACING_DEPRECATED=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_FUNCTION_TRACER is not set
# CONFIG_IRQSOFF_TRACER is not set
# CONFIG_SCHED_TRACER is not set
CONFIG_FTRACE_SYSCALLS=y
CONFIG_TRACE_BRANCH_PROFILING=y
# CONFIG_BRANCH_PROFILE_NONE is not set
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
CONFIG_PROFILE_ALL_BRANCHES=y
CONFIG_TRACING_BRANCHES=y
CONFIG_BRANCH_TRACER=y
# CONFIG_STACK_TRACER is not set
# CONFIG_UPROBE_EVENT is not set
# CONFIG_PROBE_EVENTS is not set
CONFIG_FTRACE_SELFTEST=y
CONFIG_FTRACE_STARTUP_TEST=y
# CONFIG_EVENT_TRACE_TEST_SYSCALLS is not set
# CONFIG_MMIOTRACE is not set
# CONFIG_RING_BUFFER_BENCHMARK is not set
# CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
# CONFIG_DYNAMIC_DEBUG is not set
# CONFIG_DMA_API_DEBUG is not set
CONFIG_ATOMIC64_SELFTEST=y
# CONFIG_SAMPLES is not set
CONFIG_HAVE_ARCH_KGDB=y
CONFIG_HAVE_ARCH_KMEMCHECK=y
# CONFIG_TEST_KSTRTOX is not set
CONFIG_STRICT_DEVMEM=y
# CONFIG_X86_VERBOSE_BOOTUP is not set
# CONFIG_EARLY_PRINTK is not set
# CONFIG_DEBUG_STACKOVERFLOW is not set
CONFIG_X86_PTDUMP=y
# CONFIG_DEBUG_RODATA is not set
# CONFIG_DEBUG_SET_MODULE_RONX is not set
# CONFIG_DEBUG_NX_TEST is not set
# CONFIG_DOUBLEFAULT is not set
# CONFIG_DEBUG_TLBFLUSH is not set
CONFIG_IOMMU_STRESS=y
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
CONFIG_IO_DELAY_TYPE_0X80=0
CONFIG_IO_DELAY_TYPE_0XED=1
CONFIG_IO_DELAY_TYPE_UDELAY=2
CONFIG_IO_DELAY_TYPE_NONE=3
# CONFIG_IO_DELAY_0X80 is not set
CONFIG_IO_DELAY_0XED=y
# CONFIG_IO_DELAY_UDELAY is not set
# CONFIG_IO_DELAY_NONE is not set
CONFIG_DEFAULT_IO_DELAY_TYPE=1
CONFIG_DEBUG_BOOT_PARAMS=y
CONFIG_CPA_DEBUG=y
# CONFIG_OPTIMIZE_INLINING is not set
# CONFIG_DEBUG_NMI_SELFTEST is not set

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_ENCRYPTED_KEYS is not set
# CONFIG_KEYS_DEBUG_PROC_KEYS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
# CONFIG_SECURITY is not set
# CONFIG_SECURITYFS is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_DEFAULT_SECURITY=""
CONFIG_ASYNC_TX_DISABLE_PQ_VAL_DMA=y
CONFIG_ASYNC_TX_DISABLE_XOR_VAL_DMA=y
CONFIG_CRYPTO=m

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=m
CONFIG_CRYPTO_ALGAPI2=m
CONFIG_CRYPTO_AEAD=m
CONFIG_CRYPTO_AEAD2=m
CONFIG_CRYPTO_BLKCIPHER=m
CONFIG_CRYPTO_BLKCIPHER2=m
CONFIG_CRYPTO_HASH=m
CONFIG_CRYPTO_HASH2=m
CONFIG_CRYPTO_RNG=m
CONFIG_CRYPTO_RNG2=m
CONFIG_CRYPTO_PCOMP=m
CONFIG_CRYPTO_PCOMP2=m
CONFIG_CRYPTO_MANAGER=m
CONFIG_CRYPTO_MANAGER2=m
# CONFIG_CRYPTO_USER is not set
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=m
CONFIG_CRYPTO_NULL=m
CONFIG_CRYPTO_WORKQUEUE=m
CONFIG_CRYPTO_CRYPTD=m
# CONFIG_CRYPTO_AUTHENC is not set
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_ABLK_HELPER_X86=m
CONFIG_CRYPTO_GLUE_HELPER_X86=m

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=m
CONFIG_CRYPTO_SEQIV=m

#
# Block modes
#
# CONFIG_CRYPTO_CBC is not set
CONFIG_CRYPTO_CTR=m
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=m
CONFIG_CRYPTO_LRW=m
CONFIG_CRYPTO_PCBC=m
CONFIG_CRYPTO_XTS=m

#
# Hash modes
#
# CONFIG_CRYPTO_HMAC is not set

#
# Digest
#
CONFIG_CRYPTO_CRC32C=m
CONFIG_CRYPTO_CRC32C_INTEL=m
CONFIG_CRYPTO_GHASH=m
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=m
# CONFIG_CRYPTO_MICHAEL_MIC is not set
# CONFIG_CRYPTO_RMD128 is not set
CONFIG_CRYPTO_RMD160=m
# CONFIG_CRYPTO_RMD256 is not set
CONFIG_CRYPTO_RMD320=m
CONFIG_CRYPTO_SHA1=m
CONFIG_CRYPTO_SHA256=m
# CONFIG_CRYPTO_SHA512 is not set
# CONFIG_CRYPTO_TGR192 is not set
CONFIG_CRYPTO_WP512=m

#
# Ciphers
#
CONFIG_CRYPTO_AES=m
# CONFIG_CRYPTO_AES_586 is not set
# CONFIG_CRYPTO_AES_NI_INTEL is not set
CONFIG_CRYPTO_ANUBIS=m
CONFIG_CRYPTO_ARC4=m
# CONFIG_CRYPTO_BLOWFISH is not set
# CONFIG_CRYPTO_CAMELLIA is not set
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST6=m
# CONFIG_CRYPTO_DES is not set
# CONFIG_CRYPTO_FCRYPT is not set
CONFIG_CRYPTO_KHAZAD=m
CONFIG_CRYPTO_SEED=m
CONFIG_CRYPTO_SERPENT=m
CONFIG_CRYPTO_SERPENT_SSE2_586=m
CONFIG_CRYPTO_TEA=m
# CONFIG_CRYPTO_TWOFISH is not set
# CONFIG_CRYPTO_TWOFISH_586 is not set

#
# Compression
#
# CONFIG_CRYPTO_DEFLATE is not set
CONFIG_CRYPTO_ZLIB=m
CONFIG_CRYPTO_LZO=m

#
# Random Number Generation
#
CONFIG_CRYPTO_ANSI_CPRNG=m
# CONFIG_CRYPTO_USER_API_HASH is not set
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
CONFIG_CRYPTO_HW=y
# CONFIG_CRYPTO_DEV_PADLOCK is not set
# CONFIG_CRYPTO_DEV_GEODE is not set
# CONFIG_CRYPTO_DEV_HIFN_795X is not set
CONFIG_HAVE_KVM=y
CONFIG_VIRTUALIZATION=y
# CONFIG_KVM is not set
CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_BITREVERSE=m
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_FIND_FIRST_BIT=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_GENERIC_IO=y
CONFIG_CRC_CCITT=m
CONFIG_CRC16=m
# CONFIG_CRC_T10DIF is not set
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=m
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
CONFIG_CRC32_BIT=y
# CONFIG_CRC7 is not set
CONFIG_LIBCRC32C=m
CONFIG_CRC8=m
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=m
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_XZ_DEC=m
# CONFIG_XZ_DEC_X86 is not set
# CONFIG_XZ_DEC_POWERPC is not set
# CONFIG_XZ_DEC_IA64 is not set
# CONFIG_XZ_DEC_ARM is not set
# CONFIG_XZ_DEC_ARMTHUMB is not set
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT=y
CONFIG_HAS_DMA=y
CONFIG_DQL=y
CONFIG_NLATTR=y
CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=y
# CONFIG_AVERAGE is not set
CONFIG_CORDIC=m
# CONFIG_DDR is not set

--rwEMma7ioTxnRzrJ--
