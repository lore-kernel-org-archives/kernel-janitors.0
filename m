From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 21 Aug 2013 16:39:13 +0000
Subject: build regressions 2013-08-21
Message-Id: <5214ed31.E6WxSxAMEJNJ5mCI%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/net/ethernet/ti/davinci_mdio.c:436:18: error: 'dev' undeclared (first use in this function)
crypto/asymmetric_keys/x509_public_key.c:250:35: error: 'system_trusted_keyring' undeclared (first use in this function)
drivers/net/ethernet/xilinx/xilinx_emaclite.c:1252:18: error: 'dev' undeclared (first use in this function)
arch/sh/kernel/cpu/sh2/setup-sh7619.c:118:2: error: unknown field 'phy_interace' specified in initializer
ima_appraise.c:(.init.text+0x6d01): undefined reference to `integrity_init_keyring'
security/keys/process_keys.c:664:8: error: 'system_trusted_keyring' undeclared (first use in this function)

[warnings]
warning: (ARM_GIC && ARM_NVIC && ARM_VIC && IMGPDC_IRQ && ORION_IRQCHIP && RENESAS_INTC_IRQPIN && RENESAS_IRQC && TB10X_IRQC && VERSATILE_FPGA_IRQ && REGMAP && PINCTRL_BAYTRAIL && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && MFD_MAX8998 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_NVIC && ARM_VIC && IMGPDC_IRQ && ORION_IRQCHIP && RENESAS_INTC_IRQPIN && RENESAS_IRQC && TB10X_IRQC && VERSATILE_FPGA_IRQ && REGMAP && PINCTRL_BAYTRAIL && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && MFD_MAX8998 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_NVIC && ARM_VIC && IMGPDC_IRQ && ORION_IRQCHIP && RENESAS_INTC_IRQPIN && RENESAS_IRQC && TB10X_IRQC && VERSATILE_FPGA_IRQ && REGMAP && PINCTRL_BAYTRAIL && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && MFD_MAX8998 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_NVIC && ARM_VIC && IMGPDC_IRQ && ORION_IRQCHIP && RENESAS_INTC_IRQPIN && RENESAS_IRQC && TB10X_IRQC && VERSATILE_FPGA_IRQ && REGMAP && PINCTRL_BAYTRAIL && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && MFD_MAX8998 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
drivers/cpuidle/governors/menu.c:206:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/staging/lustre/lustre/llite/rw26.c:549:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/staging/lustre/lustre/llite/rw26.c:549:2: warning: (near initialization for 'll_aops.direct_IO') [enabled by default]

[sparse]
fs/nfs/./nfstrace.h:275:1: sparse: incorrect type in initializer (different base types) @@    expected unsigned long [unsigned] mask @@    got restrunsigned long [unsigned] mask @@
fs/nfs/./nfstrace.h:275:1: sparse: incorrect type in initializer (different base types) @@    expected unsigned long [unsigned] mask @@    got restrunsigned long [unsigned] mask @@
fs/nfs/./nfstrace.h:275:1: sparse: incorrect type in initializer (different base types) @@    expected unsigned long [unsigned] mask @@    got restrunsigned long [unsigned] mask @@
fs/nfs/./nfstrace.h:275:1: sparse: cast from restricted fmode_t
fs/nfs/./nfstrace.h:311:1: sparse: incorrect type in initializer (different base types) @@    expected unsigned long [unsigned] mask @@    got restrunsigned long [unsigned] mask @@
fs/nfs/./nfstrace.h:311:1: sparse: incorrect type in initializer (different base types) @@    expected unsigned long [unsigned] mask @@    got restrunsigned long [unsigned] mask @@
fs/nfs/./nfstrace.h:311:1: sparse: incorrect type in initializer (different base types) @@    expected unsigned long [unsigned] mask @@    got restrunsigned long [unsigned] mask @@
fs/nfs/./nfstrace.h:311:1: sparse: cast from restricted fmode_t
fs/nfs/./nfstrace.h:275:1: sparse: cast to restricted fmode_t
fs/nfs/./nfstrace.h:275:1: sparse: cast to restricted fmode_t
fs/nfs/./nfstrace.h:275:1: sparse: restricted fmode_t degrades to integer
fs/nfs/./nfstrace.h:275:1: sparse: restricted fmode_t degrades to integer
fs/nfs/./nfstrace.h:311:1: sparse: cast to restricted fmode_t
fs/nfs/./nfstrace.h:311:1: sparse: cast to restricted fmode_t
fs/nfs/./nfstrace.h:311:1: sparse: restricted fmode_t degrades to integer
fs/nfs/./nfstrace.h:311:1: sparse: restricted fmode_t degrades to integer
fs/nfs/nfs3proc.c:339:49: sparse: cast to restricted __be32
fs/nfs/nfs3proc.c:340:49: sparse: cast to restricted __be32
fs/nfs/callback_proc.c:467:43: sparse: incorrect type in argument 3 (different base types) @@    expected restricted __be32 [usertype] status @@    got  [usertype] status @@
arch/x86/xen/setup.c:316:6: sparse: symbol 'xen_ignore_unusable' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
