From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 02 Sep 2013 23:12:54 +0000
Subject: build regressions 2013-09-02
Message-Id: <52251b76.mcY3kXpjaPqjKbql%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
ERROR: "vga_set_legacy_decoding" [drivers/gpu/drm/i915/i915.ko] undefined!
intel_display.c:(.text+0x1bd5f3): undefined reference to `vga_set_legacy_decoding'
(.text+0x1cb47c): undefined reference to `vga_set_legacy_decoding'

[warnings]
drivers/gpu/vga/vgaarb.c:648:34: warning: unused variable 'conflict' [-Wunused-variable]
drivers/gpu/vga/vgaarb.c:648:21: warning: unused variable 'new_vgadev' [-Wunused-variable]
drivers/char/hw_random/via-rng.c:224:26: warning: 'via_rng_cpu_id' defined but not used [-Wunused-variable]
warning: (ARM_GIC && ARM_GIC_V3 && ARM_NVIC && ARM_VIC && ORION_IRQCHIP && RENESAS_INTC_IRQPIN && RENESAS_IRQC && TB10X_IRQC && VERSATILE_FPGA_IRQ && REGMAP && PINCTRL_BAYTRAIL && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && MFD_MAX8998 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_GIC_V3 && ARM_NVIC && ARM_VIC && ORION_IRQCHIP && RENESAS_INTC_IRQPIN && RENESAS_IRQC && TB10X_IRQC && VERSATILE_FPGA_IRQ && REGMAP && PINCTRL_BAYTRAIL && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && MFD_MAX8998 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_GIC_V3 && ARM_NVIC && ARM_VIC && ORION_IRQCHIP && RENESAS_INTC_IRQPIN && RENESAS_IRQC && TB10X_IRQC && VERSATILE_FPGA_IRQ && REGMAP && PINCTRL_BAYTRAIL && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && MFD_MAX8998 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_GIC_V3 && ARM_NVIC && ARM_VIC && ORION_IRQCHIP && RENESAS_INTC_IRQPIN && RENESAS_IRQC && TB10X_IRQC && VERSATILE_FPGA_IRQ && REGMAP && PINCTRL_BAYTRAIL && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && MFD_MAX8998 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
drivers/media/usb/dvb-usb/dibusb-common.c:201:32: warning: 'stk3000p_dib3000p_config' defined but not used [-Wunused-variable]
drivers/media/usb/dvb-usb/dibusb-common.c:213:34: warning: 'dib3000p_panasonic_agc_config' defined but not used [-Wunused-variable]

[sparse]
arch/x86/kernel/e820.c:667:15: sparse: incorrect type in assignment (different address spaces) @@    expected struct setup_data *sdata @@    got voidstruct setup_data *sdata @@
arch/x86/kernel/e820.c:672:23: sparse: incorrect type in argument 1 (different address spaces) @@    expected void [noderef] <asn:2>*addr @@    got  [noderef] <asn:2>*addr @@
fs/xfs/xfs_log_recover.c:2017:24: sparse: cast to restricted __be64
fs/xfs/xfs_log_recover.c:2017:24: sparse: cast to restricted __be64
fs/xfs/xfs_log_recover.c:2017:24: sparse: cast to restricted __be64
fs/xfs/xfs_log_recover.c:2017:24: sparse: cast to restricted __be64
fs/xfs/xfs_log_recover.c:2017:24: sparse: cast to restricted __be64
fs/xfs/xfs_log_recover.c:2017:24: sparse: cast to restricted __be64
fs/xfs/xfs_log_recover.c:2017:24: sparse: cast to restricted __be64
fs/xfs/xfs_log_recover.c:2017:24: sparse: cast to restricted __be64
fs/xfs/xfs_log_recover.c:2017:24: sparse: cast to restricted __be64
fs/xfs/xfs_log_recover.c:2017:24: sparse: cast to restricted __be64
drivers/media/platform/vsp1/vsp1_hsit.c:62:5: sparse: symbol 'hsit_enum_mbus_code' was not declared. Should it be static?
drivers/media/platform/vsp1/vsp1_hsit.c:80:5: sparse: symbol 'hsit_enum_frame_size' was not declared. Should it be static?
drivers/media/platform/vsp1/vsp1_hsit.c:109:5: sparse: symbol 'hsit_get_format' was not declared. Should it be static?
drivers/media/platform/vsp1/vsp1_hsit.c:120:5: sparse: symbol 'hsit_set_format' was not declared. Should it be static?
drivers/media/platform/vsp1/vsp1_lut.c:84:5: sparse: symbol 'lut_enum_mbus_code' was not declared. Should it be static?
drivers/media/platform/vsp1/vsp1_lut.c:114:5: sparse: symbol 'lut_enum_frame_size' was not declared. Should it be static?
drivers/media/platform/vsp1/vsp1_lut.c:143:5: sparse: symbol 'lut_get_format' was not declared. Should it be static?
drivers/media/platform/vsp1/vsp1_lut.c:154:5: sparse: symbol 'lut_set_format' was not declared. Should it be static?
arch/x86/kernel/cpu/perf_event_intel.c:901:9: sparse: constant 0x768005ffff is so big it is long
arch/x86/kernel/cpu/perf_event_intel.c:902:9: sparse: constant 0x768005ffff is so big it is long
sound/soc/codecs/wm8904.c:1205:34: sparse: incorrect type in argument 1 (different base types) @@    expected struct snd_soc_card *card @@    got struct sstruct snd_soc_card *card @@

[coccinelle]
fs/btrfs/disk-io.c:3422:2-8: preceding lock on line 3374

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
