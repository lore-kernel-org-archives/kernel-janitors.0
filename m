From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 27 Jun 2013 17:30:19 +0000
Subject: build regressions 2013-06-27
Message-Id: <51cc76ab.5RxL8vs1T2rzi6Sj%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/gpu/drm/i915/intel_sprite.c:846:7: error: too few arguments to function 'intel_update_plane'
(.text+0xa1767): undefined reference to `generate_smb3signingkey'
security/apparmor/lsm.c:750:29: error: 'CONFIG_SECURITY_APPARMOR_UNCONFINED_INIT' undeclared here (not in a function)
ERROR: "generate_smb3signingkey" [fs/cifs/cifs.ko] undefined!

[warnings]
WARNING: kernel/built-in.o(.text+0x8473c): Section mismatch in reference from the function rcu_torture_onoff() to the function .cpuinit.text:cpu_up()
drivers/gpu/drm/i915/intel_sprite.c:846:7: warning: passing argument 4 of 'intel_update_plane' makes pointer from integer without a cast [enabled by default]
drivers/media/platform/vsp1/vsp1_drv.c:339:22: warning: unused variable 'vsp1' [-Wunused-variable]
drivers/media/platform/vsp1/vsp1_drv.c:346:22: warning: unused variable 'vsp1' [-Wunused-variable]
warning: (ARM_GIC && ARM_VIC && RENESAS_INTC_IRQPIN && RENESAS_IRQC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_VX855 && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_VIC && RENESAS_INTC_IRQPIN && RENESAS_IRQC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_VX855 && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_VIC && RENESAS_INTC_IRQPIN && RENESAS_IRQC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_VX855 && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
drivers/sh/clk/cpg.c:41:2: warning: passing argument 1 of 'ioread8' discards 'const' qualifier from pointer target type [enabled by default]
drivers/sh/clk/cpg.c:46:2: warning: passing argument 1 of 'ioread16' discards 'const' qualifier from pointer target type [enabled by default]
drivers/sh/clk/cpg.c:51:2: warning: passing argument 1 of 'ioread32' discards 'const' qualifier from pointer target type [enabled by default]
drivers/mfd/max8998.c:178:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
