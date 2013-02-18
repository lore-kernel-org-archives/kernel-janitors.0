From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 18 Feb 2013 16:07:25 +0000
Subject: build regressions 2013-02-18
Message-Id: <512251bd.oj1deSuiZVbSwLtK%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/gpio/gpio-lynxpoint.c:92:2: error: implicit declaration of function 'inl' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-lynxpoint.c:101:2: error: implicit declaration of function 'outl' [-Werror=implicit-function-declaration]
drivers/net/ethernet/intel/igb/igb_main.c:6231:2: error: call to '__compiletime_assert_6235' declared with attribute error: BUILD_BUG_ON failed: SKB_WITH_OVERHEAD(IGB_RX_BUFSZ) < (NET_SKB_PAD + NET_IP_ALIGN + IGB_TS_HDR_LEN + ETH_FRAME_LEN + ETH_FCS_LEN)
i8042.c:(.text+0x6c386): undefined reference to `free_irq'
i8042.c:(.text+0x6c3b2): undefined reference to `free_irq'
i8042.c:(.text+0x6c3e8): undefined reference to `synchronize_irq'
i8042.c:(.text+0x6c3f2): undefined reference to `synchronize_irq'
i8042.c:(.init.text+0x3724): undefined reference to `request_irq'
i8042.c:(.init.text+0x3878): undefined reference to `free_irq'
i8042.c:(.init.text+0x396c): undefined reference to `request_irq'
i8042.c:(.init.text+0x3998): undefined reference to `free_irq'
i8042.c:(.init.text+0x3ad6): undefined reference to `request_irq'
i8042.c:(.init.text+0x3b06): undefined reference to `free_irq'
xfs_trace.c:(.text+0x1a9846): undefined reference to `from_kqid'
xfs_trace.c:(.text+0x1a997a): undefined reference to `from_kqid'

[warnings]
warning: (DRM_RADEON && DRM_I915 && DRM_TILCDC && STUB_POULSBO && FB_BACKLIGHT && USB_APPLEDISPLAY && FB_OLPC_DCON && ASUS_LAPTOP && SONY_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_CMPC && SAMSUNG_Q10) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)
warning: (DRM_RADEON && DRM_I915 && DRM_TILCDC && STUB_POULSBO && FB_BACKLIGHT && USB_APPLEDISPLAY && FB_OLPC_DCON && ASUS_LAPTOP && SONY_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_CMPC && SAMSUNG_Q10) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)
warning: (DRM_RADEON && DRM_I915 && DRM_TILCDC && STUB_POULSBO && FB_BACKLIGHT && USB_APPLEDISPLAY && FB_OLPC_DCON && ASUS_LAPTOP && SONY_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_CMPC && SAMSUNG_Q10) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)

[sparse]
drivers/gpio/gpio-valleyview2.c:260:45: sparse: dubious: x | !y
drivers/gpio/gpio-valleyview2.c:261:35: sparse: dubious: x | !y
drivers/block/rbd.c:1046:24: sparse: symbol 'rbd_osd_req_op_create' was not declared. Should it be static?
drivers/vfio/pci/vfio_pci_config.c:599:54: sparse: incorrect type in initializer (different base types)
kernel/stop_machine.c:332:36: sparse: incorrect type in initializer (different address spaces)
drivers/clk/x86/clk-lpss.c:122:12: sparse: symbol 'clk_register_lpss_mux' was not declared. Should it be static?
drivers/staging/sb105x/sb_pci_mp.c:901:33: sparse: no member 'low_latency' in struct tty_struct
kernel/hung_task.c:22:29: sparse: symbol 'sysctl_hung_task_check_count' was not declared. Should it be static?
kernel/hung_task.c:36:29: sparse: symbol 'sysctl_hung_task_timeout_secs' was not declared. Should it be static?
kernel/hung_task.c:38:29: sparse: symbol 'sysctl_hung_task_warnings' was not declared. Should it be static?
kernel/hung_task.c:48:28: sparse: symbol 'sysctl_hung_task_panic' was not declared. Should it be static?
kernel/hung_task.c:184:5: sparse: symbol 'proc_dohung_task_timeout_secs' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
