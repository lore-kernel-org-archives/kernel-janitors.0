From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 01 Feb 2013 17:38:21 +0000
Subject: build regressions 2013-02-01
Message-Id: <510bfd8d.nGL/6/oh4q5BiY1a%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
fs/nfs/dns_resolve.c:375:4: error: 'struct cache_detail' has no member named 'cache_upcall'
arch/arm/mach-omap2/devices.c:23:46: fatal error: linux/platform_data/mailbox-omap.h: No such file or directory
arch/arm/mach-omap2/omap_hwmod_44xx_data.c:32:46: fatal error: linux/platform_data/mailbox-omap.h: No such file or directory
arch/arm/mach-omap2/omap_hwmod_3xxx_data.c:28:46: fatal error: linux/platform_data/mailbox-omap.h: No such file or directory
arch/arm/mach-omap2/omap_hwmod_2430_data.c:20:46: fatal error: linux/platform_data/mailbox-omap.h: No such file or directory
arch/arm/mach-omap2/omap_hwmod_2420_data.c:19:46: fatal error: linux/platform_data/mailbox-omap.h: No such file or directory
drivers/mmc/core/sdio_bus.c:325: error: implicit declaration of function 'sdio_acpi_set_handle'
(.text+0xcc59): multiple definition of `iwl_leds_init'
drivers/net/wireless/iwlwifi/dvm/built-in.o:(.text+0x14832): first defined here
(.text+0xc7ec): multiple definition of `iwl_power_update_mode'
drivers/net/wireless/iwlwifi/dvm/built-in.o:(.text+0x127dc): first defined here
(.text+0x53df): multiple definition of `iwl_send_lq_cmd'
drivers/net/wireless/iwlwifi/dvm/built-in.o:(.text+0xfb6a): first defined here
(.text+0xcd37): multiple definition of `iwl_leds_exit'
drivers/net/wireless/iwlwifi/dvm/built-in.o:(.text+0x14940): first defined here
ERROR: "need_load_eval" [drivers/cpufreq/cpufreq_ondemand.ko] undefined!
/c/kernel-tests/src/x86/include/linux/kconfig.h:4:32: fatal error: generated/autoconf.h: No such file or directory
arch/microblaze/kernel/cpu/cache.c:350:1: error: expected ';' before '}' token
arch/microblaze/kernel/cpu/cache.c:359:13: error: invalid storage class for function '__invalidate_dcache_all_wb'
arch/microblaze/kernel/cpu/cache.c:374:1: error: expected ';' before '}' token
arch/microblaze/kernel/cpu/cache.c:376:13: error: invalid storage class for function '__invalidate_dcache_range_wb'
arch/microblaze/kernel/cpu/cache.c:396:13: error: invalid storage class for function '__invalidate_dcache_range_nomsr_wt'
arch/microblaze/kernel/cpu/cache.c:416:13: error: invalid storage class for function '__invalidate_dcache_range_msr_irq_wt'
arch/microblaze/kernel/cpu/cache.c:443:13: error: invalid storage class for function '__invalidate_dcache_range_nomsr_irq'
arch/microblaze/kernel/cpu/cache.c:471:13: error: invalid storage class for function '__flush_dcache_all_wb'
arch/microblaze/kernel/cpu/cache.c:488:13: error: invalid storage class for function '__flush_dcache_range_wb'
arch/microblaze/kernel/cpu/cache.c:520:2: error: initializer element is not constant
arch/microblaze/kernel/cpu/cache.c:521:2: error: initializer element is not constant
arch/microblaze/kernel/cpu/cache.c:523:2: error: initializer element is not constant
arch/microblaze/kernel/cpu/cache.c:536:2: error: initializer element is not constant
arch/microblaze/kernel/cpu/cache.c:537:2: error: initializer element is not constant
arch/microblaze/kernel/cpu/cache.c:539:2: error: initializer element is not constant
include/linux/printk.h:193:17: error: 'pr_warning' undeclared (first use in this function)
arch/microblaze/kernel/cpu/cpuinfo.c:90:10: error: expected ';' before string constant
arch/microblaze/kernel/cpu/cpuinfo.c:90:51: error: expected statement before ')' token
arch/microblaze/kernel/cpu/cpuinfo.c:95:10: error: expected ';' before string constant
arch/microblaze/kernel/cpu/cpuinfo.c:96:52: error: expected statement before ')' token
arch/microblaze/pci/pci-common.c:840:4: error: expected ')' before 'pci_name'
arch/microblaze/mm/mmu_context.c:33:27: error: 'LAST_CONTEXT' undeclared here (not in a function)
arch/microblaze/mm/mmu_context.c:46:25: error: 'FIRST_CONTEXT' undeclared (first use in this function)
arch/microblaze/mm/mmu_context.c:64:25: error: 'FIRST_CONTEXT' undeclared (first use in this function)
arch/microblaze/mm/mmu_context.c:68:2: error: implicit declaration of function 'destroy_context' [-Werror=implicit-function-declaration]
arch/microblaze/mm/init.c:455:2: error: implicit declaration of function 'mmu_context_init' [-Werror=implicit-function-declaration]
arch/microblaze/kernel/dma.c:180:26: error: conflicting type qualifiers for 'dma_direct_ops'
arch/microblaze/kernel/dma.c:193:1: error: conflicting type qualifiers for 'dma_direct_ops'
arch/microblaze/mm/fault.c:72:2: error: implicit declaration of function 'search_exception_tables' [-Werror=implicit-function-declaration]
init/initrd_sig.c:170:19: error: conflicting types for 'check_signature'
init/initramfs_sig.c:61:2: error: implicit declaration of function 'vmalloc' [-Werror=implicit-function-declaration]
init/initramfs_sig.c:114:2: error: implicit declaration of function 'vfree' [-Werror=implicit-function-declaration]
kernel/cgroup_freezer.c:225:3: error: implicit declaration of function 'freeze_task'
kernel/cgroup_freezer.c:151:3: error: 'system_freezing_cnt' undeclared (first use in this function)
kernel/cgroup_freezer.c:315:4: error: 'system_freezing_cnt' undeclared (first use in this function)
drivers/gpu/drm/nouveau/nouveau_bo.c:1301:2: error: implicit declaration of function 'swiotlb_nr_tbl'
drivers/gpu/drm/radeon/radeon_ttm.c:634:2: error: implicit declaration of function 'swiotlb_nr_tbl'
make[2]: *** No rule to make target `arch/x86/include/asm/mca_dma.h', needed by `Documentation/DocBook/kernel-api.xml'.
make[1]: *** No rule to make target `include/config/auto.conf', needed by `include/config/kernel.release'.
mm/slab.c:2416:102: error: 'align' undeclared (first use in this function)
drivers/net/ethernet/mellanox/mlx4/en_ethtool.c:716:3: error: implicit declaration of function 'ip_eth_mc_map' [-Werror=implicit-function-declaration]

[warnings]
fs/nfs/dns_resolve.c:376: warning: left-hand operand of comma expression has no effect
fs/nfs/dns_resolve.c:377: warning: value computed is not used
fs/nfs/dns_resolve.c:378: warning: value computed is not used
fs/nfs/dns_resolve.c:379: warning: value computed is not used
fs/nfs/dns_resolve.c:380: warning: value computed is not used
fs/nfs/dns_resolve.c:381: warning: value computed is not used
fs/nfs/dns_resolve.c:383: warning: value computed is not used
drivers/media/pci/pt1/va1j5jf8007s.c:143:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/media/pci/pt1/va1j5jf8007s.c:508:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/media/pci/pt1/va1j5jf8007t.c:127:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/media/pci/pt1/va1j5jf8007t.c:354:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ext4/extents_status.c:510:22: warning: 'es1' may be used uninitialized in this function [-Wmaybe-uninitialized]
warning: (DRM_I915 && STUB_POULSBO && ACER_WMI) selects ACPI_VIDEO which has unmet direct dependencies (ACPI && X86 && BACKLIGHT_CLASS_DEVICE && VIDEO_OUTPUT_CONTROL && INPUT)
warning: (DRM_I915 && STUB_POULSBO && ACER_WMI) selects ACPI_VIDEO which has unmet direct dependencies (ACPI && X86 && BACKLIGHT_CLASS_DEVICE && VIDEO_OUTPUT_CONTROL && INPUT)
warning: (DRM_I915 && STUB_POULSBO && ACER_WMI) selects ACPI_VIDEO which has unmet direct dependencies (ACPI && X86 && BACKLIGHT_CLASS_DEVICE && VIDEO_OUTPUT_CONTROL && INPUT)
warning: (LOCKDEP && FAULT_INJECTION_STACKTRACE_FILTER && LATENCYTOP && KMEMCHECK) selects FRAME_POINTER which has unmet direct dependencies (DEBUG_KERNEL && (CRIS || M68K || FRV || UML || AVR32 || SUPERH || BLACKFIN || MN10300) || ARCH_WANT_FRAME_POINTERS)
warning: (LOCKDEP && FAULT_INJECTION_STACKTRACE_FILTER && LATENCYTOP && KMEMCHECK) selects FRAME_POINTER which has unmet direct dependencies (DEBUG_KERNEL && (CRIS || M68K || FRV || UML || AVR32 || SUPERH || BLACKFIN || MN10300) || ARCH_WANT_FRAME_POINTERS)
warning: (LOCKDEP && FAULT_INJECTION_STACKTRACE_FILTER && LATENCYTOP && KMEMCHECK) selects FRAME_POINTER which has unmet direct dependencies (DEBUG_KERNEL && (CRIS || M68K || FRV || UML || AVR32 || SUPERH || BLACKFIN || MN10300) || ARCH_WANT_FRAME_POINTERS)
WARNING: arch/ia64/kernel/built-in.o(.exit.text+0x491): Section mismatch in reference from the function err_inject_exit() to the variable .cpuinit.data:err_inject_cpu_notifier
arch/microblaze/kernel/cpu/cache.c:376:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
arch/microblaze/kernel/cpu/cache.c:359:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
arch/microblaze/pci/pci-common.c:840:4: warning: format '%s' expects a matching 'char *' argument [-Wformat]
arch/microblaze/pci/pci-common.c:840:4: warning: format '%d' expects a matching 'int' argument [-Wformat]
arch/microblaze/pci/pci-common.c:840:4: warning: format '%llx' expects a matching 'long long unsigned int' argument [-Wformat]
arch/microblaze/pci/pci-common.c:840:4: warning: format '%llx' expects a matching 'long long unsigned int' argument [-Wformat]
arch/microblaze/pci/pci-common.c:840:4: warning: format '%x' expects a matching 'unsigned int' argument [-Wformat]
arch/microblaze/mm/fault.c:72:8: warning: assignment makes pointer from integer without a cast [enabled by default]
fs/nfs/dns_resolve.c:127:13: warning: 'nfs_dns_request' defined but not used
drivers/input/joystick/analog.c:175:2: warning: #warning Precise timer not defined for this architecture. [-Wcpp]
drivers/regulator/tps62360-regulator.c:364:13: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/scsi/aic7xxx_old.c:7901:5: warning: case value '257' not in enumerated type 'ahc_chip' [-Wswitch]
drivers/scsi/aic7xxx_old.c:7898:5: warning: case value '513' not in enumerated type 'ahc_chip' [-Wswitch]
drivers/scsi/aic7xxx_old.c:8517:5: warning: case value '257' not in enumerated type 'ahc_chip' [-Wswitch]
drivers/scsi/aic7xxx_old.c:8510:5: warning: case value '513' not in enumerated type 'ahc_chip' [-Wswitch]
drivers/scsi/ips.c:210:2: warning: #warning "This driver has only been tested on the x86/ia64/x86_64 platforms" [-Wcpp]
drivers/spi/spi-gpio.c:255:8: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/staging/bcm/CmHost.c:1387:39: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/bcm/CmHost.c:1426:37: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/bcm/CmHost.c:1440:35: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/isdn/hardware/mISDN/hfcpci.c:2298:2: warning: ignoring return value of 'driver_for_each_device', declared with attribute warn_unused_result [-Wunused-result]
drivers/mfd/syscon.c:135:2: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'resource_size_t' [-Wformat]
drivers/mfd/syscon.c:135:2: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t' [-Wformat]
drivers/mfd/tps65217.c:173:13: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/net/wireless/ath/ath6kl/htc_pipe.c:1280:26: warning: integer overflow in expression [-Woverflow]
drivers/staging/cxt1e1/functions.c:275:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/tty/ehv_bytechan.c:362:1: warning: data definition has no type or storage class [enabled by default]
drivers/tty/ehv_bytechan.c:362:1: warning: type defaults to 'int' in declaration of 'console_initcall' [-Wimplicit-int]
drivers/tty/ehv_bytechan.c:362:1: warning: parameter names (without types) in function declaration [enabled by default]
<stdin>:1220:2: warning: #warning syscall kcmp not implemented [-Wcpp]
drivers/net/ethernet/amd/nmclan_cs.c:625:3: warning: 'pcmcia_request_exclusive_irq' is deprecated (declared at include/pcmcia/ds.h:201) [-Wdeprecated-declarations]
drivers/media/pci/ivtv/ivtv-driver.c:307:2: warning: 'flush_work_sync' is deprecated (declared at include/linux/workqueue.h:448) [-Wdeprecated-declarations]
drivers/scsi/mvsas/mv_sas.c:1156:34: warning: comparison between 'enum sas_device_type' and 'enum sas_dev_type' [-Wenum-compare]
drivers/scsi/mvsas/mv_sas.c:1159:39: warning: comparison between 'enum sas_device_type' and 'enum sas_dev_type' [-Wenum-compare]
drivers/net/ethernet/xilinx/ll_temac_main.c:635:22: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
sound/soc/codecs/adau1373.c:940:3: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/i2c/busses/i2c-ocores.c:334:15: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
<stdin>:1220:2: warning: #warning syscall kcmp not implemented [-Wcpp]
WARNING: mm/built-in.o(.meminit.text+0x107c): Section mismatch in reference from the function .free_area_init_core.isra.38() to the function .init.text:.set_pageblock_order()
WARNING: arch/powerpc/sysdev/built-in.o(.text+0xecc0): Section mismatch in reference from the function .ics_rtas_init() to the function .init.text:.xics_register_ics()
WARNING: arch/powerpc/kernel/built-in.o(.text+0x3dce0): Section mismatch in reference from the function .start_secondary() to the function .cpuinit.text:.vdso_getcpu_init()
usr/include/linux/kexec.h:49: userspace cannot reference function or variable defined in the kernel
usr/include/linux/soundcard.h:1054: userspace cannot reference function or variable defined in the kernel
WARNING: vmlinux.o(.text+0x90be): Section mismatch in reference from the variable generic_secondary_common_init to the variable .init.data:spinning_secondaries
WARNING: vmlinux.o(.text+0x2bc84): Section mismatch in reference from the function .early_setup_secondary() to the function .cpuinit.text:.early_init_mmu_secondary()
WARNING: vmlinux.o(.text+0x490e4): Section mismatch in reference from the function .start_secondary() to the function .cpuinit.text:.notify_cpu_starting()
WARNING: vmlinux.o(.text+0x528e8): Section mismatch in reference from the function .wake_offline_cpus() to the function .cpuinit.text:.cpu_up()
WARNING: vmlinux.o(.text+0x98078): Section mismatch in reference from the function .dlpar_online_cpu() to the function .cpuinit.text:.cpu_up()
warning: (MPC836x_RDK && MTD_NAND_FSL_ELBC && MTD_NAND_FSL_UPM) selects FSL_LBC which has unmet direct dependencies (FSL_SOC)
warning: (MPC836x_RDK && MTD_NAND_FSL_ELBC && MTD_NAND_FSL_UPM) selects FSL_LBC which has unmet direct dependencies (FSL_SOC)
warning: (MPC836x_RDK && MTD_NAND_FSL_ELBC && MTD_NAND_FSL_UPM) selects FSL_LBC which has unmet direct dependencies (FSL_SOC)
init/initramfs_sig.c:61:6: warning: assignment makes pointer from integer without a cast [enabled by default]
<stdin>:1220:2: warning: #warning syscall kcmp not implemented [-Wcpp]
drivers/gpu/drm/radeon/evergreend.h:502:0: warning: "INT_MASK" redefined [enabled by default]
drivers/gpu/drm/radeon/evergreend.h:502:0: warning: "INT_MASK" redefined [enabled by default]
drivers/gpu/drm/radeon/evergreend.h:502:0: warning: "INT_MASK" redefined [enabled by default]
drivers/infiniband/hw/qib/qib_iba7322.c:177:0: warning: "INT_MASK" redefined [enabled by default]
drivers/net/vmxnet3/vmxnet3_drv.c:1380:4: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/net/vmxnet3/vmxnet3_drv.c:1385:3: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/scsi/bnx2fc/bnx2fc_io.c:653:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/scsi/bnx2fc/bnx2fc_io.c:665:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/scsi/bnx2i/bnx2i_iscsi.c:544:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/staging/comedi/drivers/cb_pcidas.c:115:0: warning: "INT_MASK" redefined [enabled by default]
drivers/video/nvidia/nvidia.c:556:3: warning: passing argument 1 of 'memset_io' discards 'volatile' qualifier from pointer target type [enabled by default]
drivers/video/riva/fbdev.c:1615:3: warning: passing argument 1 of 'memset_io' discards 'volatile' qualifier from pointer target type [enabled by default]
drivers/net/ethernet/broadcom/cnic.c:1387:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/net/ethernet/broadcom/cnic.c:1399:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/net/ethernet/broadcom/cnic.c:1414:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/net/ethernet/broadcom/cnic.c:1429:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/net/ethernet/rdc/r6040.c:170:0: warning: "INT_MASK" redefined [enabled by default]
drivers/net/ethernet/ethoc.c:34:0: warning: "INT_MASK" redefined [enabled by default]
drivers/gpu/drm/radeon/sid.h:260:0: warning: "INT_MASK" redefined [enabled by default]
drivers/usb/host/ohci-hcd.c:1120:0: warning: "PLATFORM_DRIVER" redefined [enabled by default]
drivers/media/pci/ivtv/ivtvfb.c:1159:2: warning: passing argument 1 of 'memset_io' discards 'volatile' qualifier from pointer target type [enabled by default]
WARNING: drivers/w1/masters/w1-gpio.o(.data+0x190): Section mismatch in reference from the variable w1_gpio_driver to the function .init.text:w1_gpio_probe()
<stdin>:1220:2: warning: #warning syscall kcmp not implemented [-Wcpp]
<stdin>:1223:2: warning: #warning syscall finit_module not implemented [-Wcpp]
kernel/seccomp.c:100:17: warning: 'value' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/media/pci/saa7164/saa7164-encoder.c:377:5: warning: 'tsport' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/media/pci/saa7164/saa7164-vbi.c:349:5: warning: 'tsport' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:631:7: warning: 'status' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/ext4/inode.c:560:2: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
init/initrd_sig.c:23:2: sparse: "Sparse checking disabled for this file"
fs/ext4/extents_status.c:442:27: sparse: invalid access past the end of 'newes' (24 28)
fs/ext4/extents_status.c:442:27: sparse: invalid access past the end of 'newes' (24 28)
fs/ext4/extents_status.c:442:27: sparse: invalid access past the end of 'newes' (24 28)
fs/ext4/extents_status.c:495:50: sparse: invalid access past the end of 'newes' (24 28)
fs/ext4/extents_status.c:495:50: sparse: invalid access past the end of 'orig_es' (24 28)
fs/ext4/extents_status.c:481:29: sparse: invalid access past the end of 'orig_es' (24 28)
fs/ext4/extents_status.c:495:50: sparse: invalid access past the end of 'newes' (24 28)
fs/ext4/extents_status.c:495:50: sparse: invalid access past the end of 'orig_es' (24 28)
fs/ext4/extents_status.h:70:17: sparse: invalid access past the end of 'orig_es' (24 28)
fs/ext4/extents_status.c:481:29: sparse: invalid access past the end of 'orig_es' (24 28)
fs/ext4/extents_status.c:495:50: sparse: invalid access past the end of 'newes' (24 28)
fs/ext4/extents_status.h:70:17: sparse: invalid access past the end of 'orig_es' (24 28)
fs/ext4/extents_status.c:481:29: sparse: invalid access past the end of 'orig_es' (24 28)
fs/ext4/extents_status.h:70:17: sparse: invalid access past the end of 'es' (24 28)
fs/ext4/extents_status.h:70:17: sparse: invalid access past the end of 'es' (24 28)
fs/ext4/extents_status.h:70:17: sparse: invalid access past the end of 'es' (24 28)
fs/ext4/extents_status.h:70:17: sparse: invalid access past the end of 'es' (24 28)
fs/ext4/extents_status.h:70:17: sparse: invalid access past the end of 'es' (24 28)
mm/slab_common.c:385:13: sparse: restricted gfp_t degrades to integer
drivers/tty/tty_port.c:142:18: sparse: symbol 'tty_port_attrs' was not declared. Should it be static?
init/initramfs_sig.c:23:2: sparse: "Sparse checking disabled for this file"
fs/nfs/dns_resolve.c:375:11: sparse: no member 'cache_upcall' in struct cache_detail

[smatch]
init/initrd_sig.c:159 make_digest() warn: possible memory leak of 'buf'
init/initrd_sig.c:192 check_signature() warn: possible memory leak of 'buf'

[cppcheck]
include/linux/rcupdate.h:275: error: "Unknown RCU implementation specified to kernel configuration"
include/linux/jiffies.h:39: error: Invalid value of HZ.
arch/powerpc/include/asm/tlbflush.h:170: error: Unsupported MMU type
include/linux/rcupdate.h:275: error: #error "Unknown RCU implementation specified to kernel configuration"
include/linux/jiffies.h:39: error: Invalid value of HZ.
include/linux/rcupdate.h:275: error: "Unknown RCU implementation specified to kernel configuration"
arch/powerpc/include/asm/tlbflush.h:170: error: Unsupported MMU type
include/linux/jiffies.h:39: error: #error Invalid value of HZ.
include/linux/jiffies.h:39: error: Invalid value of HZ.
include/linux/rcupdate.h:275: error: "Unknown RCU implementation specified to kernel configuration"
include/linux/jiffies.h:39: error: #error Invalid value of HZ.

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
