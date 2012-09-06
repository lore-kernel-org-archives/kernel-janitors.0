From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 06 Sep 2012 12:24:54 +0000
Subject: Re: [staging:staging-next 1/1] drivers/staging/ipack/ipack.c:291:2: error: implicit declaration of f
Message-Id: <20120906122454.GA1911@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120906034033.GB17356@localhost>
In-Reply-To: <20120906034033.GB17356@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi Jens,

On Thu, Sep 06, 2012 at 02:18:21PM +0200, Jens Taprogge wrote:
> Hi Fengguang,
>=20
> I believe this problem has already been addressed by a patch titled
> "[PATCH] Staging: ipack: fix build failure in powerpc allyesconfig" by
> Sam Gons=C3=A1lvez.  It has been submitted to linux-next.

That would be good. Sorry lots of my reports are delayed for several
days due to a bug in the build script..

Thanks,
Fengguang

> On Thu, Sep 06, 2012 at 11:40:33AM +0800, Fengguang Wu wrote:
> > Hi Jens,
> >=20
> > FYI, kernel build failed on
> >=20
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.gi=
t staging-next
> > head:   5d72c848d2a3b4af7f8f32d89af02a486d321bd6
> > commit: 5d72c848d2a3b4af7f8f32d89af02a486d321bd6 [1/1] Staging: ipack: =
Provide ID Prom through sysfs.
> > config: i386-randconfig-b982 (attached as .config)
> >=20
> > All related error/warning messages:
> >=20
> > drivers/staging/ipack/ipack.c: In function 'ipack_device_read_id':
> > drivers/staging/ipack/ipack.c:291:2: error: implicit declaration of fun=
ction 'ioread8' [-Werror=3Dimplicit-function-declaration]
> > drivers/staging/ipack/ipack.c:309:3: error: implicit declaration of fun=
ction 'ioread16be' [-Werror=3Dimplicit-function-declaration]
> > cc1: some warnings being treated as errors
> >=20
> > ---
> > 0-DAY kernel build testing backend         Open Source Technology Centre
> > Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
>=20
> > #
> > # Automatically generated file; DO NOT EDIT.
> > # Linux/i386 3.6.0-rc3 Kernel Configuration
> > #
> > # CONFIG_64BIT is not set
> > CONFIG_X86_32=3Dy
> > # CONFIG_X86_64 is not set
> > CONFIG_X86=3Dy
> > CONFIG_INSTRUCTION_DECODER=3Dy
> > CONFIG_OUTPUT_FORMAT=3D"elf32-i386"
> > CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/i386_defconfig"
> > CONFIG_LOCKDEP_SUPPORT=3Dy
> > CONFIG_STACKTRACE_SUPPORT=3Dy
> > CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
> > CONFIG_MMU=3Dy
> > CONFIG_NEED_DMA_MAP_STATE=3Dy
> > CONFIG_NEED_SG_DMA_LENGTH=3Dy
> > CONFIG_GENERIC_ISA_DMA=3Dy
> > CONFIG_GENERIC_BUG=3Dy
> > CONFIG_GENERIC_HWEIGHT=3Dy
> > CONFIG_GENERIC_GPIO=3Dy
> > CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
> > # CONFIG_RWSEM_GENERIC_SPINLOCK is not set
> > CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
> > CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> > CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> > CONFIG_ARCH_HAS_DEFAULT_IDLE=3Dy
> > CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> > CONFIG_ARCH_HAS_CPU_AUTOPROBE=3Dy
> > CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> > CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> > CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> > CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> > CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> > # CONFIG_ZONE_DMA32 is not set
> > # CONFIG_AUDIT_ARCH is not set
> > CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=3Dy
> > CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> > CONFIG_ARCH_HWEIGHT_CFLAGS=3D"-fcall-saved-ecx -fcall-saved-edx"
> > CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> > CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
> > CONFIG_CONSTRUCTORS=3Dy
> > CONFIG_HAVE_IRQ_WORK=3Dy
> > CONFIG_IRQ_WORK=3Dy
> > CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
> >=20
> > #
> > # General setup
> > #
> > CONFIG_EXPERIMENTAL=3Dy
> > CONFIG_BROKEN_ON_SMP=3Dy
> > CONFIG_INIT_ENV_ARG_LIMIT2
> > CONFIG_CROSS_COMPILE=3D""
> > CONFIG_LOCALVERSION=3D""
> > CONFIG_LOCALVERSION_AUTO=3Dy
> > CONFIG_HAVE_KERNEL_GZIP=3Dy
> > CONFIG_HAVE_KERNEL_BZIP2=3Dy
> > CONFIG_HAVE_KERNEL_LZMA=3Dy
> > CONFIG_HAVE_KERNEL_XZ=3Dy
> > CONFIG_HAVE_KERNEL_LZO=3Dy
> > # CONFIG_KERNEL_GZIP is not set
> > # CONFIG_KERNEL_BZIP2 is not set
> > # CONFIG_KERNEL_LZMA is not set
> > # CONFIG_KERNEL_XZ is not set
> > CONFIG_KERNEL_LZO=3Dy
> > CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> > # CONFIG_SYSVIPC is not set
> > # CONFIG_POSIX_MQUEUE is not set
> > # CONFIG_BSD_PROCESS_ACCT is not set
> > CONFIG_FHANDLE=3Dy
> > # CONFIG_TASKSTATS is not set
> > # CONFIG_AUDIT is not set
> > CONFIG_HAVE_GENERIC_HARDIRQS=3Dy
> >=20
> > #
> > # IRQ subsystem
> > #
> > CONFIG_GENERIC_HARDIRQS=3Dy
> > CONFIG_GENERIC_IRQ_PROBE=3Dy
> > CONFIG_GENERIC_IRQ_SHOW=3Dy
> > CONFIG_IRQ_DOMAIN=3Dy
> > CONFIG_IRQ_DOMAIN_DEBUG=3Dy
> > CONFIG_IRQ_FORCED_THREADING=3Dy
> > CONFIG_SPARSE_IRQ=3Dy
> > CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> > CONFIG_KTIME_SCALAR=3Dy
> > CONFIG_GENERIC_CLOCKEVENTS=3Dy
> > CONFIG_GENERIC_CLOCKEVENTS_BUILD=3Dy
> > CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> > CONFIG_GENERIC_CMOS_UPDATE=3Dy
> >=20
> > #
> > # Timers subsystem
> > #
> > # CONFIG_NO_HZ is not set
> > # CONFIG_HIGH_RES_TIMERS is not set
> >=20
> > #
> > # RCU Subsystem
> > #
> > CONFIG_TINY_PREEMPT_RCU=3Dy
> > CONFIG_PREEMPT_RCU=3Dy
> > # CONFIG_TREE_RCU_TRACE is not set
> > CONFIG_RCU_BOOST=3Dy
> > CONFIG_RCU_BOOST_PRIO=3D1
> > CONFIG_RCU_BOOST_DELAYP0
> > CONFIG_IKCONFIG=3Dy
> > CONFIG_LOG_BUF_SHIFT=17
> > CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> > # CONFIG_CHECKPOINT_RESTORE is not set
> > # CONFIG_NAMESPACES is not set
> > # CONFIG_SCHED_AUTOGROUP is not set
> > # CONFIG_RELAY is not set
> > CONFIG_BLK_DEV_INITRD=3Dy
> > CONFIG_INITRAMFS_SOURCE=3D""
> > CONFIG_RD_GZIP=3Dy
> > CONFIG_RD_BZIP2=3Dy
> > CONFIG_RD_LZMA=3Dy
> > # CONFIG_RD_XZ is not set
> > CONFIG_RD_LZO=3Dy
> > # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> > CONFIG_ANON_INODES=3Dy
> > CONFIG_EXPERT=3Dy
> > # CONFIG_UID16 is not set
> > CONFIG_KALLSYMS=3Dy
> > CONFIG_KALLSYMS_ALL=3Dy
> > # CONFIG_HOTPLUG is not set
> > CONFIG_PRINTK=3Dy
> > CONFIG_BUG=3Dy
> > CONFIG_ELF_CORE=3Dy
> > CONFIG_PCSPKR_PLATFORM=3Dy
> > CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> > CONFIG_BASE_FULL=3Dy
> > CONFIG_FUTEX=3Dy
> > # CONFIG_EPOLL is not set
> > # CONFIG_SIGNALFD is not set
> > # CONFIG_TIMERFD is not set
> > # CONFIG_EVENTFD is not set
> > CONFIG_SHMEM=3Dy
> > CONFIG_AIO=3Dy
> > # CONFIG_EMBEDDED is not set
> > CONFIG_HAVE_PERF_EVENTS=3Dy
> >=20
> > #
> > # Kernel Performance Events And Counters
> > #
> > CONFIG_PERF_EVENTS=3Dy
> > # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> > CONFIG_VM_EVENT_COUNTERS=3Dy
> > CONFIG_PCI_QUIRKS=3Dy
> > CONFIG_COMPAT_BRK=3Dy
> > # CONFIG_SLAB is not set
> > # CONFIG_SLUB is not set
> > CONFIG_SLOB=3Dy
> > CONFIG_PROFILING=3Dy
> > CONFIG_OPROFILE=3Dm
> > CONFIG_OPROFILE_EVENT_MULTIPLEX=3Dy
> > CONFIG_HAVE_OPROFILE=3Dy
> > CONFIG_OPROFILE_NMI_TIMER=3Dy
> > # CONFIG_KPROBES is not set
> > CONFIG_JUMP_LABEL=3Dy
> > CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> > CONFIG_HAVE_IOREMAP_PROT=3Dy
> > CONFIG_HAVE_KPROBES=3Dy
> > CONFIG_HAVE_KRETPROBES=3Dy
> > CONFIG_HAVE_OPTPROBES=3Dy
> > CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> > CONFIG_HAVE_DMA_ATTRS=3Dy
> > CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> > CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> > CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> > CONFIG_HAVE_DMA_API_DEBUG=3Dy
> > CONFIG_HAVE_HW_BREAKPOINT=3Dy
> > CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> > CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> > CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> > CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> > CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> > CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> > CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> > CONFIG_ARCH_WANT_IPC_PARSE_VERSION=3Dy
> > CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> > CONFIG_SECCOMP_FILTER=3Dy
> >=20
> > #
> > # GCOV-based kernel profiling
> > #
> > CONFIG_GCOV_KERNEL=3Dy
> > CONFIG_GCOV_PROFILE_ALL=3Dy
> > CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
> > CONFIG_RT_MUTEXES=3Dy
> > CONFIG_BASE_SMALL=3D0
> > CONFIG_MODULES=3Dy
> > # CONFIG_MODULE_FORCE_LOAD is not set
> > # CONFIG_MODULE_UNLOAD is not set
> > CONFIG_MODVERSIONS=3Dy
> > # CONFIG_MODULE_SRCVERSION_ALL is not set
> > # CONFIG_BLOCK is not set
> > # CONFIG_INLINE_SPIN_TRYLOCK is not set
> > # CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
> > # CONFIG_INLINE_SPIN_LOCK is not set
> > # CONFIG_INLINE_SPIN_LOCK_BH is not set
> > # CONFIG_INLINE_SPIN_LOCK_IRQ is not set
> > # CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
> > CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> > # CONFIG_INLINE_SPIN_UNLOCK_BH is not set
> > # CONFIG_INLINE_SPIN_UNLOCK_IRQ is not set
> > # CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
> > # CONFIG_INLINE_READ_TRYLOCK is not set
> > # CONFIG_INLINE_READ_LOCK is not set
> > # CONFIG_INLINE_READ_LOCK_BH is not set
> > # CONFIG_INLINE_READ_LOCK_IRQ is not set
> > # CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
> > # CONFIG_INLINE_READ_UNLOCK is not set
> > # CONFIG_INLINE_READ_UNLOCK_BH is not set
> > # CONFIG_INLINE_READ_UNLOCK_IRQ is not set
> > # CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
> > # CONFIG_INLINE_WRITE_TRYLOCK is not set
> > # CONFIG_INLINE_WRITE_LOCK is not set
> > # CONFIG_INLINE_WRITE_LOCK_BH is not set
> > # CONFIG_INLINE_WRITE_LOCK_IRQ is not set
> > # CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
> > # CONFIG_INLINE_WRITE_UNLOCK is not set
> > # CONFIG_INLINE_WRITE_UNLOCK_BH is not set
> > # CONFIG_INLINE_WRITE_UNLOCK_IRQ is not set
> > # CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
> > # CONFIG_MUTEX_SPIN_ON_OWNER is not set
> > CONFIG_FREEZER=3Dy
> >=20
> > #
> > # Processor type and features
> > #
> > # CONFIG_ZONE_DMA is not set
> > # CONFIG_SMP is not set
> > # CONFIG_X86_EXTENDED_PLATFORM is not set
> > CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
> > # CONFIG_X86_32_IRIS is not set
> > # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> > CONFIG_PARAVIRT_GUEST=3Dy
> > CONFIG_PARAVIRT_TIME_ACCOUNTING=3Dy
> > # CONFIG_XEN_PRIVILEGED_GUEST is not set
> > # CONFIG_KVM_CLOCK is not set
> > CONFIG_KVM_GUEST=3Dy
> > CONFIG_LGUEST_GUEST=3Dy
> > CONFIG_PARAVIRT=3Dy
> > # CONFIG_PARAVIRT_DEBUG is not set
> > CONFIG_NO_BOOTMEM=3Dy
> > CONFIG_MEMTEST=3Dy
> > # CONFIG_M386 is not set
> > # CONFIG_M486 is not set
> > # CONFIG_M586 is not set
> > # CONFIG_M586TSC is not set
> > # CONFIG_M586MMX is not set
> > CONFIG_M686=3Dy
> > # CONFIG_MPENTIUMII is not set
> > # CONFIG_MPENTIUMIII is not set
> > # CONFIG_MPENTIUMM is not set
> > # CONFIG_MPENTIUM4 is not set
> > # CONFIG_MK6 is not set
> > # CONFIG_MK7 is not set
> > # CONFIG_MK8 is not set
> > # CONFIG_MCRUSOE is not set
> > # CONFIG_MEFFICEON is not set
> > # CONFIG_MWINCHIPC6 is not set
> > # CONFIG_MWINCHIP3D is not set
> > # CONFIG_MELAN is not set
> > # CONFIG_MGEODEGX1 is not set
> > # CONFIG_MGEODE_LX is not set
> > # CONFIG_MCYRIXIII is not set
> > # CONFIG_MVIAC3_2 is not set
> > # CONFIG_MVIAC7 is not set
> > # CONFIG_MCORE2 is not set
> > # CONFIG_MATOM is not set
> > CONFIG_X86_GENERIC=3Dy
> > CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
> > CONFIG_X86_CMPXCHG=3Dy
> > CONFIG_X86_L1_CACHE_SHIFT=3D6
> > CONFIG_X86_XADD=3Dy
> > CONFIG_X86_PPRO_FENCE=3Dy
> > CONFIG_X86_WP_WORKS_OK=3Dy
> > CONFIG_X86_INVLPG=3Dy
> > CONFIG_X86_BSWAP=3Dy
> > CONFIG_X86_POPAD_OK=3Dy
> > CONFIG_X86_INTEL_USERCOPY=3Dy
> > CONFIG_X86_USE_PPRO_CHECKSUM=3Dy
> > CONFIG_X86_TSC=3Dy
> > CONFIG_X86_CMPXCHG64=3Dy
> > CONFIG_X86_CMOV=3Dy
> > CONFIG_X86_MINIMUM_CPU_FAMILY=3D5
> > CONFIG_X86_DEBUGCTLMSR=3Dy
> > # CONFIG_PROCESSOR_SELECT is not set
> > CONFIG_CPU_SUP_INTEL=3Dy
> > CONFIG_CPU_SUP_CYRIX_32=3Dy
> > CONFIG_CPU_SUP_AMD=3Dy
> > CONFIG_CPU_SUP_CENTAUR=3Dy
> > CONFIG_CPU_SUP_TRANSMETA_32=3Dy
> > CONFIG_CPU_SUP_UMC_32=3Dy
> > CONFIG_HPET_TIMER=3Dy
> > # CONFIG_DMI is not set
> > # CONFIG_IOMMU_HELPER is not set
> > CONFIG_NR_CPUS=3D1
> > # CONFIG_IRQ_TIME_ACCOUNTING is not set
> > # CONFIG_PREEMPT_NONE is not set
> > # CONFIG_PREEMPT_VOLUNTARY is not set
> > CONFIG_PREEMPT=3Dy
> > CONFIG_PREEMPT_COUNT=3Dy
> > # CONFIG_X86_UP_APIC is not set
> > CONFIG_X86_MCE=3Dy
> > # CONFIG_X86_ANCIENT_MCE is not set
> > # CONFIG_X86_MCE_INJECT is not set
> > # CONFIG_VM86 is not set
> > CONFIG_TOSHIBA=3Dm
> > CONFIG_I8K=3Dm
> > # CONFIG_X86_REBOOTFIXUPS is not set
> > CONFIG_MICROCODE=3Dm
> > CONFIG_MICROCODE_INTEL=3Dy
> > # CONFIG_MICROCODE_AMD is not set
> > CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> > CONFIG_X86_MSR=3Dm
> > # CONFIG_X86_CPUID is not set
> > # CONFIG_NOHIGHMEM is not set
> > CONFIG_HIGHMEM4G=3Dy
> > # CONFIG_HIGHMEM64G is not set
> > # CONFIG_VMSPLIT_3G is not set
> > # CONFIG_VMSPLIT_3G_OPT is not set
> > # CONFIG_VMSPLIT_2G is not set
> > # CONFIG_VMSPLIT_2G_OPT is not set
> > CONFIG_VMSPLIT_1G=3Dy
> > CONFIG_PAGE_OFFSET=3D0x40000000
> > CONFIG_HIGHMEM=3Dy
> > # CONFIG_ARCH_PHYS_ADDR_T_64BIT is not set
> > # CONFIG_ARCH_DMA_ADDR_T_64BIT is not set
> > CONFIG_ARCH_FLATMEM_ENABLE=3Dy
> > CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> > CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> > CONFIG_ILLEGAL_POINTER_VALUE=3D0
> > CONFIG_SELECT_MEMORY_MODEL=3Dy
> > CONFIG_FLATMEM_MANUAL=3Dy
> > # CONFIG_SPARSEMEM_MANUAL is not set
> > CONFIG_FLATMEM=3Dy
> > CONFIG_FLAT_NODE_MEM_MAP=3Dy
> > CONFIG_SPARSEMEM_STATIC=3Dy
> > CONFIG_HAVE_MEMBLOCK=3Dy
> > CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
> > CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
> > CONFIG_MEMORY_ISOLATION=3Dy
> > CONFIG_PAGEFLAGS_EXTENDED=3Dy
> > CONFIG_SPLIT_PTLOCK_CPUS=999999
> > CONFIG_COMPACTION=3Dy
> > CONFIG_MIGRATION=3Dy
> > # CONFIG_PHYS_ADDR_T_64BIT is not set
> > CONFIG_ZONE_DMA_FLAG=3D0
> > CONFIG_VIRT_TO_BUS=3Dy
> > # CONFIG_KSM is not set
> > CONFIG_DEFAULT_MMAP_MIN_ADDR@96
> > CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
> > CONFIG_MEMORY_FAILURE=3Dy
> > # CONFIG_TRANSPARENT_HUGEPAGE is not set
> > # CONFIG_CROSS_MEMORY_ATTACH is not set
> > CONFIG_NEED_PER_CPU_KM=3Dy
> > # CONFIG_CLEANCACHE is not set
> > CONFIG_HIGHPTE=3Dy
> > CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
> > # CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
> > CONFIG_X86_RESERVE_LOWd
> > # CONFIG_MATH_EMULATION is not set
> > # CONFIG_MTRR is not set
> > CONFIG_ARCH_RANDOM=3Dy
> > # CONFIG_EFI is not set
> > CONFIG_SECCOMP=3Dy
> > CONFIG_CC_STACKPROTECTOR=3Dy
> > CONFIG_HZ_100=3Dy
> > # CONFIG_HZ_250 is not set
> > # CONFIG_HZ_300 is not set
> > # CONFIG_HZ_1000 is not set
> > CONFIG_HZ=100
> > # CONFIG_SCHED_HRTICK is not set
> > CONFIG_KEXEC=3Dy
> > CONFIG_CRASH_DUMP=3Dy
> > CONFIG_PHYSICAL_START=3D0x1000000
> > # CONFIG_RELOCATABLE is not set
> > CONFIG_PHYSICAL_ALIGN=3D0x1000000
> > CONFIG_COMPAT_VDSO=3Dy
> > # CONFIG_CMDLINE_BOOL is not set
> > CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> >=20
> > #
> > # Power management and ACPI options
> > #
> > CONFIG_SUSPEND=3Dy
> > CONFIG_SUSPEND_FREEZER=3Dy
> > CONFIG_PM_SLEEP=3Dy
> > CONFIG_PM_AUTOSLEEP=3Dy
> > # CONFIG_PM_WAKELOCKS is not set
> > # CONFIG_PM_RUNTIME is not set
> > CONFIG_PM=3Dy
> > CONFIG_PM_DEBUG=3Dy
> > CONFIG_PM_ADVANCED_DEBUG=3Dy
> > CONFIG_PM_TEST_SUSPEND=3Dy
> > CONFIG_PM_SLEEP_DEBUG=3Dy
> > CONFIG_PM_TRACE=3Dy
> > CONFIG_PM_TRACE_RTC=3Dy
> > CONFIG_ACPI=3Dy
> > CONFIG_ACPI_SLEEP=3Dy
> > # CONFIG_ACPI_EC_DEBUGFS is not set
> > CONFIG_ACPI_AC=3Dy
> > CONFIG_ACPI_BATTERY=3Dy
> > CONFIG_ACPI_BUTTON=3Dy
> > CONFIG_ACPI_FAN=3Dy
> > # CONFIG_ACPI_DOCK is not set
> > CONFIG_ACPI_PROCESSOR=3Dy
> > # CONFIG_ACPI_IPMI is not set
> > # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
> > CONFIG_ACPI_THERMAL=3Dy
> > CONFIG_ACPI_CUSTOM_DSDT_FILE=3D""
> > # CONFIG_ACPI_CUSTOM_DSDT is not set
> > CONFIG_ACPI_BLACKLIST_YEAR=3D0
> > # CONFIG_ACPI_DEBUG is not set
> > CONFIG_X86_PM_TIMER=3Dy
> > # CONFIG_ACPI_CONTAINER is not set
> > # CONFIG_ACPI_SBS is not set
> > # CONFIG_ACPI_HED is not set
> > # CONFIG_ACPI_CUSTOM_METHOD is not set
> > # CONFIG_ACPI_BGRT is not set
> > # CONFIG_ACPI_APEI is not set
> > CONFIG_SFI=3Dy
> > CONFIG_X86_APM_BOOT=3Dy
> > CONFIG_APM=3Dm
> > # CONFIG_APM_IGNORE_USER_SUSPEND is not set
> > CONFIG_APM_DO_ENABLE=3Dy
> > # CONFIG_APM_CPU_IDLE is not set
> > CONFIG_APM_DISPLAY_BLANK=3Dy
> > # CONFIG_APM_ALLOW_INTS is not set
> >=20
> > #
> > # CPU Frequency scaling
> > #
> > CONFIG_CPU_FREQ=3Dy
> > CONFIG_CPU_FREQ_TABLE=3Dm
> > CONFIG_CPU_FREQ_STAT=3Dm
> > # CONFIG_CPU_FREQ_STAT_DETAILS is not set
> > CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=3Dy
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
> > CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> > CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dm
> > # CONFIG_CPU_FREQ_GOV_USERSPACE is not set
> > CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dm
> > CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dm
> >=20
> > #
> > # x86 CPU frequency scaling drivers
> > #
> > # CONFIG_X86_PCC_CPUFREQ is not set
> > # CONFIG_X86_ACPI_CPUFREQ is not set
> > # CONFIG_X86_POWERNOW_K6 is not set
> > CONFIG_X86_POWERNOW_K7=3Dm
> > CONFIG_X86_POWERNOW_K7_ACPI=3Dy
> > # CONFIG_X86_POWERNOW_K8 is not set
> > # CONFIG_X86_GX_SUSPMOD is not set
> > CONFIG_X86_SPEEDSTEP_CENTRINO=3Dm
> > CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=3Dy
> > # CONFIG_X86_SPEEDSTEP_ICH is not set
> > # CONFIG_X86_SPEEDSTEP_SMI is not set
> > # CONFIG_X86_P4_CLOCKMOD is not set
> > # CONFIG_X86_CPUFREQ_NFORCE2 is not set
> > # CONFIG_X86_LONGRUN is not set
> > # CONFIG_X86_LONGHAUL is not set
> > CONFIG_X86_E_POWERSAVER=3Dm
> >=20
> > #
> > # shared options
> > #
> > # CONFIG_X86_SPEEDSTEP_LIB is not set
> > CONFIG_CPU_IDLE=3Dy
> > CONFIG_CPU_IDLE_GOV_LADDER=3Dy
> > # CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
> > # CONFIG_INTEL_IDLE is not set
> >=20
> > #
> > # Bus options (PCI etc.)
> > #
> > CONFIG_PCI=3Dy
> > # CONFIG_PCI_GOBIOS is not set
> > # CONFIG_PCI_GOMMCONFIG is not set
> > # CONFIG_PCI_GODIRECT is not set
> > # CONFIG_PCI_GOOLPC is not set
> > CONFIG_PCI_GOANY=3Dy
> > CONFIG_PCI_BIOS=3Dy
> > CONFIG_PCI_DIRECT=3Dy
> > CONFIG_PCI_MMCONFIG=3Dy
> > CONFIG_PCI_OLPC=3Dy
> > CONFIG_PCI_DOMAINS=3Dy
> > # CONFIG_PCI_CNB20LE_QUIRK is not set
> > # CONFIG_PCIEPORTBUS is not set
> > # CONFIG_ARCH_SUPPORTS_MSI is not set
> > # CONFIG_PCI_DEBUG is not set
> > # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> > # CONFIG_PCI_STUB is not set
> > # CONFIG_PCI_IOV is not set
> > # CONFIG_PCI_PRI is not set
> > # CONFIG_PCI_PASID is not set
> > CONFIG_PCI_LABEL=3Dy
> > CONFIG_ISA_DMA_API=3Dy
> > # CONFIG_ISA is not set
> > CONFIG_SCx200=3Dm
> > CONFIG_SCx200HR_TIMER=3Dm
> > CONFIG_OLPC=3Dy
> > # CONFIG_OLPC_XO15_SCI is not set
> > CONFIG_ALIX=3Dy
> > # CONFIG_NET5501 is not set
> > CONFIG_AMD_NB=3Dy
> > # CONFIG_RAPIDIO is not set
> >=20
> > #
> > # Executable file formats / Emulations
> > #
> > CONFIG_BINFMT_ELF=3Dy
> > CONFIG_ARCH_BINFMT_ELF_RANDOMIZE_PIE=3Dy
> > CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
> > CONFIG_HAVE_AOUT=3Dy
> > # CONFIG_BINFMT_AOUT is not set
> > # CONFIG_BINFMT_MISC is not set
> > CONFIG_HAVE_ATOMIC_IOMAP=3Dy
> > CONFIG_HAVE_TEXT_POKE_SMP=3Dy
> > CONFIG_NET=3Dy
> >=20
> > #
> > # Networking options
> > #
> > # CONFIG_PACKET is not set
> > CONFIG_UNIX=3Dy
> > # CONFIG_UNIX_DIAG is not set
> > # CONFIG_NET_KEY is not set
> > # CONFIG_INET is not set
> > # CONFIG_NETWORK_SECMARK is not set
> > # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> > # CONFIG_NETFILTER is not set
> > # CONFIG_ATM is not set
> > # CONFIG_BRIDGE is not set
> > # CONFIG_VLAN_8021Q is not set
> > # CONFIG_DECNET is not set
> > # CONFIG_LLC2 is not set
> > # CONFIG_IPX is not set
> > # CONFIG_ATALK is not set
> > # CONFIG_X25 is not set
> > # CONFIG_LAPB is not set
> > # CONFIG_WAN_ROUTER is not set
> > # CONFIG_PHONET is not set
> > # CONFIG_IEEE802154 is not set
> > # CONFIG_NET_SCHED is not set
> > # CONFIG_DCB is not set
> > # CONFIG_BATMAN_ADV is not set
> > # CONFIG_OPENVSWITCH is not set
> >=20
> > #
> > # Network testing
> > #
> > # CONFIG_HAMRADIO is not set
> > # CONFIG_CAN is not set
> > # CONFIG_IRDA is not set
> > # CONFIG_BT is not set
> > CONFIG_WIRELESS=3Dy
> > # CONFIG_CFG80211 is not set
> > # CONFIG_LIB80211 is not set
> >=20
> > #
> > # CFG80211 needs to be enabled for MAC80211
> > #
> > # CONFIG_WIMAX is not set
> > # CONFIG_RFKILL is not set
> > # CONFIG_RFKILL_REGULATOR is not set
> > # CONFIG_NET_9P is not set
> > # CONFIG_CAIF is not set
> > # CONFIG_NFC is not set
> >=20
> > #
> > # Device Drivers
> > #
> >=20
> > #
> > # Generic Driver Options
> > #
> > # CONFIG_STANDALONE is not set
> > CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> > CONFIG_FW_LOADER=3Dm
> > # CONFIG_FIRMWARE_IN_KERNEL is not set
> > CONFIG_EXTRA_FIRMWARE=3D""
> > # CONFIG_DEBUG_DRIVER is not set
> > # CONFIG_DEBUG_DEVRES is not set
> > # CONFIG_SYS_HYPERVISOR is not set
> > # CONFIG_GENERIC_CPU_DEVICES is not set
> > # CONFIG_DMA_SHARED_BUFFER is not set
> > # CONFIG_CMA is not set
> > # CONFIG_CONNECTOR is not set
> > CONFIG_MTD=3Dm
> > # CONFIG_MTD_TESTS is not set
> > # CONFIG_MTD_REDBOOT_PARTS is not set
> > CONFIG_MTD_OF_PARTS=3Dm
> > CONFIG_MTD_AR7_PARTS=3Dm
> >=20
> > #
> > # User Modules And Translation Layers
> > #
> > # CONFIG_MTD_CHAR is not set
> > CONFIG_MTD_OOPS=3Dm
> >=20
> > #
> > # RAM/ROM/Flash chip drivers
> > #
> > # CONFIG_MTD_CFI is not set
> > CONFIG_MTD_JEDECPROBE=3Dm
> > CONFIG_MTD_GEN_PROBE=3Dm
> > # CONFIG_MTD_CFI_ADV_OPTIONS is not set
> > CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> > CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> > CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> > # CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
> > # CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
> > # CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
> > CONFIG_MTD_CFI_I1=3Dy
> > CONFIG_MTD_CFI_I2=3Dy
> > # CONFIG_MTD_CFI_I4 is not set
> > # CONFIG_MTD_CFI_I8 is not set
> > CONFIG_MTD_CFI_INTELEXT=3Dm
> > # CONFIG_MTD_CFI_AMDSTD is not set
> > # CONFIG_MTD_CFI_STAA is not set
> > CONFIG_MTD_CFI_UTIL=3Dm
> > CONFIG_MTD_RAM=3Dm
> > CONFIG_MTD_ROM=3Dm
> > # CONFIG_MTD_ABSENT is not set
> >=20
> > #
> > # Mapping drivers for chip access
> > #
> > # CONFIG_MTD_COMPLEX_MAPPINGS is not set
> > # CONFIG_MTD_PHYSMAP is not set
> > # CONFIG_MTD_PHYSMAP_OF is not set
> > # CONFIG_MTD_TS5500 is not set
> > CONFIG_MTD_AMD76XROM=3Dm
> > # CONFIG_MTD_ICHXROM is not set
> > # CONFIG_MTD_ESB2ROM is not set
> > # CONFIG_MTD_CK804XROM is not set
> > # CONFIG_MTD_SCB2_FLASH is not set
> > CONFIG_MTD_NETtel=3Dm
> > CONFIG_MTD_L440GX=3Dm
> > # CONFIG_MTD_INTEL_VR_NOR is not set
> > # CONFIG_MTD_PLATRAM is not set
> >=20
> > #
> > # Self-contained MTD device drivers
> > #
> > # CONFIG_MTD_PMC551 is not set
> > CONFIG_MTD_SLRAM=3Dm
> > # CONFIG_MTD_PHRAM is not set
> > CONFIG_MTD_MTDRAM=3Dm
> > CONFIG_MTDRAM_TOTAL_SIZE@96
> > CONFIG_MTDRAM_ERASE_SIZE=128
> >=20
> > #
> > # Disk-On-Chip Device Drivers
> > #
> > CONFIG_MTD_DOC2000=3Dm
> > CONFIG_MTD_DOC2001=3Dm
> > # CONFIG_MTD_DOC2001PLUS is not set
> > # CONFIG_MTD_DOCG3 is not set
> > CONFIG_MTD_DOCPROBE=3Dm
> > CONFIG_MTD_DOCECC=3Dm
> > # CONFIG_MTD_DOCPROBE_ADVANCED is not set
> > CONFIG_MTD_DOCPROBE_ADDRESS=3D0x0
> > CONFIG_MTD_NAND_ECC=3Dm
> > CONFIG_MTD_NAND_ECC_SMC=3Dy
> > CONFIG_MTD_NAND=3Dm
> > # CONFIG_MTD_NAND_VERIFY_WRITE is not set
> > # CONFIG_MTD_NAND_ECC_BCH is not set
> > # CONFIG_MTD_SM_COMMON is not set
> > CONFIG_MTD_NAND_MUSEUM_IDS=3Dy
> > # CONFIG_MTD_NAND_DENALI is not set
> > CONFIG_MTD_NAND_IDS=3Dm
> > # CONFIG_MTD_NAND_RICOH is not set
> > CONFIG_MTD_NAND_DISKONCHIP=3Dm
> > CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED=3Dy
> > CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=3D0
> > CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH=3Dy
> > # CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE is not set
> > CONFIG_MTD_NAND_DOCG4=3Dm
> > # CONFIG_MTD_NAND_CAFE is not set
> > # CONFIG_MTD_NAND_CS553X is not set
> > CONFIG_MTD_NAND_NANDSIM=3Dm
> > # CONFIG_MTD_NAND_PLATFORM is not set
> > CONFIG_MTD_ONENAND=3Dm
> > # CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
> > CONFIG_MTD_ONENAND_GENERIC=3Dm
> > # CONFIG_MTD_ONENAND_OTP is not set
> > CONFIG_MTD_ONENAND_2X_PROGRAM=3Dy
> > CONFIG_MTD_ONENAND_SIM=3Dm
> >=20
> > #
> > # LPDDR flash memory drivers
> > #
> > # CONFIG_MTD_LPDDR is not set
> > CONFIG_MTD_UBI=3Dm
> > CONFIG_MTD_UBI_WL_THRESHOLD@96
> > CONFIG_MTD_UBI_BEB_RESERVE=3D2
> > # CONFIG_MTD_UBI_GLUEBI is not set
> > CONFIG_OF=3Dy
> >=20
> > #
> > # Device Tree and Open Firmware support
> > #
> > CONFIG_OF_SELFTEST=3Dy
> > CONFIG_OF_PROMTREE=3Dy
> > CONFIG_OF_ADDRESS=3Dy
> > CONFIG_OF_IRQ=3Dy
> > CONFIG_OF_DEVICE=3Dy
> > CONFIG_OF_PCI=3Dy
> > CONFIG_OF_PCI_IRQ=3Dy
> > CONFIG_OF_MTD=3Dy
> > CONFIG_PARPORT=3Dm
> > # CONFIG_PARPORT_PC is not set
> > # CONFIG_PARPORT_GSC is not set
> > CONFIG_PARPORT_AX88796=3Dm
> > CONFIG_PARPORT_1284=3Dy
> > CONFIG_PARPORT_NOT_PC=3Dy
> > CONFIG_PNP=3Dy
> > CONFIG_PNP_DEBUG_MESSAGES=3Dy
> >=20
> > #
> > # Protocols
> > #
> > CONFIG_PNPACPI=3Dy
> >=20
> > #
> > # Misc devices
> > #
> > # CONFIG_SENSORS_LIS3LV02D is not set
> > # CONFIG_IBM_ASM is not set
> > # CONFIG_PHANTOM is not set
> > # CONFIG_INTEL_MID_PTI is not set
> > # CONFIG_SGI_IOC4 is not set
> > # CONFIG_TIFM_CORE is not set
> > CONFIG_ENCLOSURE_SERVICES=3Dm
> > # CONFIG_HP_ILO is not set
> > CONFIG_VMWARE_BALLOON=3Dm
> > # CONFIG_PCH_PHUB is not set
> > # CONFIG_C2PORT is not set
> >=20
> > #
> > # EEPROM support
> > #
> > CONFIG_EEPROM_93CX6=3Dm
> > # CONFIG_CB710_CORE is not set
> >=20
> > #
> > # Texas Instruments shared transport line discipline
> > #
> > # CONFIG_TI_ST is not set
> >=20
> > #
> > # Altera FPGA firmware download module
> > #
> > CONFIG_HAVE_IDE=3Dy
> >=20
> > #
> > # SCSI device support
> > #
> > CONFIG_SCSI_MOD=3Dy
> > # CONFIG_SCSI_DMA is not set
> > # CONFIG_SCSI_NETLINK is not set
> > # CONFIG_FUSION is not set
> >=20
> > #
> > # IEEE 1394 (FireWire) support
> > #
> > # CONFIG_FIREWIRE is not set
> > # CONFIG_FIREWIRE_NOSY is not set
> > # CONFIG_I2O is not set
> > CONFIG_MACINTOSH_DRIVERS=3Dy
> > # CONFIG_NETDEVICES is not set
> > # CONFIG_ISDN is not set
> >=20
> > #
> > # Input device support
> > #
> > CONFIG_INPUT=3Dy
> > # CONFIG_INPUT_FF_MEMLESS is not set
> > # CONFIG_INPUT_POLLDEV is not set
> > # CONFIG_INPUT_SPARSEKMAP is not set
> > # CONFIG_INPUT_MATRIXKMAP is not set
> >=20
> > #
> > # Userland interfaces
> > #
> > CONFIG_INPUT_MOUSEDEV=3Dy
> > CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
> > CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
> > CONFIG_INPUT_MOUSEDEV_SCREEN_Yv8
> > # CONFIG_INPUT_JOYDEV is not set
> > # CONFIG_INPUT_EVDEV is not set
> > # CONFIG_INPUT_EVBUG is not set
> >=20
> > #
> > # Input Device Drivers
> > #
> > CONFIG_INPUT_KEYBOARD=3Dy
> > CONFIG_KEYBOARD_ATKBD=3Dy
> > # CONFIG_KEYBOARD_LKKBD is not set
> > # CONFIG_KEYBOARD_GPIO is not set
> > # CONFIG_KEYBOARD_GPIO_POLLED is not set
> > # CONFIG_KEYBOARD_MATRIX is not set
> > # CONFIG_KEYBOARD_NEWTON is not set
> > # CONFIG_KEYBOARD_OPENCORES is not set
> > # CONFIG_KEYBOARD_STOWAWAY is not set
> > # CONFIG_KEYBOARD_SUNKBD is not set
> > # CONFIG_KEYBOARD_OMAP4 is not set
> > # CONFIG_KEYBOARD_XTKBD is not set
> > CONFIG_INPUT_MOUSE=3Dy
> > CONFIG_MOUSE_PS2=3Dy
> > CONFIG_MOUSE_PS2_ALPS=3Dy
> > CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
> > CONFIG_MOUSE_PS2_SYNAPTICS=3Dy
> > CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
> > # CONFIG_MOUSE_PS2_ELANTECH is not set
> > # CONFIG_MOUSE_PS2_SENTELIC is not set
> > # CONFIG_MOUSE_PS2_TOUCHKIT is not set
> > # CONFIG_MOUSE_PS2_OLPC is not set
> > # CONFIG_MOUSE_SERIAL is not set
> > # CONFIG_MOUSE_APPLETOUCH is not set
> > # CONFIG_MOUSE_BCM5974 is not set
> > # CONFIG_MOUSE_VSXXXAA is not set
> > # CONFIG_MOUSE_GPIO is not set
> > # CONFIG_MOUSE_SYNAPTICS_USB is not set
> > # CONFIG_INPUT_JOYSTICK is not set
> > # CONFIG_INPUT_TABLET is not set
> > # CONFIG_INPUT_TOUCHSCREEN is not set
> > # CONFIG_INPUT_MISC is not set
> >=20
> > #
> > # Hardware I/O ports
> > #
> > CONFIG_SERIO=3Dy
> > CONFIG_SERIO_I8042=3Dy
> > CONFIG_SERIO_SERPORT=3Dy
> > # CONFIG_SERIO_CT82C710 is not set
> > # CONFIG_SERIO_PARKBD is not set
> > # CONFIG_SERIO_PCIPS2 is not set
> > CONFIG_SERIO_LIBPS2=3Dy
> > # CONFIG_SERIO_RAW is not set
> > # CONFIG_SERIO_ALTERA_PS2 is not set
> > # CONFIG_SERIO_PS2MULT is not set
> > CONFIG_GAMEPORT=3Dm
> > CONFIG_GAMEPORT_NS558=3Dm
> > # CONFIG_GAMEPORT_L4 is not set
> > # CONFIG_GAMEPORT_EMU10K1 is not set
> > # CONFIG_GAMEPORT_FM801 is not set
> >=20
> > #
> > # Character devices
> > #
> > # CONFIG_VT is not set
> > CONFIG_UNIX98_PTYS=3Dy
> > # CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
> > # CONFIG_LEGACY_PTYS is not set
> > # CONFIG_SERIAL_NONSTANDARD is not set
> > # CONFIG_NOZOMI is not set
> > # CONFIG_N_GSM is not set
> > CONFIG_TRACE_ROUTER=3Dm
> > CONFIG_TRACE_SINK=3Dm
> > # CONFIG_DEVKMEM is not set
> >=20
> > #
> > # Serial drivers
> > #
> > CONFIG_SERIAL_8250=3Dy
> > CONFIG_SERIAL_8250_CONSOLE=3Dy
> > CONFIG_FIX_EARLYCON_MEM=3Dy
> > CONFIG_SERIAL_8250_PCI=3Dy
> > CONFIG_SERIAL_8250_PNP=3Dy
> > CONFIG_SERIAL_8250_NR_UARTS=3D4
> > CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> > CONFIG_SERIAL_8250_EXTENDED=3Dy
> > CONFIG_SERIAL_8250_MANY_PORTS=3Dy
> > # CONFIG_SERIAL_8250_SHARE_IRQ is not set
> > CONFIG_SERIAL_8250_DETECT_IRQ=3Dy
> > # CONFIG_SERIAL_8250_RSA is not set
> > CONFIG_SERIAL_8250_DW=3Dm
> >=20
> > #
> > # Non-8250 serial port support
> > #
> > # CONFIG_SERIAL_MFD_HSU is not set
> > CONFIG_SERIAL_CORE=3Dy
> > CONFIG_SERIAL_CORE_CONSOLE=3Dy
> > # CONFIG_SERIAL_JSM is not set
> > # CONFIG_SERIAL_OF_PLATFORM is not set
> > CONFIG_SERIAL_TIMBERDALE=3Dm
> > CONFIG_SERIAL_ALTERA_JTAGUART=3Dm
> > CONFIG_SERIAL_ALTERA_UART=3Dm
> > CONFIG_SERIAL_ALTERA_UART_MAXPORTS=3D4
> > CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
> > # CONFIG_SERIAL_PCH_UART is not set
> > # CONFIG_SERIAL_XILINX_PS_UART is not set
> > # CONFIG_TTY_PRINTK is not set
> > # CONFIG_PRINTER is not set
> > CONFIG_PPDEV=3Dm
> > CONFIG_HVC_DRIVER=3Dy
> > CONFIG_VIRTIO_CONSOLE=3Dy
> > CONFIG_IPMI_HANDLER=3Dm
> > # CONFIG_IPMI_PANIC_EVENT is not set
> > CONFIG_IPMI_DEVICE_INTERFACE=3Dm
> > CONFIG_IPMI_SI=3Dm
> > # CONFIG_IPMI_WATCHDOG is not set
> > CONFIG_IPMI_POWEROFF=3Dm
> > # CONFIG_HW_RANDOM is not set
> > # CONFIG_NVRAM is not set
> > # CONFIG_R3964 is not set
> > # CONFIG_APPLICOM is not set
> > # CONFIG_SONYPI is not set
> > CONFIG_MWAVE=3Dm
> > # CONFIG_SCx200_GPIO is not set
> > # CONFIG_PC8736x_GPIO is not set
> > CONFIG_NSC_GPIO=3Dm
> > # CONFIG_HPET is not set
> > CONFIG_HANGCHECK_TIMER=3Dm
> > # CONFIG_TCG_TPM is not set
> > # CONFIG_TELCLOCK is not set
> > CONFIG_DEVPORT=3Dy
> > # CONFIG_I2C is not set
> > # CONFIG_SPI is not set
> > CONFIG_HSI=3Dm
> > CONFIG_HSI_BOARDINFO=3Dy
> >=20
> > #
> > # HSI clients
> > #
> > CONFIG_HSI_CHAR=3Dm
> >=20
> > #
> > # PPS support
> > #
> > CONFIG_PPS=3Dm
> > CONFIG_PPS_DEBUG=3Dy
> > # CONFIG_NTP_PPS is not set
> >=20
> > #
> > # PPS clients support
> > #
> > CONFIG_PPS_CLIENT_KTIMER=3Dm
> > CONFIG_PPS_CLIENT_LDISC=3Dm
> > # CONFIG_PPS_CLIENT_PARPORT is not set
> > CONFIG_PPS_CLIENT_GPIO=3Dm
> >=20
> > #
> > # PPS generators support
> > #
> >=20
> > #
> > # PTP clock support
> > #
> > # CONFIG_PTP_1588_CLOCK is not set
> > CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=3Dy
> > CONFIG_GPIOLIB=3Dy
> > CONFIG_OF_GPIO=3Dy
> > # CONFIG_DEBUG_GPIO is not set
> >=20
> > #
> > # Memory mapped GPIO drivers:
> > #
> > # CONFIG_GPIO_GENERIC_PLATFORM is not set
> > # CONFIG_GPIO_IT8761E is not set
> > # CONFIG_GPIO_SCH is not set
> > # CONFIG_GPIO_ICH is not set
> > # CONFIG_GPIO_VX855 is not set
> >=20
> > #
> > # I2C GPIO expanders:
> > #
> >=20
> > #
> > # PCI GPIO expanders:
> > #
> > # CONFIG_GPIO_BT8XX is not set
> > # CONFIG_GPIO_AMD8111 is not set
> > # CONFIG_GPIO_LANGWELL is not set
> > # CONFIG_GPIO_PCH is not set
> > # CONFIG_GPIO_ML_IOH is not set
> > # CONFIG_GPIO_SODAVILLE is not set
> > # CONFIG_GPIO_RDC321X is not set
> >=20
> > #
> > # SPI GPIO expanders:
> > #
> >=20
> > #
> > # AC97 GPIO expanders:
> > #
> >=20
> > #
> > # MODULbus GPIO expanders:
> > #
> > # CONFIG_W1 is not set
> > CONFIG_POWER_SUPPLY=3Dy
> > CONFIG_POWER_SUPPLY_DEBUG=3Dy
> > # CONFIG_PDA_POWER is not set
> > CONFIG_TEST_POWER=3Dm
> > # CONFIG_BATTERY_DS2780 is not set
> > # CONFIG_BATTERY_DS2781 is not set
> > CONFIG_BATTERY_OLPC=3Dm
> > CONFIG_BATTERY_BQ27x00=3Dm
> > # CONFIG_BATTERY_BQ27X00_PLATFORM is not set
> > CONFIG_CHARGER_MAX8903=3Dm
> > # CONFIG_CHARGER_GPIO is not set
> > # CONFIG_CHARGER_MANAGER is not set
> > # CONFIG_POWER_AVS is not set
> > CONFIG_HWMON=3Dm
> > CONFIG_HWMON_VID=3Dm
> > # CONFIG_HWMON_DEBUG_CHIP is not set
> >=20
> > #
> > # Native drivers
> > #
> > # CONFIG_SENSORS_K8TEMP is not set
> > # CONFIG_SENSORS_K10TEMP is not set
> > # CONFIG_SENSORS_FAM15H_POWER is not set
> > # CONFIG_SENSORS_I5K_AMB is not set
> > # CONFIG_SENSORS_F71805F is not set
> > CONFIG_SENSORS_F71882FG=3Dm
> > CONFIG_SENSORS_GPIO_FAN=3Dm
> > # CONFIG_SENSORS_CORETEMP is not set
> > CONFIG_SENSORS_IBMAEM=3Dm
> > CONFIG_SENSORS_IBMPEX=3Dm
> > CONFIG_SENSORS_IT87=3Dm
> > # CONFIG_SENSORS_NTC_THERMISTOR is not set
> > CONFIG_SENSORS_PC87360=3Dm
> > CONFIG_SENSORS_PC87427=3Dm
> > CONFIG_SENSORS_SHT15=3Dm
> > # CONFIG_SENSORS_SIS5595 is not set
> > CONFIG_SENSORS_SMSC47M1=3Dm
> > CONFIG_SENSORS_SMSC47B397=3Dm
> > # CONFIG_SENSORS_SCH56XX_COMMON is not set
> > # CONFIG_SENSORS_VIA_CPUTEMP is not set
> > # CONFIG_SENSORS_VIA686A is not set
> > CONFIG_SENSORS_VT1211=3Dm
> > # CONFIG_SENSORS_VT8231 is not set
> > CONFIG_SENSORS_W83627HF=3Dm
> > # CONFIG_SENSORS_W83627EHF is not set
> > # CONFIG_SENSORS_APPLESMC is not set
> >=20
> > #
> > # ACPI drivers
> > #
> > # CONFIG_SENSORS_ACPI_POWER is not set
> > # CONFIG_SENSORS_ATK0110 is not set
> > CONFIG_THERMAL=3Dy
> > # CONFIG_WATCHDOG is not set
> > CONFIG_SSB_POSSIBLE=3Dy
> >=20
> > #
> > # Sonics Silicon Backplane
> > #
> > CONFIG_SSB=3Dm
> > CONFIG_SSB_SPROM=3Dy
> > CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
> > CONFIG_SSB_PCIHOST=3Dy
> > # CONFIG_SSB_B43_PCI_BRIDGE is not set
> > CONFIG_SSB_SDIOHOST_POSSIBLE=3Dy
> > # CONFIG_SSB_SDIOHOST is not set
> > CONFIG_SSB_SILENT=3Dy
> > CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=3Dy
> > # CONFIG_SSB_DRIVER_PCICORE is not set
> > CONFIG_BCMA_POSSIBLE=3Dy
> >=20
> > #
> > # Broadcom specific AMBA
> > #
> > CONFIG_BCMA=3Dm
> > CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> > # CONFIG_BCMA_HOST_PCI is not set
> > # CONFIG_BCMA_DRIVER_GMAC_CMN is not set
> > CONFIG_BCMA_DEBUG=3Dy
> >=20
> > #
> > # Multifunction device drivers
> > #
> > CONFIG_MFD_CORE=3Dm
> > # CONFIG_MFD_SM501 is not set
> > CONFIG_HTC_PASIC3=3Dm
> > # CONFIG_MFD_TMIO is not set
> > CONFIG_ABX500_CORE=3Dy
> > # CONFIG_MFD_CS5535 is not set
> > # CONFIG_MFD_TIMBERDALE is not set
> > # CONFIG_LPC_SCH is not set
> > # CONFIG_LPC_ICH is not set
> > # CONFIG_MFD_RDC321X is not set
> > # CONFIG_MFD_JANZ_CMODIO is not set
> > # CONFIG_MFD_VX855 is not set
> > CONFIG_REGULATOR=3Dy
> > CONFIG_REGULATOR_DEBUG=3Dy
> > CONFIG_REGULATOR_DUMMY=3Dy
> > CONFIG_REGULATOR_FIXED_VOLTAGE=3Dm
> > # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> > CONFIG_REGULATOR_USERSPACE_CONSUMER=3Dm
> > # CONFIG_REGULATOR_GPIO is not set
> > # CONFIG_MEDIA_SUPPORT is not set
> >=20
> > #
> > # Graphics support
> > #
> > # CONFIG_AGP is not set
> > CONFIG_VGA_ARB=3Dy
> > CONFIG_VGA_ARB_MAX_GPUS=16
> > # CONFIG_VGA_SWITCHEROO is not set
> > # CONFIG_DRM is not set
> > # CONFIG_STUB_POULSBO is not set
> > # CONFIG_VGASTATE is not set
> > CONFIG_VIDEO_OUTPUT_CONTROL=3Dm
> > # CONFIG_FB is not set
> > # CONFIG_EXYNOS_VIDEO is not set
> > # CONFIG_BACKLIGHT_LCD_SUPPORT is not set
> > CONFIG_SOUND=3Dm
> > # CONFIG_SOUND_OSS_CORE is not set
> > # CONFIG_SND is not set
> > # CONFIG_SOUND_PRIME is not set
> >=20
> > #
> > # HID support
> > #
> > CONFIG_HID=3Dy
> > # CONFIG_HID_BATTERY_STRENGTH is not set
> > # CONFIG_HIDRAW is not set
> > # CONFIG_UHID is not set
> > CONFIG_HID_GENERIC=3Dy
> >=20
> > #
> > # Special HID drivers
> > #
> > CONFIG_USB_ARCH_HAS_OHCI=3Dy
> > CONFIG_USB_ARCH_HAS_EHCI=3Dy
> > CONFIG_USB_ARCH_HAS_XHCI=3Dy
> > CONFIG_USB_SUPPORT=3Dy
> > CONFIG_USB_ARCH_HAS_HCD=3Dy
> > # CONFIG_USB is not set
> > # CONFIG_USB_OTG_WHITELIST is not set
> > # CONFIG_USB_OTG_BLACKLIST_HUB is not set
> > # CONFIG_USB_HCD_BCMA is not set
> > # CONFIG_USB_HCD_SSB is not set
> >=20
> > #
> > # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> > #
> > # CONFIG_USB_GADGET is not set
> >=20
> > #
> > # OTG and related infrastructure
> > #
> > # CONFIG_UWB is not set
> > CONFIG_MMC=3Dm
> > CONFIG_MMC_DEBUG=3Dy
> > CONFIG_MMC_UNSAFE_RESUME=3Dy
> > CONFIG_MMC_CLKGATE=3Dy
> >=20
> > #
> > # MMC/SD/SDIO Card Drivers
> > #
> > # CONFIG_SDIO_UART is not set
> > # CONFIG_MMC_TEST is not set
> >=20
> > #
> > # MMC/SD/SDIO Host Controller Drivers
> > #
> > # CONFIG_MMC_SDHCI is not set
> > CONFIG_MMC_WBSD=3Dm
> > # CONFIG_MMC_TIFM_SD is not set
> > # CONFIG_MMC_CB710 is not set
> > # CONFIG_MMC_VIA_SDMMC is not set
> > CONFIG_MEMSTICK=3Dm
> > # CONFIG_MEMSTICK_DEBUG is not set
> >=20
> > #
> > # MemoryStick drivers
> > #
> > CONFIG_MEMSTICK_UNSAFE_RESUME=3Dy
> >=20
> > #
> > # MemoryStick Host Controller Drivers
> > #
> > # CONFIG_MEMSTICK_TIFM_MS is not set
> > # CONFIG_MEMSTICK_JMICRON_38X is not set
> > # CONFIG_MEMSTICK_R592 is not set
> > # CONFIG_NEW_LEDS is not set
> > # CONFIG_ACCESSIBILITY is not set
> > # CONFIG_INFINIBAND is not set
> > CONFIG_EDAC=3Dy
> >=20
> > #
> > # Reporting subsystems
> > #
> > CONFIG_EDAC_LEGACY_SYSFS=3Dy
> > CONFIG_EDAC_DEBUG=3Dy
> > # CONFIG_EDAC_MM_EDAC is not set
> > CONFIG_RTC_LIB=3Dy
> > CONFIG_RTC_CLASS=3Dy
> > CONFIG_RTC_HCTOSYS=3Dy
> > CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
> > # CONFIG_RTC_DEBUG is not set
> >=20
> > #
> > # RTC interfaces
> > #
> > # CONFIG_RTC_INTF_DEV is not set
> > CONFIG_RTC_DRV_TEST=3Dm
> >=20
> > #
> > # SPI RTC drivers
> > #
> >=20
> > #
> > # Platform RTC drivers
> > #
> > # CONFIG_RTC_DRV_CMOS is not set
> > CONFIG_RTC_DRV_DS1286=3Dm
> > # CONFIG_RTC_DRV_DS1511 is not set
> > CONFIG_RTC_DRV_DS1553=3Dm
> > CONFIG_RTC_DRV_DS1742=3Dm
> > CONFIG_RTC_DRV_STK17TA8=3Dm
> > # CONFIG_RTC_DRV_M48T86 is not set
> > # CONFIG_RTC_DRV_M48T35 is not set
> > CONFIG_RTC_DRV_M48T59=3Dm
> > # CONFIG_RTC_DRV_MSM6242 is not set
> > # CONFIG_RTC_DRV_BQ4802 is not set
> > # CONFIG_RTC_DRV_RP5C01 is not set
> > CONFIG_RTC_DRV_V3020=3Dm
> >=20
> > #
> > # on-CPU RTC drivers
> > #
> > CONFIG_DMADEVICES=3Dy
> > CONFIG_DMADEVICES_DEBUG=3Dy
> > CONFIG_DMADEVICES_VDEBUG=3Dy
> >=20
> > #
> > # DMA Devices
> > #
> > # CONFIG_INTEL_MID_DMAC is not set
> > # CONFIG_INTEL_IOATDMA is not set
> > CONFIG_TIMB_DMA=3Dm
> > # CONFIG_PCH_DMA is not set
> > CONFIG_DMA_ENGINE=3Dy
> >=20
> > #
> > # DMA Clients
> > #
> > # CONFIG_NET_DMA is not set
> > # CONFIG_ASYNC_TX_DMA is not set
> > CONFIG_DMATEST=3Dm
> > CONFIG_AUXDISPLAY=3Dy
> > # CONFIG_UIO is not set
> > CONFIG_VIRTIO=3Dy
> > CONFIG_VIRTIO_RING=3Dy
> >=20
> > #
> > # Virtio drivers
> > #
> > # CONFIG_VIRTIO_PCI is not set
> > CONFIG_VIRTIO_BALLOON=3Dm
> > # CONFIG_VIRTIO_MMIO is not set
> >=20
> > #
> > # Microsoft Hyper-V guest support
> > #
> > # CONFIG_HYPERV is not set
> > CONFIG_STAGING=3Dy
> > # CONFIG_SLICOSS is not set
> > CONFIG_ECHO=3Dm
> > CONFIG_COMEDI=3Dm
> > CONFIG_COMEDI_DEBUG=3Dy
> > CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB 48
> > CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB 480
> > # CONFIG_COMEDI_MISC_DRIVERS is not set
> > # CONFIG_COMEDI_PCI_DRIVERS is not set
> > CONFIG_COMEDI_8255=3Dm
> > CONFIG_PANEL=3Dm
> > CONFIG_PANEL_PARPORT=3D0
> > CONFIG_PANEL_PROFILE=3D5
> > # CONFIG_PANEL_CHANGE_MESSAGE is not set
> > # CONFIG_DX_SEP is not set
> > # CONFIG_ZSMALLOC is not set
> > # CONFIG_CRYSTALHD is not set
> > # CONFIG_ACPI_QUICKSTART is not set
> > CONFIG_FT1000=3Dm
> >=20
> > #
> > # Speakup console speech
> > #
> > # CONFIG_STAGING_MEDIA is not set
> >=20
> > #
> > # Android
> > #
> > # CONFIG_ANDROID is not set
> > # CONFIG_PHONE is not set
> > CONFIG_IPACK_BUS=3Dm
> > # CONFIG_BOARD_TPCI200 is not set
> > CONFIG_SERIAL_IPOCTAL=3Dm
> > # CONFIG_WIMAX_GDM72XX is not set
> > CONFIG_X86_PLATFORM_DEVICES=3Dy
> > # CONFIG_ACERHDF is not set
> > # CONFIG_ASUS_LAPTOP is not set
> > # CONFIG_FUJITSU_TABLET is not set
> > # CONFIG_HP_ACCEL is not set
> > # CONFIG_THINKPAD_ACPI is not set
> > # CONFIG_SENSORS_HDAPS is not set
> > # CONFIG_INTEL_MENLOW is not set
> > # CONFIG_ACPI_WMI is not set
> > # CONFIG_TOPSTAR_LAPTOP is not set
> > # CONFIG_TOSHIBA_BT_RFKILL is not set
> > # CONFIG_ACPI_CMPC is not set
> > # CONFIG_INTEL_IPS is not set
> > # CONFIG_IBM_RTL is not set
> > # CONFIG_XO15_EBOOK is not set
> > # CONFIG_SAMSUNG_Q10 is not set
> >=20
> > #
> > # Hardware Spinlock drivers
> > #
> > CONFIG_CLKSRC_I8253=3Dy
> > CONFIG_CLKEVT_I8253=3Dy
> > CONFIG_I8253_LOCK=3Dy
> > CONFIG_CLKBLD_I8253=3Dy
> > CONFIG_IOMMU_SUPPORT=3Dy
> > CONFIG_OF_IOMMU=3Dy
> >=20
> > #
> > # Remoteproc drivers (EXPERIMENTAL)
> > #
> >=20
> > #
> > # Rpmsg drivers (EXPERIMENTAL)
> > #
> > # CONFIG_VIRT_DRIVERS is not set
> > # CONFIG_PM_DEVFREQ is not set
> > # CONFIG_EXTCON is not set
> > # CONFIG_MEMORY is not set
> > # CONFIG_IIO is not set
> > # CONFIG_VME_BUS is not set
> > # CONFIG_PWM is not set
> >=20
> > #
> > # Firmware Drivers
> > #
> > CONFIG_EDD=3Dm
> > CONFIG_EDD_OFF=3Dy
> > CONFIG_FIRMWARE_MEMMAP=3Dy
> > CONFIG_DELL_RBU=3Dm
> > # CONFIG_DCDBAS is not set
> > # CONFIG_ISCSI_IBFT_FIND is not set
> > CONFIG_GOOGLE_FIRMWARE=3Dy
> >=20
> > #
> > # Google Firmware Drivers
> > #
> >=20
> > #
> > # File systems
> > #
> > CONFIG_DCACHE_WORD_ACCESS=3Dy
> > # CONFIG_FS_POSIX_ACL is not set
> > CONFIG_EXPORTFS=3Dy
> > CONFIG_FILE_LOCKING=3Dy
> > # CONFIG_FSNOTIFY is not set
> > # CONFIG_DNOTIFY is not set
> > # CONFIG_INOTIFY_USER is not set
> > # CONFIG_FANOTIFY is not set
> > # CONFIG_QUOTA is not set
> > # CONFIG_QUOTACTL is not set
> > # CONFIG_AUTOFS4_FS is not set
> > CONFIG_FUSE_FS=3Dm
> > # CONFIG_CUSE is not set
> >=20
> > #
> > # Caches
> > #
> > # CONFIG_FSCACHE is not set
> >=20
> > #
> > # Pseudo filesystems
> > #
> > # CONFIG_PROC_FS is not set
> > # CONFIG_SYSFS is not set
> > # CONFIG_TMPFS is not set
> > # CONFIG_HUGETLBFS is not set
> > # CONFIG_HUGETLB_PAGE is not set
> > # CONFIG_CONFIGFS_FS is not set
> > CONFIG_MISC_FILESYSTEMS=3Dy
> > CONFIG_JFFS2_FS=3Dm
> > CONFIG_JFFS2_FS_DEBUG=3D0
> > CONFIG_JFFS2_FS_WRITEBUFFER=3Dy
> > CONFIG_JFFS2_FS_WBUF_VERIFY=3Dy
> > # CONFIG_JFFS2_SUMMARY is not set
> > CONFIG_JFFS2_FS_XATTR=3Dy
> > # CONFIG_JFFS2_FS_POSIX_ACL is not set
> > # CONFIG_JFFS2_FS_SECURITY is not set
> > # CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
> > CONFIG_JFFS2_ZLIB=3Dy
> > # CONFIG_JFFS2_LZO is not set
> > CONFIG_JFFS2_RTIME=3Dy
> > # CONFIG_JFFS2_RUBIN is not set
> > # CONFIG_UBIFS_FS is not set
> > # CONFIG_LOGFS is not set
> > CONFIG_ROMFS_FS=3Dm
> > CONFIG_ROMFS_BACKED_BY_MTD=3Dy
> > CONFIG_ROMFS_ON_MTD=3Dy
> > # CONFIG_PSTORE is not set
> > CONFIG_NETWORK_FILESYSTEMS=3Dy
> > CONFIG_NLS=3Dy
> > CONFIG_NLS_DEFAULT=3D"iso8859-1"
> > # CONFIG_NLS_CODEPAGE_437 is not set
> > # CONFIG_NLS_CODEPAGE_737 is not set
> > # CONFIG_NLS_CODEPAGE_775 is not set
> > # CONFIG_NLS_CODEPAGE_850 is not set
> > # CONFIG_NLS_CODEPAGE_852 is not set
> > # CONFIG_NLS_CODEPAGE_855 is not set
> > # CONFIG_NLS_CODEPAGE_857 is not set
> > # CONFIG_NLS_CODEPAGE_860 is not set
> > # CONFIG_NLS_CODEPAGE_861 is not set
> > # CONFIG_NLS_CODEPAGE_862 is not set
> > # CONFIG_NLS_CODEPAGE_863 is not set
> > # CONFIG_NLS_CODEPAGE_864 is not set
> > # CONFIG_NLS_CODEPAGE_865 is not set
> > # CONFIG_NLS_CODEPAGE_866 is not set
> > # CONFIG_NLS_CODEPAGE_869 is not set
> > # CONFIG_NLS_CODEPAGE_936 is not set
> > # CONFIG_NLS_CODEPAGE_950 is not set
> > # CONFIG_NLS_CODEPAGE_932 is not set
> > # CONFIG_NLS_CODEPAGE_949 is not set
> > # CONFIG_NLS_CODEPAGE_874 is not set
> > # CONFIG_NLS_ISO8859_8 is not set
> > # CONFIG_NLS_CODEPAGE_1250 is not set
> > # CONFIG_NLS_CODEPAGE_1251 is not set
> > # CONFIG_NLS_ASCII is not set
> > # CONFIG_NLS_ISO8859_1 is not set
> > # CONFIG_NLS_ISO8859_2 is not set
> > # CONFIG_NLS_ISO8859_3 is not set
> > # CONFIG_NLS_ISO8859_4 is not set
> > # CONFIG_NLS_ISO8859_5 is not set
> > # CONFIG_NLS_ISO8859_6 is not set
> > # CONFIG_NLS_ISO8859_7 is not set
> > # CONFIG_NLS_ISO8859_9 is not set
> > # CONFIG_NLS_ISO8859_13 is not set
> > # CONFIG_NLS_ISO8859_14 is not set
> > # CONFIG_NLS_ISO8859_15 is not set
> > # CONFIG_NLS_KOI8_R is not set
> > # CONFIG_NLS_KOI8_U is not set
> > # CONFIG_NLS_MAC_ROMAN is not set
> > # CONFIG_NLS_MAC_CELTIC is not set
> > # CONFIG_NLS_MAC_CENTEURO is not set
> > # CONFIG_NLS_MAC_CROATIAN is not set
> > # CONFIG_NLS_MAC_CYRILLIC is not set
> > # CONFIG_NLS_MAC_GAELIC is not set
> > # CONFIG_NLS_MAC_GREEK is not set
> > # CONFIG_NLS_MAC_ICELAND is not set
> > # CONFIG_NLS_MAC_INUIT is not set
> > # CONFIG_NLS_MAC_ROMANIAN is not set
> > # CONFIG_NLS_MAC_TURKISH is not set
> > # CONFIG_NLS_UTF8 is not set
> >=20
> > #
> > # Kernel hacking
> > #
> > CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> > CONFIG_PRINTK_TIME=3Dy
> > CONFIG_DEFAULT_MESSAGE_LOGLEVEL=3D4
> > # CONFIG_ENABLE_WARN_DEPRECATED is not set
> > CONFIG_ENABLE_MUST_CHECK=3Dy
> > CONFIG_FRAME_WARN=1024
> > # CONFIG_MAGIC_SYSRQ is not set
> > CONFIG_STRIP_ASM_SYMS=3Dy
> > # CONFIG_READABLE_ASM is not set
> > # CONFIG_UNUSED_SYMBOLS is not set
> > CONFIG_DEBUG_FS=3Dy
> > CONFIG_HEADERS_CHECK=3Dy
> > # CONFIG_DEBUG_SECTION_MISMATCH is not set
> > CONFIG_DEBUG_KERNEL=3Dy
> > # CONFIG_DEBUG_SHIRQ is not set
> > CONFIG_LOCKUP_DETECTOR=3Dy
> > CONFIG_HARDLOCKUP_DETECTOR=3Dy
> > CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
> > CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D1
> > CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=3Dy
> > CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D1
> > # CONFIG_PANIC_ON_OOPS is not set
> > CONFIG_PANIC_ON_OOPS_VALUE=3D0
> > CONFIG_DETECT_HUNG_TASK=3Dy
> > CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
> > # CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
> > CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D0
> > CONFIG_DEBUG_OBJECTS=3Dy
> > # CONFIG_DEBUG_OBJECTS_SELFTEST is not set
> > # CONFIG_DEBUG_OBJECTS_FREE is not set
> > # CONFIG_DEBUG_OBJECTS_TIMERS is not set
> > # CONFIG_DEBUG_OBJECTS_WORK is not set
> > # CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
> > CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=3Dy
> > CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=3D1
> > # CONFIG_DEBUG_KMEMLEAK is not set
> > CONFIG_DEBUG_PREEMPT=3Dy
> > CONFIG_DEBUG_RT_MUTEXES=3Dy
> > CONFIG_DEBUG_PI_LIST=3Dy
> > # CONFIG_RT_MUTEX_TESTER is not set
> > CONFIG_DEBUG_SPINLOCK=3Dy
> > CONFIG_DEBUG_MUTEXES=3Dy
> > CONFIG_DEBUG_LOCK_ALLOC=3Dy
> > # CONFIG_PROVE_LOCKING is not set
> > # CONFIG_SPARSE_RCU_POINTER is not set
> > CONFIG_LOCKDEP=3Dy
> > CONFIG_LOCK_STAT=3Dy
> > CONFIG_DEBUG_LOCKDEP=3Dy
> > CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> > # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> > CONFIG_STACKTRACE=3Dy
> > # CONFIG_DEBUG_STACK_USAGE is not set
> > # CONFIG_DEBUG_KOBJECT is not set
> > # CONFIG_DEBUG_HIGHMEM is not set
> > CONFIG_DEBUG_BUGVERBOSE=3Dy
> > CONFIG_DEBUG_INFO=3Dy
> > CONFIG_DEBUG_INFO_REDUCED=3Dy
> > CONFIG_DEBUG_VM=3Dy
> > # CONFIG_DEBUG_VIRTUAL is not set
> > # CONFIG_DEBUG_WRITECOUNT is not set
> > CONFIG_DEBUG_MEMORY_INIT=3Dy
> > CONFIG_DEBUG_LIST=3Dy
> > CONFIG_TEST_LIST_SORT=3Dy
> > # CONFIG_DEBUG_SG is not set
> > CONFIG_DEBUG_NOTIFIERS=3Dy
> > # CONFIG_DEBUG_CREDENTIALS is not set
> > CONFIG_ARCH_WANT_FRAME_POINTERS=3Dy
> > CONFIG_FRAME_POINTER=3Dy
> > # CONFIG_BOOT_PRINTK_DELAY is not set
> > CONFIG_RCU_TORTURE_TEST=3Dm
> > # CONFIG_RCU_TRACE is not set
> > # CONFIG_BACKTRACE_SELF_TEST is not set
> > CONFIG_DEBUG_FORCE_WEAK_PER_CPU=3Dy
> > # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> > CONFIG_FAULT_INJECTION=3Dy
> > # CONFIG_FAIL_PAGE_ALLOC is not set
> > # CONFIG_FAIL_MMC_REQUEST is not set
> > # CONFIG_DEBUG_PAGEALLOC is not set
> > CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> > CONFIG_HAVE_FUNCTION_TRACER=3Dy
> > CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> > CONFIG_HAVE_FUNCTION_GRAPH_FP_TEST=3Dy
> > CONFIG_HAVE_FUNCTION_TRACE_MCOUNT_TEST=3Dy
> > CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> > CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> > CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> > CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> > CONFIG_RING_BUFFER=3Dy
> > CONFIG_RING_BUFFER_ALLOW_SWAP=3Dy
> > CONFIG_TRACING_SUPPORT=3Dy
> > # CONFIG_FTRACE is not set
> > # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> > CONFIG_BUILD_DOCSRC=3Dy
> > # CONFIG_DYNAMIC_DEBUG is not set
> > CONFIG_DMA_API_DEBUG=3Dy
> > # CONFIG_ATOMIC64_SELFTEST is not set
> > # CONFIG_SAMPLES is not set
> > CONFIG_HAVE_ARCH_KGDB=3Dy
> > # CONFIG_KGDB is not set
> > CONFIG_HAVE_ARCH_KMEMCHECK=3Dy
> > # CONFIG_TEST_KSTRTOX is not set
> > # CONFIG_STRICT_DEVMEM is not set
> > CONFIG_X86_VERBOSE_BOOTUP=3Dy
> > # CONFIG_EARLY_PRINTK is not set
> > CONFIG_DEBUG_STACKOVERFLOW=3Dy
> > # CONFIG_X86_PTDUMP is not set
> > CONFIG_DEBUG_RODATA=3Dy
> > CONFIG_DEBUG_RODATA_TEST=3Dy
> > # CONFIG_DEBUG_SET_MODULE_RONX is not set
> > CONFIG_DEBUG_NX_TEST=3Dm
> > CONFIG_DOUBLEFAULT=3Dy
> > # CONFIG_DEBUG_TLBFLUSH is not set
> > # CONFIG_IOMMU_STRESS is not set
> > CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> > CONFIG_IO_DELAY_TYPE_0X80=3D0
> > CONFIG_IO_DELAY_TYPE_0XED=3D1
> > CONFIG_IO_DELAY_TYPE_UDELAY=3D2
> > CONFIG_IO_DELAY_TYPE_NONE=3D3
> > # CONFIG_IO_DELAY_0X80 is not set
> > # CONFIG_IO_DELAY_0XED is not set
> > CONFIG_IO_DELAY_UDELAY=3Dy
> > # CONFIG_IO_DELAY_NONE is not set
> > CONFIG_DEFAULT_IO_DELAY_TYPE=3D2
> > # CONFIG_DEBUG_BOOT_PARAMS is not set
> > # CONFIG_CPA_DEBUG is not set
> > # CONFIG_OPTIMIZE_INLINING is not set
> > # CONFIG_DEBUG_STRICT_USER_COPY_CHECKS is not set
> >=20
> > #
> > # Security options
> > #
> > # CONFIG_KEYS is not set
> > CONFIG_SECURITY_DMESG_RESTRICT=3Dy
> > CONFIG_SECURITYFS=3Dy
> > CONFIG_DEFAULT_SECURITY_DAC=3Dy
> > CONFIG_DEFAULT_SECURITY=3D""
> > # CONFIG_CRYPTO is not set
> > CONFIG_HAVE_KVM=3Dy
> > CONFIG_VIRTUALIZATION=3Dy
> > # CONFIG_KVM is not set
> > # CONFIG_BINARY_PRINTF is not set
> >=20
> > #
> > # Library routines
> > #
> > CONFIG_BITREVERSE=3Dm
> > CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> > CONFIG_GENERIC_STRNLEN_USER=3Dy
> > CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> > CONFIG_GENERIC_PCI_IOMAP=3Dy
> > CONFIG_GENERIC_IOMAP=3Dy
> > CONFIG_GENERIC_IO=3Dy
> > # CONFIG_CRC_CCITT is not set
> > # CONFIG_CRC16 is not set
> > # CONFIG_CRC_T10DIF is not set
> > CONFIG_CRC_ITU_T=3Dm
> > CONFIG_CRC32=3Dm
> > # CONFIG_CRC32_SELFTEST is not set
> > CONFIG_CRC32_SLICEBY8=3Dy
> > # CONFIG_CRC32_SLICEBY4 is not set
> > # CONFIG_CRC32_SARWATE is not set
> > # CONFIG_CRC32_BIT is not set
> > CONFIG_CRC7=3Dm
> > # CONFIG_LIBCRC32C is not set
> > # CONFIG_CRC8 is not set
> > CONFIG_ZLIB_INFLATE=3Dy
> > CONFIG_ZLIB_DEFLATE=3Dm
> > CONFIG_LZO_DECOMPRESS=3Dy
> > # CONFIG_XZ_DEC is not set
> > # CONFIG_XZ_DEC_BCJ is not set
> > CONFIG_DECOMPRESS_GZIP=3Dy
> > CONFIG_DECOMPRESS_BZIP2=3Dy
> > CONFIG_DECOMPRESS_LZMA=3Dy
> > CONFIG_DECOMPRESS_LZO=3Dy
> > CONFIG_REED_SOLOMON=3Dm
> > CONFIG_REED_SOLOMON_DEC16=3Dy
> > CONFIG_BCH=3Dm
> > CONFIG_HAS_IOMEM=3Dy
> > CONFIG_HAS_IOPORT=3Dy
> > CONFIG_HAS_DMA=3Dy
> > CONFIG_NLATTR=3Dy
> > CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=3Dy
> > # CONFIG_AVERAGE is not set
> > # CONFIG_CORDIC is not set
> > CONFIG_DDR=3Dy
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
