From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 22 Jul 2012 16:35:12 +0000
Subject: [next:akpm 121/309] include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BU
Message-Id: <20120722163512.GC13376@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ZmUaFz6apKcXQszQ"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--ZmUaFz6apKcXQszQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mel,

Kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
head:   37e2ad4953983527f7bdb6831bf478eedcc84082
commit: 383b2e95f7410fe74c7083a7ea687effc28a337b [121/309] mm: sl[au]b: add knowledge of PFMEMALLOC reserve pages
config: ia64-alldefconfig (attached as .config)

All related error/warning messages:

In file included from arch/ia64/include/asm/uaccess.h:38:0,
                 from drivers/input/input-compat.c:12:
include/linux/page-flags.h: In function 'PageSlabPfmemalloc':
include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BUG_ON' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/ia64/include/asm/uaccess.h:38:0,
                 from lib/kstrtox.c:20:
include/linux/page-flags.h: In function 'PageSlabPfmemalloc':
include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BUG_ON' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/ia64/include/asm/uaccess.h:38:0,
                 from lib/bitmap.c:15:
include/linux/page-flags.h: In function 'PageSlabPfmemalloc':
include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BUG_ON' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/ia64/include/asm/uaccess.h:38:0,
                 from arch/ia64/kernel/irq.c:20:
include/linux/page-flags.h: In function 'PageSlabPfmemalloc':
include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BUG_ON' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/ia64/include/asm/uaccess.h:38:0,
                 from include/linux/uaccess.h:5,
                 from arch/ia64/include/asm/sections.h:10,
                 from arch/ia64/kernel/patch.c:13:
include/linux/page-flags.h: In function 'PageSlabPfmemalloc':
include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BUG_ON' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/ia64/include/asm/uaccess.h:38:0,
                 from arch/ia64/kernel/unaligned.c:25:
include/linux/page-flags.h: In function 'PageSlabPfmemalloc':
include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BUG_ON' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/ia64/include/asm/uaccess.h:38:0,
                 from arch/ia64/kernel/brl_emu.c:12:
include/linux/page-flags.h: In function 'PageSlabPfmemalloc':
include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BUG_ON' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/ia64/include/asm/uaccess.h:38:0,
                 from arch/ia64/mm/extable.c:10:
include/linux/page-flags.h: In function 'PageSlabPfmemalloc':
include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BUG_ON' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/ia64/include/asm/uaccess.h:38:0,
                 from include/net/checksum.h:25,
                 from include/net/ip_vs.h:20,
                 from kernel/sysctl_binary.c:6:
include/linux/page-flags.h: In function 'PageSlabPfmemalloc':
include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BUG_ON' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
mm/slub.c: In function 'slab_alloc':
mm/slub.c:2330:6: error: expected ')' before '!' token
--
In file included from arch/ia64/include/asm/cacheflush.h:9:0,
                 from arch/ia64/include/asm/pgtable.h:155,
                 from mm/init-mm.c:9:
include/linux/page-flags.h: In function 'PageSlabPfmemalloc':
include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BUG_ON' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/ia64/include/asm/uaccess.h:38:0,
                 from include/linux/uaccess.h:5,
                 from mm/filemap.c:15:
include/linux/page-flags.h: In function 'PageSlabPfmemalloc':
include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BUG_ON' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/ia64/include/asm/uaccess.h:38:0,
                 from include/linux/poll.h:14,
                 from fs/mount.h:3,
                 from fs/pnode.h:12,
                 from fs/pnode.c:13:
include/linux/page-flags.h: In function 'PageSlabPfmemalloc':
include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BUG_ON' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/ia64/include/asm/uaccess.h:38:0,
                 from include/linux/poll.h:14,
                 from fs/signalfd.c:21:
include/linux/page-flags.h: In function 'PageSlabPfmemalloc':
include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BUG_ON' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/ia64/include/asm/uaccess.h:38:0,
                 from include/linux/poll.h:14,
                 from fs/anon_inodes.c:13:
include/linux/page-flags.h: In function 'PageSlabPfmemalloc':
include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BUG_ON' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/ia64/include/asm/uaccess.h:38:0,
                 from include/linux/poll.h:14,
                 from fs/eventfd.c:9:
include/linux/page-flags.h: In function 'PageSlabPfmemalloc':
include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BUG_ON' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/ia64/include/asm/uaccess.h:38:0,
                 from include/linux/poll.h:14,
                 from fs/timerfd.c:12:
include/linux/page-flags.h: In function 'PageSlabPfmemalloc':
include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BUG_ON' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/ia64/include/asm/uaccess.h:38:0,
                 from include/linux/poll.h:14,
                 from fs/bad_inode.c:16:
include/linux/page-flags.h: In function 'PageSlabPfmemalloc':
include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BUG_ON' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/ia64/include/asm/uaccess.h:38:0,
                 from include/linux/poll.h:14,
                 from include/linux/posix-clock.h:25,
                 from kernel/time/posix-clock.c:23:
include/linux/page-flags.h: In function 'PageSlabPfmemalloc':
include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BUG_ON' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/ia64/include/asm/uaccess.h:38:0,
                 from drivers/input/serio/serport.c:16:
include/linux/page-flags.h: In function 'PageSlabPfmemalloc':
include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BUG_ON' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/ia64/include/asm/uaccess.h:38:0,
                 from include/linux/poll.h:14,
                 from fs/proc/proc_sysctl.c:6:
include/linux/page-flags.h: In function 'PageSlabPfmemalloc':
include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BUG_ON' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/ia64/include/asm/uaccess.h:38:0,
                 from include/linux/poll.h:14,
                 from fs/proc/kmsg.c:12:
include/linux/page-flags.h: In function 'PageSlabPfmemalloc':
include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BUG_ON' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/ia64/include/asm/uaccess.h:38:0,
                 from fs/proc/root.c:9:
include/linux/page-flags.h: In function 'PageSlabPfmemalloc':
include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BUG_ON' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/ia64/include/asm/uaccess.h:38:0,
                 from fs/proc/base.c:50:
include/linux/page-flags.h: In function 'PageSlabPfmemalloc':
include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BUG_ON' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/ia64/include/asm/uaccess.h:38:0,
                 from fs/proc/proc_tty.c:7:
include/linux/page-flags.h: In function 'PageSlabPfmemalloc':
include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BUG_ON' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from arch/ia64/include/asm/cacheflush.h:9:0,
                 from arch/ia64/include/asm/pgtable.h:155,
                 from arch/ia64/hp/sim/hpsim_setup.c:22:
include/linux/page-flags.h: In function 'PageSlabPfmemalloc':
include/linux/page-flags.h:462:2: error: implicit declaration of function 'VM_BUG_ON' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

vim +462 include/linux/page-flags.h
   459	 */
   460	static inline int PageSlabPfmemalloc(struct page *page)
   461	{
 > 462		VM_BUG_ON(!PageSlab(page));
   463		return PageActive(page);
   464	}
   465	

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation

--ZmUaFz6apKcXQszQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=".config"

#
# Automatically generated file; DO NOT EDIT.
# Linux/ia64 3.5.0 Kernel Configuration
#
CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"

#
# General setup
#
# CONFIG_EXPERIMENTAL is not set
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_CROSS_COMPILE=""
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SWAP=y
# CONFIG_SYSVIPC is not set
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_FHANDLE is not set
CONFIG_HAVE_GENERIC_HARDIRQS=y

#
# IRQ subsystem
#
CONFIG_GENERIC_HARDIRQS=y
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_ARCH_CLOCKSOURCE_DATA=y
CONFIG_GENERIC_TIME_VSYSCALL=y

#
# RCU Subsystem
#
CONFIG_TINY_RCU=y
# CONFIG_PREEMPT_RCU is not set
# CONFIG_TREE_RCU_TRACE is not set
# CONFIG_IKCONFIG is not set
CONFIG_LOG_BUF_SHIFT=17
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y
# CONFIG_CGROUPS is not set
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_PID_NS=y
CONFIG_UIDGID_CONVERTED=y
# CONFIG_UIDGID_STRICT_TYPE_CHECKS is not set
# CONFIG_SCHED_AUTOGROUP is not set
CONFIG_MM_OWNER=y
# CONFIG_SYSFS_DEPRECATED is not set
# CONFIG_RELAY is not set
# CONFIG_BLK_DEV_INITRD is not set
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_SYSCTL=y
CONFIG_ANON_INODES=y
# CONFIG_EXPERT is not set
# CONFIG_SYSCTL_SYSCALL is not set
CONFIG_KALLSYMS=y
CONFIG_HOTPLUG=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
# CONFIG_EMBEDDED is not set

#
# Kernel Performance Events And Counters
#
CONFIG_VM_EVENT_COUNTERS=y
CONFIG_PCI_QUIRKS=y
CONFIG_SLUB_DEBUG=y
CONFIG_COMPAT_BRK=y
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_PROFILING is not set
CONFIG_HAVE_OPROFILE=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_ATTRS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_INIT_TASK=y
CONFIG_ARCH_TASK_STRUCT_ALLOCATOR=y
CONFIG_ARCH_THREAD_INFO_ALLOCATOR=y
CONFIG_HAVE_DMA_API_DEBUG=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y

#
# GCOV-based kernel profiling
#
# CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
CONFIG_SLABINFO=y
CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
# CONFIG_MODULES is not set
CONFIG_BLOCK=y
CONFIG_BLK_DEV_BSG=y
# CONFIG_BLK_DEV_BSGLIB is not set
# CONFIG_BLK_DEV_INTEGRITY is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y

#
# IO Schedulers
#
CONFIG_IOSCHED_NOOP=y
CONFIG_IOSCHED_DEADLINE=y
CONFIG_IOSCHED_CFQ=y
# CONFIG_DEFAULT_DEADLINE is not set
CONFIG_DEFAULT_CFQ=y
# CONFIG_DEFAULT_NOOP is not set
CONFIG_DEFAULT_IOSCHED="cfq"
# CONFIG_INLINE_SPIN_TRYLOCK is not set
# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
# CONFIG_INLINE_SPIN_LOCK is not set
# CONFIG_INLINE_SPIN_LOCK_BH is not set
# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
# CONFIG_INLINE_READ_TRYLOCK is not set
# CONFIG_INLINE_READ_LOCK is not set
# CONFIG_INLINE_READ_LOCK_BH is not set
# CONFIG_INLINE_READ_LOCK_IRQ is not set
# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
CONFIG_INLINE_READ_UNLOCK=y
# CONFIG_INLINE_READ_UNLOCK_BH is not set
CONFIG_INLINE_READ_UNLOCK_IRQ=y
# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
# CONFIG_INLINE_WRITE_TRYLOCK is not set
# CONFIG_INLINE_WRITE_LOCK is not set
# CONFIG_INLINE_WRITE_LOCK_BH is not set
# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
CONFIG_INLINE_WRITE_UNLOCK=y
# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
# CONFIG_MUTEX_SPIN_ON_OWNER is not set
# CONFIG_FREEZER is not set

#
# Processor type and features
#
CONFIG_IA64=y
CONFIG_64BIT=y
CONFIG_ZONE_DMA=y
CONFIG_QUICKLIST=y
CONFIG_MMU=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_SWIOTLB=y
CONFIG_STACKTRACE_SUPPORT=y
# CONFIG_GENERIC_LOCKBREAK is not set
CONFIG_RWSEM_XCHGADD_ALGORITHM=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_DMI=y
CONFIG_EFI=y
CONFIG_SCHED_OMIT_FRAME_POINTER=y
CONFIG_AUDIT_ARCH=y
# CONFIG_PARAVIRT_GUEST is not set
CONFIG_IA64_GENERIC=y
# CONFIG_IA64_DIG is not set
# CONFIG_IA64_DIG_VTD is not set
# CONFIG_IA64_HP_ZX1 is not set
# CONFIG_IA64_HP_ZX1_SWIOTLB is not set
# CONFIG_IA64_SGI_SN2 is not set
# CONFIG_IA64_SGI_UV is not set
# CONFIG_IA64_HP_SIM is not set
CONFIG_ITANIUM=y
# CONFIG_MCKINLEY is not set
# CONFIG_IA64_PAGE_SIZE_4KB is not set
# CONFIG_IA64_PAGE_SIZE_8KB is not set
CONFIG_IA64_PAGE_SIZE_16KB=y
CONFIG_PGTABLE_3=y
# CONFIG_PGTABLE_4 is not set
CONFIG_HZ=250
# CONFIG_HZ_100 is not set
CONFIG_HZ_250=y
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
# CONFIG_SCHED_HRTICK is not set
CONFIG_IA64_BRL_EMU=y
CONFIG_IA64_L1_CACHE_SHIFT=6
# CONFIG_IA64_CYCLONE is not set
CONFIG_IOSAPIC=y
CONFIG_FORCE_MAX_ZONEORDER=11
# CONFIG_VIRT_CPU_ACCOUNTING is not set
# CONFIG_SMP is not set
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set
CONFIG_SELECT_MEMORY_MODEL=y
# CONFIG_FLATMEM_MANUAL is not set
CONFIG_DISCONTIGMEM_MANUAL=y
# CONFIG_SPARSEMEM_MANUAL is not set
CONFIG_DISCONTIGMEM=y
CONFIG_FLAT_NODE_MEM_MAP=y
CONFIG_NEED_MULTIPLE_NODES=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_HAVE_MEMBLOCK=y
CONFIG_HAVE_MEMBLOCK_NODE_MAP=y
CONFIG_ARCH_DISCARD_MEMBLOCK=y
CONFIG_PAGEFLAGS_EXTENDED=y
CONFIG_SPLIT_PTLOCK_CPUS=4
# CONFIG_COMPACTION is not set
CONFIG_MIGRATION=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_ZONE_DMA_FLAG=1
CONFIG_BOUNCE=y
CONFIG_NR_QUICK=1
CONFIG_VIRT_TO_BUS=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_CROSS_MEMORY_ATTACH=y
CONFIG_NEED_PER_CPU_KM=y
# CONFIG_CLEANCACHE is not set
# CONFIG_FRONTSWAP is not set
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ARCH_DISCONTIGMEM_ENABLE=y
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_DISCONTIGMEM_DEFAULT=y
CONFIG_NUMA=y
CONFIG_NODES_SHIFT=10
CONFIG_VIRTUAL_MEM_MAP=y
CONFIG_HOLES_IN_ZONE=y
# CONFIG_HAVE_ARCH_EARLY_PFN_TO_NID is not set
CONFIG_HAVE_ARCH_NODEDATA_EXTENSION=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_HAVE_MEMORYLESS_NODES=y
# CONFIG_IA64_MCA_RECOVERY is not set
# CONFIG_PERFMON is not set
# CONFIG_IA64_PALINFO is not set
# CONFIG_IA64_MC_ERR_INJECT is not set
CONFIG_SGI_SN=y
# CONFIG_IA64_ESI is not set
# CONFIG_IA64_HP_AML_NFW is not set

#
# SN Devices
#
CONFIG_SGI_IOC3=y

#
# Firmware Drivers
#
# CONFIG_FIRMWARE_MEMMAP is not set
# CONFIG_EFI_VARS is not set
CONFIG_EFI_PCDP=y
CONFIG_DMIID=y
# CONFIG_DMI_SYSFS is not set
CONFIG_BINFMT_ELF=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
# CONFIG_HAVE_AOUT is not set
# CONFIG_BINFMT_MISC is not set

#
# Power management and ACPI options
#
# CONFIG_PM_RUNTIME is not set
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_ACPI=y
# CONFIG_ACPI_PROCFS is not set
# CONFIG_ACPI_PROCFS_POWER is not set
# CONFIG_ACPI_EC_DEBUGFS is not set
CONFIG_ACPI_PROC_EVENT=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_FAN=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_THERMAL=y
CONFIG_ACPI_NUMA=y
# CONFIG_ACPI_CUSTOM_DSDT is not set
CONFIG_ACPI_BLACKLIST_YEAR=0
# CONFIG_ACPI_DEBUG is not set
# CONFIG_ACPI_PCI_SLOT is not set
# CONFIG_ACPI_HED is not set
# CONFIG_ACPI_BGRT is not set

#
# CPU Frequency scaling
#

#
# CPU Frequency scaling
#
# CONFIG_CPU_FREQ is not set

#
# Bus options (PCI, PCMCIA)
#
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCI_SYSCALL=y
# CONFIG_PCIEPORTBUS is not set
CONFIG_ARCH_SUPPORTS_MSI=y
CONFIG_PCI_MSI=y
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
# CONFIG_PCI_STUB is not set
# CONFIG_PCI_IOV is not set
# CONFIG_PCI_PRI is not set
# CONFIG_PCI_PASID is not set
CONFIG_PCI_IOAPIC=y
CONFIG_PCI_LABEL=y
# CONFIG_HOTPLUG_PCI is not set
# CONFIG_PCCARD is not set
# CONFIG_NET is not set

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
CONFIG_FW_LOADER=y
CONFIG_FIRMWARE_IN_KERNEL=y
CONFIG_EXTRA_FIRMWARE=""
# CONFIG_SYS_HYPERVISOR is not set
# CONFIG_GENERIC_CPU_DEVICES is not set
# CONFIG_MTD is not set
# CONFIG_PARPORT is not set
CONFIG_PNP=y
CONFIG_PNP_DEBUG_MESSAGES=y

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
# CONFIG_BLK_CPQ_DA is not set
# CONFIG_BLK_CPQ_CISS_DA is not set
# CONFIG_BLK_DEV_DAC960 is not set
# CONFIG_BLK_DEV_COW_COMMON is not set
# CONFIG_BLK_DEV_LOOP is not set

#
# DRBD disabled because PROC_FS, INET or CONNECTOR not selected
#
# CONFIG_BLK_DEV_NVME is not set
# CONFIG_BLK_DEV_SX8 is not set
# CONFIG_BLK_DEV_RAM is not set
# CONFIG_CDROM_PKTCDVD is not set
# CONFIG_BLK_DEV_HD is not set

#
# Misc devices
#
# CONFIG_SENSORS_LIS3LV02D is not set
# CONFIG_PHANTOM is not set
# CONFIG_INTEL_MID_PTI is not set
# CONFIG_SGI_IOC4 is not set
# CONFIG_ENCLOSURE_SERVICES is not set
# CONFIG_HP_ILO is not set
# CONFIG_PCH_PHUB is not set

#
# EEPROM support
#
# CONFIG_EEPROM_93CX6 is not set
# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#

#
# Altera FPGA firmware download module
#
CONFIG_HAVE_IDE=y
# CONFIG_IDE is not set

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# CONFIG_RAID_ATTRS is not set
# CONFIG_SCSI is not set
# CONFIG_SCSI_DMA is not set
# CONFIG_SCSI_NETLINK is not set
# CONFIG_ATA is not set
# CONFIG_MD is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
# CONFIG_FIREWIRE_NOSY is not set
# CONFIG_I2O is not set

#
# Input device support
#
CONFIG_INPUT=y
# CONFIG_INPUT_FF_MEMLESS is not set
# CONFIG_INPUT_POLLDEV is not set
# CONFIG_INPUT_SPARSEKMAP is not set
# CONFIG_INPUT_MATRIXKMAP is not set

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
CONFIG_INPUT_MOUSEDEV_PSAUX=y
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
# CONFIG_INPUT_JOYDEV is not set
# CONFIG_INPUT_EVDEV is not set
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_OMAP4 is not set
# CONFIG_KEYBOARD_XTKBD is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_PS2_ALPS=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
# CONFIG_MOUSE_PS2_ELANTECH is not set
# CONFIG_MOUSE_PS2_SENTELIC is not set
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
# CONFIG_MOUSE_SERIAL is not set
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
# CONFIG_MOUSE_VSXXXAA is not set
# CONFIG_MOUSE_SYNAPTICS_USB is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
# CONFIG_SERIO_RAW is not set
# CONFIG_SERIO_ALTERA_PS2 is not set
# CONFIG_SERIO_PS2MULT is not set
# CONFIG_GAMEPORT is not set

#
# Character devices
#
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_HW_CONSOLE=y
# CONFIG_VT_HW_CONSOLE_BINDING is not set
CONFIG_UNIX98_PTYS=y
# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
# CONFIG_SERIAL_NONSTANDARD is not set
# CONFIG_TRACE_SINK is not set
CONFIG_DEVKMEM=y
# CONFIG_SGI_SNSC is not set
# CONFIG_SGI_TIOCX is not set

#
# Serial drivers
#
# CONFIG_SERIAL_8250 is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MFD_HSU is not set
# CONFIG_SERIAL_SGI_L1_CONSOLE is not set
# CONFIG_SERIAL_JSM is not set
# CONFIG_SERIAL_SGI_IOC3 is not set
# CONFIG_SERIAL_TIMBERDALE is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_PCH_UART is not set
# CONFIG_SERIAL_XILINX_PS_UART is not set
# CONFIG_IPMI_HANDLER is not set
CONFIG_HW_RANDOM=y
# CONFIG_HW_RANDOM_TIMERIOMEM is not set
CONFIG_HW_RANDOM_INTEL=y
# CONFIG_EFI_RTC is not set
# CONFIG_R3964 is not set
# CONFIG_APPLICOM is not set
# CONFIG_RAW_DRIVER is not set
# CONFIG_HPET is not set
# CONFIG_HANGCHECK_TIMER is not set
CONFIG_MMTIMER=y
# CONFIG_TCG_TPM is not set
CONFIG_DEVPORT=y
# CONFIG_I2C is not set
# CONFIG_SPI is not set
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
# CONFIG_GPIOLIB is not set
# CONFIG_W1 is not set
# CONFIG_POWER_SUPPLY is not set
# CONFIG_POWER_AVS is not set
CONFIG_HWMON=y
# CONFIG_HWMON_VID is not set
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
# CONFIG_SENSORS_F71805F is not set
# CONFIG_SENSORS_F71882FG is not set
# CONFIG_SENSORS_IT87 is not set
# CONFIG_SENSORS_PC87360 is not set
# CONFIG_SENSORS_PC87427 is not set
# CONFIG_SENSORS_SIS5595 is not set
# CONFIG_SENSORS_SMSC47M1 is not set
# CONFIG_SENSORS_SCH56XX_COMMON is not set
# CONFIG_SENSORS_VIA686A is not set
# CONFIG_SENSORS_VT1211 is not set
# CONFIG_SENSORS_VT8231 is not set
# CONFIG_SENSORS_W83627HF is not set
# CONFIG_SENSORS_W83627EHF is not set

#
# ACPI drivers
#
# CONFIG_SENSORS_ACPI_POWER is not set
CONFIG_THERMAL=y
CONFIG_THERMAL_HWMON=y
# CONFIG_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y

#
# Sonics Silicon Backplane
#
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y

#
# Broadcom specific AMBA
#
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
# CONFIG_MFD_CORE is not set
# CONFIG_MFD_SM501 is not set
# CONFIG_HTC_PASIC3 is not set
# CONFIG_MFD_TMIO is not set
# CONFIG_ABX500_CORE is not set
# CONFIG_LPC_SCH is not set
# CONFIG_LPC_ICH is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_VX855 is not set
# CONFIG_REGULATOR is not set
# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
# CONFIG_AGP is not set
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_DRM is not set
# CONFIG_VGASTATE is not set
# CONFIG_VIDEO_OUTPUT_CONTROL is not set
# CONFIG_FB is not set
# CONFIG_EXYNOS_VIDEO is not set
# CONFIG_BACKLIGHT_LCD_SUPPORT is not set

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
# CONFIG_VGACON_SOFT_SCROLLBACK is not set
CONFIG_DUMMY_CONSOLE=y
# CONFIG_SOUND is not set

#
# HID support
#
CONFIG_HID=y
# CONFIG_HIDRAW is not set
# CONFIG_UHID is not set
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_USB_ARCH_HAS_OHCI=y
CONFIG_USB_ARCH_HAS_EHCI=y
CONFIG_USB_ARCH_HAS_XHCI=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_ARCH_HAS_HCD=y
# CONFIG_USB is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#
# CONFIG_USB_GADGET is not set

#
# OTG and related infrastructure
#
# CONFIG_MMC is not set
# CONFIG_MEMSTICK is not set
# CONFIG_NEW_LEDS is not set
# CONFIG_ACCESSIBILITY is not set
# CONFIG_RTC_CLASS is not set
# CONFIG_DMADEVICES is not set
# CONFIG_AUXDISPLAY is not set
# CONFIG_UIO is not set

#
# Virtio drivers
#
# CONFIG_VIRTIO_BALLOON is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_STAGING is not set

#
# Hardware Spinlock drivers
#
CONFIG_IOMMU_SUPPORT=y
# CONFIG_INTEL_IOMMU is not set

#
# Remoteproc drivers (EXPERIMENTAL)
#

#
# Rpmsg drivers (EXPERIMENTAL)
#
# CONFIG_VIRT_DRIVERS is not set
# CONFIG_PM_DEVFREQ is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
# CONFIG_VME_BUS is not set
# CONFIG_PWM is not set

#
# HP Simulator drivers
#
# CONFIG_HP_SIMSERIAL is not set
# CONFIG_MSPEC is not set

#
# File systems
#
# CONFIG_EXT2_FS is not set
# CONFIG_EXT3_FS is not set
# CONFIG_EXT4_FS is not set
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
# CONFIG_XFS_FS is not set
# CONFIG_GFS2_FS is not set
# CONFIG_FS_POSIX_ACL is not set
CONFIG_FILE_LOCKING=y
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
# CONFIG_FANOTIFY is not set
# CONFIG_QUOTA is not set
# CONFIG_QUOTACTL is not set
# CONFIG_AUTOFS4_FS is not set
# CONFIG_FUSE_FS is not set

#
# Caches
#
# CONFIG_FSCACHE is not set

#
# CD-ROM/DVD Filesystems
#
# CONFIG_ISO9660_FS is not set
# CONFIG_UDF_FS is not set

#
# DOS/FAT/NT Filesystems
#
# CONFIG_MSDOS_FS is not set
# CONFIG_VFAT_FS is not set
# CONFIG_NTFS_FS is not set

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
# CONFIG_PROC_KCORE is not set
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_SYSFS=y
# CONFIG_TMPFS is not set
# CONFIG_HUGETLBFS is not set
# CONFIG_HUGETLB_PAGE is not set
# CONFIG_CONFIGFS_FS is not set
CONFIG_MISC_FILESYSTEMS=y
# CONFIG_HFSPLUS_FS is not set
# CONFIG_CRAMFS is not set
# CONFIG_SQUASHFS is not set
# CONFIG_VXFS_FS is not set
# CONFIG_MINIX_FS is not set
# CONFIG_OMFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_QNX6FS_FS is not set
# CONFIG_ROMFS_FS is not set
# CONFIG_PSTORE is not set
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
# CONFIG_NLS_CODEPAGE_437 is not set
# CONFIG_NLS_CODEPAGE_737 is not set
# CONFIG_NLS_CODEPAGE_775 is not set
# CONFIG_NLS_CODEPAGE_850 is not set
# CONFIG_NLS_CODEPAGE_852 is not set
# CONFIG_NLS_CODEPAGE_855 is not set
# CONFIG_NLS_CODEPAGE_857 is not set
# CONFIG_NLS_CODEPAGE_860 is not set
# CONFIG_NLS_CODEPAGE_861 is not set
# CONFIG_NLS_CODEPAGE_862 is not set
# CONFIG_NLS_CODEPAGE_863 is not set
# CONFIG_NLS_CODEPAGE_864 is not set
# CONFIG_NLS_CODEPAGE_865 is not set
# CONFIG_NLS_CODEPAGE_866 is not set
# CONFIG_NLS_CODEPAGE_869 is not set
# CONFIG_NLS_CODEPAGE_936 is not set
# CONFIG_NLS_CODEPAGE_950 is not set
# CONFIG_NLS_CODEPAGE_932 is not set
# CONFIG_NLS_CODEPAGE_949 is not set
# CONFIG_NLS_CODEPAGE_874 is not set
# CONFIG_NLS_ISO8859_8 is not set
# CONFIG_NLS_CODEPAGE_1250 is not set
# CONFIG_NLS_CODEPAGE_1251 is not set
# CONFIG_NLS_ASCII is not set
# CONFIG_NLS_ISO8859_1 is not set
# CONFIG_NLS_ISO8859_2 is not set
# CONFIG_NLS_ISO8859_3 is not set
# CONFIG_NLS_ISO8859_4 is not set
# CONFIG_NLS_ISO8859_5 is not set
# CONFIG_NLS_ISO8859_6 is not set
# CONFIG_NLS_ISO8859_7 is not set
# CONFIG_NLS_ISO8859_9 is not set
# CONFIG_NLS_ISO8859_13 is not set
# CONFIG_NLS_ISO8859_14 is not set
# CONFIG_NLS_ISO8859_15 is not set
# CONFIG_NLS_KOI8_R is not set
# CONFIG_NLS_KOI8_U is not set
# CONFIG_NLS_MAC_ROMAN is not set
# CONFIG_NLS_MAC_CELTIC is not set
# CONFIG_NLS_MAC_CENTEURO is not set
# CONFIG_NLS_MAC_CROATIAN is not set
# CONFIG_NLS_MAC_CYRILLIC is not set
# CONFIG_NLS_MAC_GAELIC is not set
# CONFIG_NLS_MAC_GREEK is not set
# CONFIG_NLS_MAC_ICELAND is not set
# CONFIG_NLS_MAC_INUIT is not set
# CONFIG_NLS_MAC_ROMANIAN is not set
# CONFIG_NLS_MAC_TURKISH is not set
# CONFIG_NLS_UTF8 is not set

#
# Kernel hacking
#
# CONFIG_PRINTK_TIME is not set
CONFIG_DEFAULT_MESSAGE_LOGLEVEL=4
CONFIG_ENABLE_WARN_DEPRECATED=y
CONFIG_ENABLE_MUST_CHECK=y
CONFIG_FRAME_WARN=2048
# CONFIG_MAGIC_SYSRQ is not set
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_UNUSED_SYMBOLS is not set
# CONFIG_DEBUG_FS is not set
# CONFIG_HEADERS_CHECK is not set
# CONFIG_DEBUG_SECTION_MISMATCH is not set
# CONFIG_DEBUG_KERNEL is not set
# CONFIG_HARDLOCKUP_DETECTOR is not set
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
# CONFIG_SLUB_DEBUG_ON is not set
# CONFIG_SLUB_STATS is not set
# CONFIG_SPARSE_RCU_POINTER is not set
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
# CONFIG_DMA_API_DEBUG is not set
# CONFIG_ATOMIC64_SELFTEST is not set
# CONFIG_SAMPLES is not set
# CONFIG_TEST_KSTRTOX is not set
CONFIG_IA64_GRANULE_16MB=y

#
# Security options
#
# CONFIG_KEYS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
# CONFIG_SECURITY is not set
# CONFIG_SECURITYFS is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_DEFAULT_SECURITY=""
# CONFIG_CRYPTO is not set
CONFIG_HAVE_KVM=y
CONFIG_VIRTUALIZATION=y
# CONFIG_BINARY_PRINTF is not set

#
# Library routines
#
CONFIG_BITREVERSE=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_GENERIC_IO=y
# CONFIG_CRC_CCITT is not set
# CONFIG_CRC16 is not set
# CONFIG_CRC_T10DIF is not set
# CONFIG_CRC_ITU_T is not set
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
# CONFIG_CRC7 is not set
# CONFIG_LIBCRC32C is not set
# CONFIG_CRC8 is not set
# CONFIG_XZ_DEC is not set
# CONFIG_XZ_DEC_BCJ is not set
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT=y
CONFIG_HAS_DMA=y
# CONFIG_AVERAGE is not set
# CONFIG_CORDIC is not set
# CONFIG_DDR is not set
CONFIG_IOMMU_HELPER=y

--ZmUaFz6apKcXQszQ--
