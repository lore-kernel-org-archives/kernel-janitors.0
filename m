From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 25 Jan 2013 16:16:52 +0000
Subject: build regressions 2013-01-25
Message-Id: <5102aff4.BK7FE7egitsDnCeL%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/video/Kconfig:57:error: recursive dependency detected!
drivers/video/Kconfig:57:error: recursive dependency detected!
drivers/gpu/drm/tilcdc/tilcdc_drv.c:509:5: error: "CONFIG_PM_SLEEP" is not defined [-Werror=undef]

[warnings]
drivers/tty/goldfish.c:83:3: warning: passing argument 1 of 'tty_prepare_flip_string' from incompatible pointer type [enabled by default]
drivers/tty/goldfish.c:89:3: warning: passing argument 1 of 'tty_schedule_flip' from incompatible pointer type [enabled by default]
mm/memory.c:73:2: warning: #warning Unfortunate NUMA and NUMA Balancing config, growing page-frame for last_nid. [-Wcpp]
WARNING: drivers/input/built-in.o(.init.text+0x2c11): Section mismatch in reference from the function rmi_bus_init() to the function .exit.text:rmi_unregister_f01_handler()
fs/f2fs/recovery.c:225:52: warning: 'sum.<U 428>.<U 390>.ofs_in_node' may be used uninitialized in this function [-Wmaybe-uninitialized]
warning: (DRM_RADEON_KMS && DRM_I915 && DRM_TILCDC && STUB_POULSBO && FB_BACKLIGHT && USB_APPLEDISPLAY && FB_OLPC_DCON && ASUS_LAPTOP && SONY_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_CMPC && SAMSUNG_Q10) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)
include/linux/usb/phy.h:194:2: warning: return makes integer from pointer without a cast [enabled by default]
drivers/acpi/power.c:81:3: warning: initialization from incompatible pointer type [enabled by default]
drivers/acpi/power.c:81:3: warning: (near initialization for 'acpi_power_driver.ops.remove') [enabled by default]
security/selinux/selinuxfs.c:1487:16: warning: unused variable 'inode' [-Wunused-variable]
warning: (PMAC_BACKLIGHT && DRM_NOUVEAU) selects FB_BACKLIGHT which has unmet direct dependencies (HAS_IOMEM && FB)
kernel/sched/debug.c:225:2: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 4 has type 'long int' [-Wformat]
kernel/sched/debug.c:225:2: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type 'long int' [-Wformat]
arch/x86/kernel/kvm.c:508:2: warning: initialization from incompatible pointer type [enabled by default]
arch/x86/kernel/kvm.c:508:2: warning: (near initialization for 'x86_hyper_kvm.x2apic_available') [enabled by default]
drivers/platform/x86/fujitsu-tablet.c:458:3: warning: initialization from incompatible pointer type [enabled by default]
drivers/platform/x86/fujitsu-tablet.c:458:3: warning: (near initialization for 'acpi_fujitsu_driver.ops.remove') [enabled by default]
drivers/platform/x86/ideapad-laptop.c:914:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/platform/x86/ideapad-laptop.c:914:2: warning: (near initialization for 'ideapad_acpi_driver.ops.remove') [enabled by default]
drivers/usb/misc/usb3503.c:215:13: warning: 'mode' may be used uninitialized in this function [-Wuninitialized]
warning: (USB_MUSB_HDRC && OMAP_USB3) selects OMAP_CONTROL_USB which has unmet direct dependencies (USB_SUPPORT && ARCH_OMAP2PLUS)
warning: (USB_MUSB_HDRC && OMAP_USB3) selects OMAP_CONTROL_USB which has unmet direct dependencies (USB_SUPPORT && ARCH_OMAP2PLUS)
warning: (USB_MUSB_HDRC && OMAP_USB3) selects OMAP_CONTROL_USB which has unmet direct dependencies (USB_SUPPORT && ARCH_OMAP2PLUS)
arch/x86/kernel/cpu/perf_event.c:1508:7: warning: assignment from incompatible pointer type [enabled by default]
arch/x86/kernel/cpu/perf_event.c:1510:31: warning: assignment from incompatible pointer type [enabled by default]
fs/ext4/super.c:4039:1: warning: label 'failed_mount8' defined but not used [-Wunused-label]

[sparse]
drivers/input/serio/arc_ps2.c:211:27: sparse: incorrect type in argument 1 (different address spaces)
drivers/misc/atmel-ssc.c:163:23: sparse: incorrect type in argument 1 (different address spaces)
drivers/tty/serial/sccnxp.c:880:20: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/host/ehci-platform.c:109:23: sparse: incorrect type in argument 1 (different address spaces)
sound/soc/codecs/jz4740.c:365:20: sparse: incorrect type in argument 1 (different address spaces)
drivers/tty/goldfish.c:83:49: sparse: incorrect type in argument 1 (different base types)
drivers/tty/goldfish.c:157:45: sparse: Using plain integer as NULL pointer
mm/memory.c:73:2: sparse: Unfortunate NUMA and NUMA Balancing config, growing page-frame for last_nid.
arch/x86/kernel/kvm.c:508:35: sparse: incorrect type in initializer (different signedness)
arch/x86/kernel/apic/io_apic.c:3247:5: sparse: symbol 'setup_msi_irqs' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
