From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 19 Jun 2013 20:22:03 +0000
Subject: build regressions 2013-06-19
Message-Id: <51c212eb.h0ZcCE9FADC3c6b9%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
file-nommu.c:(.text+0x5f98): undefined reference to `flush_kernel_dcache_page'
file-nommu.c:(.text+0x6024): undefined reference to `flush_kernel_dcache_page'
strnlen_user.c:(.text+0x3314): undefined reference to `flush_kernel_dcache_page'
drivers/mtd/devices/m25p80.c:1187:4: error: implicit declaration of function 'of_get_next_parent' [-Werror=implicit-function-declaration]
drivers/mtd/devices/m25p80.c:1188:4: error: implicit declaration of function 'of_property_read_string' [-Werror=implicit-function-declaration]
drivers/tty/serial/8250/8250_dw.c:68:2: error: implicit declaration of function '__raw_readq' [-Werror=implicit-function-declaration]
drivers/tty/serial/8250/8250_dw.c:79:2: error: implicit declaration of function '__raw_writeq' [-Werror=implicit-function-declaration]
core.c:(.text+0x8ad335): undefined reference to `of_usb_get_phy_mode'
core.c:(.text+0xfe44e): undefined reference to `of_usb_get_phy_mode'
olpc-xo1-pm.c:(.devinit.text+0x115): undefined reference to `mfd_cell_enable'
olpc-xo1-pm.c:(.devexit.text+0x4): undefined reference to `mfd_cell_disable'
ERROR: ".adjust_managed_page_count" [drivers/virtio/virtio_balloon.ko] undefined!
zswap.c:(.text+0x3a705): undefined reference to `zbud_free'
zswap.c:(.text+0x3a76b): undefined reference to `zbud_free'
zswap.c:(.text+0x3a789): undefined reference to `zbud_get_pool_size'
zswap.c:(.text+0x3a93f): undefined reference to `zbud_create_pool'
zswap.c:(.text+0x3aa4c): undefined reference to `zbud_map'
zswap.c:(.text+0x3aae7): undefined reference to `zbud_unmap'
zswap.c:(.text+0x3ac95): undefined reference to `zbud_alloc'
zswap.c:(.text+0x3ad23): undefined reference to `zbud_reclaim_page'
zswap.c:(.text+0x3ad7d): undefined reference to `zbud_map'
zswap.c:(.text+0x3adae): undefined reference to `zbud_unmap'
zswap.c:(.text+0x3ae54): undefined reference to `zbud_get_pool_size'
zswap.c:(.text+0x3af1f): undefined reference to `zbud_map'
zswap.c:(.text+0x3af2d): undefined reference to `zbud_unmap'
zswap.c:(.text+0x3b090): undefined reference to `zbud_map'
zswap.c:(.text+0x3b12f): undefined reference to `zbud_unmap'
zswap.c:(.text.unlikely+0xf96): undefined reference to `crypto_alloc_base'
zswap.c:(.init.text+0x26c9): undefined reference to `crypto_has_alg'
zswap.c:(.init.text+0x2738): undefined reference to `crypto_has_alg'
ERROR: "key_type_encrypted" [drivers/md/dm-integrity.ko] undefined!

[warnings]
drivers/mtd/devices/m25p80.c:1187:7: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/mtd/devices/m25p80.c:500:3: warning: passing argument 4 of 'm25p80_read' from incompatible pointer type [enabled by default]
drivers/mtd/devices/m25p80.c:622:3: warning: passing argument 4 of 'm25p80_write' from incompatible pointer type [enabled by default]
fs/gfs2/trans.c:273:21: warning: unused variable 'gl' [-Wunused-variable]
drivers/usb/chipidea/core.c:226:3: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/usb/chipidea/core.c:230:3: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/usb/chipidea/core.c:243:3: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/usb/chipidea/core.c:246:3: warning: large integer implicitly truncated to unsigned type [-Woverflow]
warning: (ARM_GIC && ARM_VIC && RENESAS_INTC_IRQPIN && RENESAS_IRQC && VERSATILE_FPGA_IRQ && REGMAP && PINCTRL_BAYTRAIL && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_VIC && RENESAS_INTC_IRQPIN && RENESAS_IRQC && VERSATILE_FPGA_IRQ && REGMAP && PINCTRL_BAYTRAIL && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_VIC && RENESAS_INTC_IRQPIN && RENESAS_IRQC && VERSATILE_FPGA_IRQ && REGMAP && PINCTRL_BAYTRAIL && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
drivers/md/dm-integrity.c:280:2: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 4 has type 'sector_t' [-Wformat]
drivers/md/dm-integrity.c:299:5: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 2 has type 'sector_t' [-Wformat]
drivers/md/dm-integrity.c:721:5: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 6 has type 'sector_t' [-Wformat]
drivers/md/dm-integrity.c:721:5: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 9 has type 'sector_t' [-Wformat]
drivers/md/dm-integrity.c:741:3: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 2 has type 'sector_t' [-Wformat]
drivers/md/dm-integrity.c:741:3: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type 'sector_t' [-Wformat]
drivers/md/dm-integrity.c:748:3: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 2 has type 'sector_t' [-Wformat]
drivers/md/dm-integrity.c:748:3: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type 'sector_t' [-Wformat]
drivers/md/dm-integrity.c:768:3: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type 'sector_t' [-Wformat]
drivers/md/dm-integrity.c:795:3: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 2 has type 'sector_t' [-Wformat]
drivers/md/dm-integrity.c:795:3: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type 'sector_t' [-Wformat]
drivers/md/dm-integrity.c:372:1: warning: 'dm_int_calc_hmac' uses dynamic stack allocation [enabled by default]
drivers/md/dm-integrity.c:446:1: warning: 'dm_int_verify_io' uses dynamic stack allocation [enabled by default]
drivers/usb/chipidea/core.c:226:3: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/usb/chipidea/core.c:230:3: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/usb/chipidea/core.c:243:3: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/usb/chipidea/core.c:246:3: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/staging/lustre/lustre/obdclass/lu_object.c:1849:2: warning: suggest parentheses around operand of '!' or change '&' to '&&' or '!' to '~' [-Wparentheses]
drivers/staging/lustre/lustre/obdclass/lu_object.c:1873:2: warning: suggest parentheses around operand of '!' or change '&' to '&&' or '!' to '~' [-Wparentheses]
include/linux/memory.h:139:42: warning: statement with no effect [-Wunused-value]
include/linux/memory.h:139:42: warning: statement with no effect [-Wunused-value]

[coccinelle]
drivers/md/dm-integrity.c:835:5-11: inconsistent IS_ERR and PTR_ERR, PTR_ERR on line 837
drivers/md/dm-integrity.c:144:5-11: inconsistent IS_ERR and PTR_ERR, PTR_ERR on line 145
drivers/md/dm-integrity.c:152:5-11: inconsistent IS_ERR and PTR_ERR, PTR_ERR on line 153

[cppcheck]
lib/fonts/fonts.c:71: error: No fonts configured.

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
