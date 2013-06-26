From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 26 Jun 2013 21:09:01 +0000
Subject: build regressions 2013-06-26
Message-Id: <51cb586d.Ir3+Yo6R/b2R3kO0%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
io.c:(.text+0xe90): undefined reference to `unwind_backtrace'
ERROR: "__divdi3" [drivers/gpu/drm/radeon/radeon.ko] undefined!
arch/x86/kvm/vmx.c:7945:23: error: 'X86_EFLAGS_BIT1' undeclared (first use in this function)
ni_dpm.c:(.text+0x4c9819): undefined reference to `__divdi3'
ni_dpm.c:(.text+0x4c9846): undefined reference to `__divdi3'
ni_dpm.c:(.text+0x4c9864): undefined reference to `__divdi3'
ni_dpm.c:(.text+0x4c9889): undefined reference to `__divdi3'
ni_dpm.c:(.text+0x4ca367): undefined reference to `__divdi3'
ni_dpm.c:(.text+0x4ca3a1): undefined reference to `__divdi3'
ni_dpm.c:(.text+0x4ca7cb): undefined reference to `__divdi3'
ni_dpm.c:(.text+0x4cb2ad): undefined reference to `__divdi3'
ni_dpm.c:(.text+0x4cb2e7): undefined reference to `__divdi3'
drivers/gpu/drm/radeon/si_dpm.c:5488:4: error: implicit declaration of function 'radeon_acpi_pcie_performance_request' [-Werror=implicit-function-declaration]
drivers/net/ethernet/arc/emac_main.c:174:3: error: request for member 'addr' in something not a structure or union
drivers/net/ethernet/arc/emac_main.c:174:3: error: request for member 'len' in something not a structure or union
drivers/net/ethernet/arc/emac_main.c:243:3: error: request for member 'addr' in something not a structure or union
drivers/net/ethernet/arc/emac_main.c:243:3: error: request for member 'len' in something not a structure or union
drivers/net/ethernet/arc/emac_main.c:267:3: error: request for member 'mapping' in something not a structure or union
drivers/net/ethernet/arc/emac_main.c:268:3: error: request for member 'len' in something not a structure or union
drivers/net/ethernet/arc/emac_main.c:546:2: error: 'struct buffer_state' has no member named 'mapping'

[warnings]
drivers/gpu/drm/radeon/rv770_dpm.c:1217:1: warning: the frame size of 1352 bytes is larger than 1024 bytes [-Wframe-larger-than=]
drivers/gpu/drm/radeon/cypress_dpm.c:1654:1: warning: the frame size of 1312 bytes is larger than 1024 bytes [-Wframe-larger-than=]
drivers/gpu/drm/radeon/btc_dpm.c:1509:1: warning: the frame size of 1320 bytes is larger than 1024 bytes [-Wframe-larger-than=]
drivers/net/ethernet/arc/emac_main.c:270:16: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/net/ethernet/arc/emac_main.c:270:16: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/net/ethernet/arc/emac_main.c:270:16: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/net/ethernet/arc/emac_main.c:270:16: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/net/ethernet/arc/emac_main.c:270:16: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/net/ethernet/arc/emac_main.c:270:3: warning: passing argument 1 of '__fswab32' makes integer from pointer without a cast [enabled by default]
drivers/net/ethernet/arc/emac_main.c:406:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/net/ethernet/arc/emac_main.c:406:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/net/ethernet/arc/emac_main.c:406:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/net/ethernet/arc/emac_main.c:406:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/net/ethernet/arc/emac_main.c:406:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/net/ethernet/arc/emac_main.c:406:3: warning: passing argument 1 of '__fswab32' makes integer from pointer without a cast [enabled by default]
drivers/net/ethernet/arc/emac_main.c:550:32: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/net/ethernet/arc/emac_main.c:550:32: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/net/ethernet/arc/emac_main.c:550:32: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/net/ethernet/arc/emac_main.c:550:32: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/net/ethernet/arc/emac_main.c:550:32: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/net/ethernet/arc/emac_main.c:550:2: warning: passing argument 1 of '__fswab32' makes integer from pointer without a cast [enabled by default]
warning: (ARM_GIC && ARM_NVIC && ARM_VIC && RENESAS_INTC_IRQPIN && RENESAS_IRQC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_NVIC && ARM_VIC && RENESAS_INTC_IRQPIN && RENESAS_IRQC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_NVIC && ARM_VIC && RENESAS_INTC_IRQPIN && RENESAS_IRQC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_NVIC && ARM_VIC && ORION_IRQCHIP && RENESAS_INTC_IRQPIN && RENESAS_IRQC && TB10X_IRQC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_NVIC && ARM_VIC && ORION_IRQCHIP && RENESAS_INTC_IRQPIN && RENESAS_IRQC && TB10X_IRQC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_NVIC && ARM_VIC && ORION_IRQCHIP && RENESAS_INTC_IRQPIN && RENESAS_IRQC && TB10X_IRQC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_VIC && ORION_IRQCHIP && RENESAS_INTC_IRQPIN && RENESAS_IRQC && TB10X_IRQC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_VIC && ORION_IRQCHIP && RENESAS_INTC_IRQPIN && RENESAS_IRQC && TB10X_IRQC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_VIC && ORION_IRQCHIP && RENESAS_INTC_IRQPIN && RENESAS_IRQC && TB10X_IRQC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)

[coccinelle]
drivers/gpu/drm/radeon/trinity_dpm.c:898:5-21: duplicated argument to && or ||
security/apparmor/apparmorfs.c:397:9-16: ERROR: PTR_ERR applied after initialization to constant on line 346
security/apparmor/policy_unpack.c:599:8-34: duplicated argument to && or ||
security/apparmor/policy_unpack.c:600:8-34: duplicated argument to && or ||

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
