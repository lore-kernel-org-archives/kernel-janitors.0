From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 26 Oct 2012 17:22:22 +0000
Subject: build regressions 2012-10-26
Message-Id: <20121026172222.GA1086@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/include/asm/dma-mapping.h:94:2: error: implicit declaration of function 'debug_dma_mapping_error' [-Werror=implicit-function-declaration]
drivers/acpi/osl.c:629:29: error: 'max_low_pfn_mapped' undeclared (first use in this function)
drivers/staging/telephony/ixj.c:7732:38: error: expected ';' before 'pci_resource_start'
drivers/scsi/gdth.c:1111:34: error: lvalue required as left operand of assignment
net/core/sock.c:1267:3: error: too many arguments to function 'sock_update_classid'

[warnings]
drivers/staging/telephony/ixj.c:7732:13: warning: assignment makes integer from pointer without a cast [enabled by default]
drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c:1742:2: warning: 'err' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/gpu/drm/nouveau/core/subdev/gpio/nv50.c:81:9: warning: 'reg' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
init/main.c:163:13: sparse: undefined identifier '__setup_very_very_end'

[smatch]
drivers/usb/host/ehci-lpm.c:95 ehci_update_device() error: we previously assumed 'udev->parent' could be null (see line 92)
drivers/usb/chipidea/../host/ehci-lpm.c:95 ehci_update_device() error: we previously assumed 'udev->parent' could be null (see line 92)
drivers/input/tablet/wacom_sys.c:394 wacom_parse_hid() warn: should this be a bitwise op?
drivers/gpio/gpiolib.c:774 gpio_export() warn: inconsistent returns mutex:&sysfs_lock: locked (731) unlocked (712,717,767,774)
drivers/hwmon/w83627ehf.c:2672 w83627ehf_resume() error: buffer overflow 'W83627EHF_REG_TEMP_OFFSET' 3 <= 8
drivers/hwmon/w83627ehf.c:2673 w83627ehf_resume() error: buffer overflow 'data->temp_offset' 3 <= 8
drivers/misc/mei/main.c:787 mei_write() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/usb/serial/usb_wwan.c:505 usb_wwan_port_probe() error: port->bulk_out_endpointAddress is never equal to -1 (wrong type 0 - 255).

[cppcheck]
In file included from drivers/net/caif/caif_spi_slave.c:
arch/x86/include/asm/module.h:59: error: unknown processor family
In file included from fs/nfsd/nfsfh.c:
include/linux/jiffies.h:39: error: #error Invalid value of HZ.
In file included from drivers/net/ethernet/mellanox/mlx4/pd.c:
In file included from drivers/misc/bh1780gli.c:
In file included from drivers/media/pci/cx18/cx18-audio.c:
drivers/media/pci/cx18/cx18-driver.h:70: error: "This driver requires kernel PCI support."
In file included from fs/ntfs/debug.c:
In file included from drivers/rapidio/switches/tsi57x.c:
In file included from drivers/usb/host/ohci-hcd.c:
drivers/usb/host/ohci-hcd.c:1132: error: "missing bus glue for ohci-hcd"
In file included from drivers/net/wireless/b43legacy/main.c:
drivers/net/wireless/b43legacy/b43legacy.h:775: error: "Using neither DMA nor PIO? Confused..."
In file included from drivers/usb/host/uhci-hcd.c:
drivers/usb/host/uhci-hcd.c:855: error: "missing bus glue for uhci-hcd"
In file included from net/llc/sysctl_net_llc.c:
net/llc/sysctl_net_llc.c:14: error: This file should not be compiled without CONFIG_SYSCTL defined
In file included from drivers/net/wireless/b43legacy/ilt.c:
In file included from drivers/net/wireless/b43legacy/phy.c:
kernel/rcutree.h:73: error: "CONFIG_RCU_FANOUT insufficient for NR_CPUS"
In file included from drivers/usb/host/pci-quirks.c:
include/linux/slub_def.h:161: warning: Using sizeof with a numeric constant as function argument might not be what you intended.
include/linux/sched.h:161: warning: Using sizeof with a numeric constant as function argument might not be what you intended.
arch/x86/include/asm/paravirt.h:25: warning: Redundant assignment of "__eax" to itself
arch/x86/include/asm/paravirt.h:25: warning: Redundant assignment of "__edx" to itself
arch/x86/include/asm/paravirt.h:25: warning: Redundant assignment of "__ecx" to itself
arch/x86/include/asm/processor.h:945: style: Same expression on both sides of '|'.
arch/x86/include/asm/tsc.h:27: style: Same expression on both sides of '|'.
arch/x86/include/asm/acpi.h:158: style: Same expression on both sides of '|'.
arch/x86/include/asm/apic.h:496: style: Same expression on both sides of '|'.
arch/x86/include/asm/smp.h:29: style: Same expression on both sides of '|'.
arch/x86/include/asm/pgtable.h:165: style: Same expression on both sides of '|'.
include/linux/slub_def.h:161: style: Same expression on both sides of '&'.
arch/x86/include/asm/percpu.h:510: style: Statements following return, break, continue, goto or throw will never be executed.
arch/x86/include/asm/current.h:14: style: Statements following return, break, continue, goto or throw will never be executed.
arch/x86/include/asm/paravirt.h:40: style: Statements following return, break, continue, goto or throw will never be executed.
arch/x86/include/asm/processor.h:171: style: Statements following return, break, continue, goto or throw will never be executed.
arch/x86/include/asm/atomic.h:182: style: Statements following return, break, continue, goto or throw will never be executed.
include/linux/debug_locks.h:16: style: Statements following return, break, continue, goto or throw will never be executed.
arch/x86/include/asm/spinlock.h:76: style: Statements following return, break, continue, goto or throw will never be executed.
include/linux/spinlock.h:350: style: Statements following return, break, continue, goto or throw will never be executed.
include/linux/kobject.h:175: style: Statements following return, break, continue, goto or throw will never be executed.
include/linux/jiffies.h:305: style: Statements following return, break, continue, goto or throw will never be executed.
include/linux/workqueue.h:110: style: Statements following return, break, continue, goto or throw will never be executed.
include/linux/device.h:700: style: Statements following return, break, continue, goto or throw will never be executed.
include/linux/nodemask.h:239: style: Statements following return, break, continue, goto or throw will never be executed.
arch/x86/include/asm/rwsem.h:207: style: Statements following return, break, continue, goto or throw will never be executed.
include/linux/rcupdate.h:383: style: Statements following return, break, continue, goto or throw will never be executed.
arch/x86/include/asm/apic.h:662: style: Statements following return, break, continue, goto or throw will never be executed.
arch/x86/include/asm/smp.h:43: style: Statements following return, break, continue, goto or throw will never be executed.
arch/x86/include/asm/mmzone_32.h:56: style: Statements following return, break, continue, goto or throw will never be executed.
include/linux/topology.h:185: style: Statements following return, break, continue, goto or throw will never be executed.
include/linux/mm.h:743: style: Statements following return, break, continue, goto or throw will never be executed.
include/linux/scatterlist.h:186: style: Statements following return, break, continue, goto or throw will never be executed.
include/linux/plist.h:240: style: Statements following return, break, continue, goto or throw will never be executed.
include/linux/llist.h:178: style: Statements following return, break, continue, goto or throw will never be executed.
include/linux/aio.h:235: style: Statements following return, break, continue, goto or throw will never be executed.
include/linux/sched.h:2362: style: Statements following return, break, continue, goto or throw will never be executed.
include/acpi/platform/aclinux.h:130: style: Statements following return, break, continue, goto or throw will never be executed.
include/linux/rculist_bl.h:23: style: Statements following return, break, continue, goto or throw will never be executed.
include/linux/radix-tree.h:152: style: Statements following return, break, continue, goto or throw will never be executed.
include/linux/proc_fs.h:280: style: Statements following return, break, continue, goto or throw will never be executed.
include/linux/list.h:216: style: The scope of the variable 'first' can be reduced
include/linux/cpumask.h:108: style: The scope of the variable '__warned' can be reduced
drivers/usb/host/pci-quirks.c:199: style: The scope of the variable 'addr_low' can be reduced
drivers/usb/host/pci-quirks.c:199: style: The scope of the variable 'addr_high' can be reduced
drivers/usb/host/pci-quirks.c:627: style: The scope of the variable 'wait_time' can be reduced
include/linux/rcupdate.h:289: style: Variable '__here' is not assigned a value
include/linux/mm.h:340: style: Variable 'uninitialized_var' is assigned a value that is never used
include/linux/signal.h:78: error: Array 'set.sig[2]' accessed at index 3, which is out of bounds.
include/linux/signal.h:120: error: Array 'r.sig[2]' accessed at index 3, which is out of bounds.
include/linux/capability.h:113: performance: Function parameter 'a' should be passed by reference.
include/linux/capability.h:114: performance: Function parameter 'b' should be passed by reference.
include/linux/capability.h:130: performance: Function parameter 'drop' should be passed by reference.
include/linux/capability.h:137: performance: Function parameter 'c' should be passed by reference.
include/linux/capability.h:161: performance: Function parameter 'set' should be passed by reference.
include/linux/capability.h:183: performance: Function parameter 'permitted' should be passed by reference.
include/linux/spinlock_api_smp.h:108: warning: Redundant code: Found a statement that begins with numeric constant
include/linux/rwlock_api_smp.h:157: warning: Redundant code: Found a statement that begins with numeric constant
include/linux/spinlock.h:340: warning: Redundant code: Found a statement that begins with numeric constant
include/linux/srcu.h:246: warning: Redundant code: Found a statement that begins with numeric constant
include/linux/topology.h:199: warning: Redundant code: Found a statement that begins with numeric constant
include/linux/mm.h:342: warning: Redundant code: Found a statement that begins with numeric constant
include/linux/vmstat.h:37: warning: Redundant code: Found a statement that begins with numeric constant
include/linux/proportions.h:75: warning: Redundant code: Found a statement that begins with numeric constant
include/linux/sched.h:2169: warning: Redundant code: Found a statement that begins with numeric constant
include/linux/percpu-rwsem.h:21: warning: Redundant code: Found a statement that begins with numeric constant
drivers/usb/host/pci-quirks.c:101: warning: Redundant code: Found a statement that begins with numeric constant
arch/x86/include/asm/paravirt.h:25: error: Uninitialized variable: __eax
arch/x86/include/asm/paravirt.h:25: error: Uninitialized variable: __edx
arch/x86/include/asm/paravirt.h:25: error: Uninitialized variable: __ecx
include/linux/spinlock_api_smp.h:108: error: Uninitialized variable: __dummy
include/linux/rwlock_api_smp.h:157: error: Uninitialized variable: __dummy
include/linux/spinlock.h:340: error: Uninitialized variable: __dummy
include/linux/nodemask.h:239: error: Uninitialized variable: __min2
include/linux/nodemask.h:239: error: Uninitialized variable: __min1
include/linux/rcupdate.h:383: error: Uninitialized variable: __dummy
include/linux/srcu.h:246: error: Uninitialized variable: __dummy
arch/x86/include/asm/mmzone_32.h:56: error: Uninitialized variable: __pgdat
include/linux/topology.h:199: error: Uninitialized variable: __dummy
include/linux/mm.h:342: error: Uninitialized variable: __dummy
include/linux/mm.h:412: error: Uninitialized variable: __nid
include/linux/vmstat.h:37: error: Uninitialized variable: __dummy
include/linux/mm.h:743: error: Uninitialized variable: __pgdat
include/linux/scatterlist.h:114: error: Uninitialized variable: __nid
include/linux/scatterlist.h:186: error: Uninitialized variable: __pgdat
include/asm-generic/dma-mapping-common.h:20: error: Uninitialized variable: __nid
arch/x86/include/asm/dma-mapping.h:165: error: Uninitialized variable: __dummy
include/linux/proportions.h:75: error: Uninitialized variable: __dummy
include/linux/sched.h:2169: error: Uninitialized variable: __dummy
include/acpi/platform/aclinux.h:130: error: Uninitialized variable: __dummy
include/linux/percpu-rwsem.h:21: error: Uninitialized variable: __dummy
drivers/usb/host/pci-quirks.c:101: error: Uninitialized variable: __dummy
In file included from fs/romfs/storage.c:
fs/romfs/storage.c:18: error: no ROMFS backing store interface configured
In file included from drivers/media/platform/marvell-ccic/cafe-driver.c:
drivers/media/platform/marvell-ccic/mcam-core.h:32: error: One of the videobuf buffer modes must be selected in the config
In file included from drivers/scsi/sym53c8xx_2/sym_fw.c:
drivers/scsi/sym53c8xx_2/sym_hipd.h:1118: error: "Unsupported DMA addressing mode"
In file included from drivers/media/pci/cx18/cx18-alsa-pcm.c:
In file included from drivers/scsi/sym53c8xx_2/sym_glue.c:
In file included from kernel/rcutree_trace.c:
In file included from drivers/usb/host/ehci-hcd.c:
drivers/usb/host/ehci-hcd.c:1345: error: "missing bus glue for ehci-hcd"
In file included from lib/uuid.c:
include/linux/uuid.h:26: performance: Function parameter 'u1' should be passed by reference.
include/linux/uuid.h:26: performance: Function parameter 'u2' should be passed by reference.
In file included from net/ipx/sysctl_net_ipx.c:
net/ipx/sysctl_net_ipx.c:14: error: This file should not be compiled without CONFIG_SYSCTL defined
In file included from net/dccp/sysctl.c:
net/dccp/sysctl.c:18: error: This file should not be compiled without CONFIG_SYSCTL defined
In file included from arch/x86/kernel/early_printk.c:
arch/x86/include/asm/msr.h:259: style: Statements following return, break, continue, goto or throw will never be executed.
arch/x86/include/asm/atomic64_64.h:173: style: Statements following return, break, continue, goto or throw will never be executed.
include/linux/math64.h:55: style: The scope of the variable '__rem' can be reduced
arch/x86/include/asm/processor.h:945: style: The scope of the variable '__warned' can be reduced
arch/x86/kernel/early_printk.c:128: style: The scope of the variable 'port' can be reduced
include/linux/math64.h:55: style: Variable '__rem' is assigned a value that is never used
In file included from drivers/video/pm3fb.c:
drivers/video/pm3fb.c:42: error: "Only generic PCI cards supported."
In file included from drivers/video/pm2fb.c:
drivers/video/pm2fb.c:53: error: "Only generic PCI cards supported."
arch/x86/include/asm/bios_ebda.h:37: error: Uninitialized variable: __min1
arch/x86/include/asm/bios_ebda.h:37: error: Uninitialized variable: __min2
lib/flex_proportions.c:207: warning: Using sizeof with a numeric constant as function argument might not be what you intended.
lib/flex_proportions.c:207: style: Same expression on both sides of '&'.
include/linux/flex_proportions.h:66: warning: Redundant code: Found a statement that begins with numeric constant
lib/flex_proportions.c:68: warning: Redundant code: Found a statement that begins with numeric constant
include/linux/flex_proportions.h:66: error: Uninitialized variable: __dummy
lib/flex_proportions.c:68: error: Uninitialized variable: __dummy
arch/x86/include/asm/irq_regs.h:18: style: Statements following return, break, continue, goto or throw will never be executed.
arch/x86/include/asm/irq_regs.h:26: warning: Redundant code: Found a statement that begins with numeric constant
arch/x86/include/asm/irq_regs.h:26: error: Uninitialized variable: __dummy
drivers/video/console/fonts.c:71: error: No fonts configured.
lib/mpi/mpicoder.c:171: error: please implement for this limb size.
arch/x86/mm/setup_nx.c:34: style: Same expression on both sides of '|'.
arch/x86/platform/mrst/early_printk_mrst.c:142: warning: When using char variables in bit operations, sign extension can generate unexpected results.
arch/x86/lib/insn.c:239: style: The scope of the variable 'pfx_id' can be reduced
arch/x86/lib/insn.c:239: style: The scope of the variable 'mod' can be reduced
arch/x86/lib/insn.c:298: style: The scope of the variable 'modrm' can be reduced
arch/x86/lib/insn.c:329: style: The scope of the variable 'rm' can be reduced
arch/x86/lib/insn.c:329: style: The scope of the variable 'base' can be reduced
drivers/misc/altera-stapl/altera-lpt.c:48: style: The scope of the variable 'initial_lpt_ctrl' can be reduced
arch/x86/kernel/cpu/centaur.c:252: style: The scope of the variable 'lo' can be reduced
arch/x86/kernel/cpu/centaur.c:252: style: The scope of the variable 'hi' can be reduced
drivers/net/wireless/brcm80211/brcmsmac/phy/phy_qmath.c:111: style: The scope of the variable 'i' can be reduced
arch/x86/boot/cpucheck.c:111: style: The scope of the variable 'max_intel_level' can be reduced
arch/x86/boot/cpucheck.c:111: style: The scope of the variable 'max_amd_level' can be reduced
arch/x86/boot/cpucheck.c:112: style: The scope of the variable 'tfms' can be reduced
arch/x86/boot/early_serial_console.c:47: style: The scope of the variable 'pos' can be reduced
arch/x86/boot/cpu.c:23: style: The scope of the variable 'buf' can be reduced
drivers/staging/wlags49_h2/hcf.c:2147: style: The scope of the variable 'i' can be reduced
drivers/staging/wlags49_h2/hcf.c:2148: style: The scope of the variable 'key_p' can be reduced
drivers/staging/wlags49_h2/hcf.c:3422: style: The scope of the variable 'x32' can be reduced
drivers/staging/wlags49_h2/hcf.c:3859: style: The scope of the variable 'j' can be reduced
drivers/staging/wlags49_h2/hcf.c:4171: style: The scope of the variable 'info' can be reduced
drivers/staging/wlags49_h2/hcf.c:4600: style: The scope of the variable 'sp' can be reduced
drivers/staging/wlags49_h2/hcf.c:3154: style: struct or union member 'Anonymous5::x16' is never used
drivers/staging/wlags49_h2/hcf.c:3232: style: struct or union member 'Anonymous6::x16' is never used
lib/zlib_deflate/deftree.c:1024: style: The scope of the variable 'dist' can be reduced
lib/zlib_deflate/deftree.c:1025: style: The scope of the variable 'lc' can be reduced
lib/zlib_deflate/deftree.c:1026: style: The scope of the variable 'lx' can be reduced
lib/zlib_deflate/deftree.c:1027: style: The scope of the variable 'code' can be reduced
lib/zlib_deflate/deftree.c:1028: style: The scope of the variable 'extra' can be reduced
lib/zlib_inflate/inflate.c:119: style: The scope of the variable 'dist' can be reduced
lib/string_helpers.c:38: style: The scope of the variable 'j' can be reduced
lib/string_helpers.c:39: style: The scope of the variable 'remainder' can be reduced
lib/string_helpers.c:39: style: The scope of the variable 'sf_cap' can be reduced
lib/string_helpers.c:46: style: The scope of the variable '__rem' can be reduced
lib/string_helpers.c:46: style: Variable '__rem' is assigned a value that is never used
lib/string_helpers.c:46: error: Uninitialized variable: __base
lib/div64.c:67: error: Uninitialized variable: __x
lib/strnlen_user.c:50: error: Uninitialized variable: c
net/netfilter/nf_conntrack_h323_asn1.c:208: style: The scope of the variable 'shift' can be reduced
net/netfilter/nf_conntrack_h323_asn1.c:208: style: The scope of the variable 'bytes' can be reduced
arch/powerpc/include/asm/tlbflush.h:170: error: Unsupported MMU type

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
