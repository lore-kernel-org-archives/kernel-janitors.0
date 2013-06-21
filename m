From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 21 Jun 2013 17:21:47 +0000
Subject: build regressions 2013-06-21
Message-Id: <51c48bab.2+xYSpmIU2ufkwA6%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/net/ethernet/ti/cpsw.c:1979:26: error: 'priv' undeclared (first use in this function)
drivers/leds/leds-mc13783.c:280:4: error: implicit declaration of function 'of_get_next_child' [-Werror=implicit-function-declaration]
core.c:(.text+0x3282f5): undefined reference to `of_usb_get_phy_mode'
ngene-cards.c:(.text+0x3df25f): undefined reference to `mt2131_attach'
saa7134-dvb.c:(.text+0x4006f0): undefined reference to `tda827x_attach'
saa7134-dvb.c:(.text+0x40109f): undefined reference to `tda827x_attach'
saa7134-dvb.c:(.text+0x40112c): undefined reference to `nxt200x_attach'
saa7134-dvb.c:(.text+0x401164): undefined reference to `nxt200x_attach'
saa7134-dvb.c:(.text+0x401442): undefined reference to `zl10353_attach'
saa7134-dvb.c:(.text+0x40147c): undefined reference to `zl10353_attach'
saa7134-dvb.c:(.text+0x4014d9): undefined reference to `zl10353_attach'
saa7134-dvb.c:(.text+0x44ca88): undefined reference to `tda10048_attach'
saa7134-dvb.c:(.text+0x44cae5): undefined reference to `lgdt3305_attach'
saa7134-dvb.c:(.text+0x44cccc): undefined reference to `s5h1411_attach'
saa7134-dvb.c:(.text+0x44d059): undefined reference to `tda10048_attach'
saa7134-dvb.c:(.text+0x44d0ac): undefined reference to `tda10048_attach'
(.text+0x45099b): undefined reference to `tda10048_attach'
(.text+0x4509bb): undefined reference to `tda10048_attach'
(.text+0x4509eb): undefined reference to `s5h1411_attach'
drivers/infiniband/hw/qib/qib.h:436:29: error: field 'notify' has incomplete type
drivers/infiniband/hw/qib/qib.h:436:29: error: field 'notify' has incomplete type
drivers/infiniband/hw/qib/qib_iba7322.c:3313:2: error: implicit declaration of function 'irq_set_affinity_notifier' [-Werror=implicit-function-declaration]
mcam-core.c:(.text+0x25341a): undefined reference to `vb2_dma_sg_memops'
(.text+0x35f9c): undefined reference to `regmap_init_i2c'
ngene-cards.c:(.text+0x44ce75): undefined reference to `drxd_attach'
ngene-cards.c:(.text+0x44cf84): undefined reference to `lnbh24_attach'
ddbridge-core.c:(.text.unlikely+0x12a2e): undefined reference to `lnbh24_attach'
(.text+0x561510): undefined reference to `dca3_get_tag'
(.text+0x5616cd): undefined reference to `dca3_get_tag'
qib_iba7322.c:(.text+0x564da7): undefined reference to `dca_remove_requester'
qib_iba7322.c:(.text+0x5650f8): undefined reference to `dca_add_requester'
qib_iba7322.c:(.text+0x56516f): undefined reference to `dca_remove_requester'
(.text+0x56a194): undefined reference to `dca_add_requester'
qib_init.c:(.init.text+0x1ba58): undefined reference to `dca_register_notify'
qib_init.c:(.init.text+0x1baa6): undefined reference to `dca_unregister_notify'
qib_init.c:(.exit.text+0x3c13): undefined reference to `dca_unregister_notify'
toshiba_acpi.c:(.text+0x114e89): undefined reference to `i8042_remove_filter'
toshiba_acpi.c:(.devinit.text+0x18496): undefined reference to `i8042_install_filter'
toshiba_acpi.c:(.devinit.text+0x1854a): undefined reference to `i8042_remove_filter'

[warnings]
kernel/sched/debug.c:293:2: warning: array subscript is above array bounds [-Warray-bounds]
kernel/sched/debug.c:293:2: warning: array subscript is above array bounds [-Warray-bounds]
kernel/sched/debug.c:294:2: warning: array subscript is above array bounds [-Warray-bounds]
kernel/sched/debug.c:294:2: warning: array subscript is above array bounds [-Warray-bounds]
kernel/sched/debug.c:295:2: warning: array subscript is above array bounds [-Warray-bounds]
kernel/sched/debug.c:295:2: warning: array subscript is above array bounds [-Warray-bounds]
kernel/sched/debug.c:296:2: warning: array subscript is above array bounds [-Warray-bounds]
kernel/sched/debug.c:296:2: warning: array subscript is above array bounds [-Warray-bounds]
drivers/leds/leds-mc13783.c:280:10: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/iommu/iommu.c:822:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' [-Wformat=]
drivers/infiniband/core/cma.c:489:23: warning: 'port' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/linux/compiler.h:128:26: warning: 'sense_key' may be used uninitialized in this function [-Wmaybe-uninitialized]
warning: (VIDEO_GO7007) selects VIDEO_OV7640 which has unmet direct dependencies (MEDIA_SUPPORT && I2C && VIDEO_V4L2 && MEDIA_CAMERA_SUPPORT)
warning: (VIDEO_GO7007) selects VIDEO_OV7640 which has unmet direct dependencies (MEDIA_SUPPORT && I2C && VIDEO_V4L2 && MEDIA_CAMERA_SUPPORT)
warning: (VIDEO_GO7007) selects VIDEO_OV7640 which has unmet direct dependencies (MEDIA_SUPPORT && I2C && VIDEO_V4L2 && MEDIA_CAMERA_SUPPORT)
warning: (VIDEO_GO7007) selects VIDEO_OV7640 which has unmet direct dependencies (MEDIA_SUPPORT && I2C && VIDEO_V4L2 && MEDIA_CAMERA_SUPPORT)
warning: (VIDEO_GO7007) selects VIDEO_OV7640 which has unmet direct dependencies (MEDIA_SUPPORT && I2C && VIDEO_V4L2 && MEDIA_CAMERA_SUPPORT)
drivers/media/pci/saa7164/saa7164-core.c:1192:6: warning: 'err' may be used uninitialized in this function [-Wmaybe-uninitialized]
WARNING: vmlinux.o(.text+0xa11a4): Section mismatch in reference from the function .pnv_pci_ioda_fixup() to the function .init.text:.eeh_init()
WARNING: vmlinux.o(.text+0xa1190): Section mismatch in reference from the function .pnv_pci_ioda_fixup() to the function .init.text:.eeh_addr_cache_build()
warning: (ARM_GIC && ARM_VIC && ORION_IRQCHIP && RENESAS_INTC_IRQPIN && RENESAS_IRQC && VERSATILE_FPGA_IRQ && REGMAP && PINCTRL_BAYTRAIL && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_VIC && ORION_IRQCHIP && RENESAS_INTC_IRQPIN && RENESAS_IRQC && VERSATILE_FPGA_IRQ && REGMAP && PINCTRL_BAYTRAIL && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_VIC && ORION_IRQCHIP && RENESAS_INTC_IRQPIN && RENESAS_IRQC && VERSATILE_FPGA_IRQ && REGMAP && PINCTRL_BAYTRAIL && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_VIC && ORION_IRQCHIP && RENESAS_INTC_IRQPIN && RENESAS_IRQC && VERSATILE_FPGA_IRQ && REGMAP && PINCTRL_BAYTRAIL && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_VIC && ORION_IRQCHIP && RENESAS_INTC_IRQPIN && RENESAS_IRQC && VERSATILE_FPGA_IRQ && REGMAP && PINCTRL_BAYTRAIL && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_VIC && ORION_IRQCHIP && RENESAS_INTC_IRQPIN && RENESAS_IRQC && VERSATILE_FPGA_IRQ && REGMAP && PINCTRL_BAYTRAIL && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
drivers/char/ipmi/ipmi_acpi.c:145:11: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/char/ipmi/ipmi_acpi.c:396:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
include/linux/kernel.h:784:48: warning: initialization from incompatible pointer type [enabled by default]
include/linux/kernel.h:784:48: warning: (near initialization for 'n') [enabled by default]
include/linux/kernel.h:784:48: warning: initialization from incompatible pointer type [enabled by default]
include/linux/kernel.h:784:48: warning: (near initialization for 'n') [enabled by default]

[sparse]
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/radeon_object.h:68:62: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/i915/intel_display.c:8940:25: sparse: symbol 'mbp82_panel_mode' was not declared. Should it be static?
drivers/gpu/drm/radeon/radeon_cs.c:639:35: sparse: incorrect type in argument 1 (different base types)
drivers/gpu/drm/radeon/radeon_cs.c:639:66: sparse: incorrect type in argument 2 (different base types)
drivers/base/dmabuf-sync.c:31:5: sparse: symbol 'dmabuf_sync_enabled' was not declared. Should it be static?
fs/jbd2/transaction.c:190:17: sparse: context imbalance in 'add_transaction_credits' - unexpected unlock
fs/jbd2/transaction.c:306:9: sparse: context imbalance in 'start_this_handle' - different lock contexts for basic block
fs/f2fs/recovery.c:233:33: sparse: incorrect type in assignment (different base types)
fs/f2fs/recovery.c:238:33: sparse: incorrect type in assignment (different base types)
drivers/media/pci/saa7134/saa7134-video.c:1578:45: sparse: incorrect type in initializer (different address spaces)
drivers/media/pci/saa7134/saa7134-video.c:1589:26: sparse: incorrect type in assignment (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:482:37: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:483:37: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:487:33: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:492:37: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:493:37: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:870:28: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:870:41: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:876:29: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:876:44: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:882:26: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:808:24: sparse: cast to restricted __le32
drivers/net/ethernet/renesas/sh_eth.c:810:24: sparse: cast to restricted __be32
drivers/net/ethernet/renesas/sh_eth.c:810:24: sparse: cast to restricted __be32
drivers/net/ethernet/renesas/sh_eth.c:810:24: sparse: cast to restricted __be32
drivers/net/ethernet/renesas/sh_eth.c:810:24: sparse: cast to restricted __be32
drivers/net/ethernet/renesas/sh_eth.c:810:24: sparse: cast to restricted __be32
drivers/net/ethernet/renesas/sh_eth.c:810:24: sparse: cast to restricted __be32
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:797:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.c:799:24: sparse: incorrect type in return expression (different base types)
drivers/net/ethernet/renesas/sh_eth.h:547:30: sparse: incorrect type in return expression (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2034:24: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2035:62: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2049:24: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2050:37: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2079:24: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2084:28: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2095:24: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2100:28: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.h:547:30: sparse: incorrect type in return expression (different address spaces)
drivers/net/ethernet/renesas/sh_eth.h:547:30: sparse: incorrect type in return expression (different address spaces)
drivers/net/ethernet/renesas/sh_eth.h:547:30: sparse: incorrect type in return expression (different address spaces)
drivers/net/ethernet/renesas/sh_eth.h:547:30: sparse: incorrect type in return expression (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2415:23: sparse: incorrect type in assignment (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2547:23: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2548:34: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2598:31: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/renesas/sh_eth.c:2599:42: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/wireless/cw1200/hwio.h:236:13: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/hwio.h:236:13: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/hwio.h:236:13: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/hwio.h:236:13: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/hwio.h:236:13: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/hwio.h:200:13: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/hwio.h:200:13: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/hwio.h:193:16: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/hwio.h:200:13: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/hwio.h:200:13: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/hwio.h:229:16: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/hwio.h:236:13: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/hwio.h:229:16: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/hwio.h:229:16: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/hwio.h:236:13: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/hwio.h:229:16: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/hwio.h:176:15: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/hwio.h:193:16: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/hwio.h:185:13: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/hwio.h:200:13: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/hwio.h:193:16: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/hwio.h:200:13: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/hwio.h:193:16: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/hwio.h:176:15: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/hwio.h:185:13: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/hwio.h:176:15: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/hwio.h:243:16: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/hwio.h:243:16: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/hwio.h:243:16: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/hwio.h:243:16: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/txrx.c:603:35: sparse: cast to restricted __be16
drivers/net/wireless/cw1200/txrx.c:603:35: sparse: cast to restricted __be16
drivers/net/wireless/cw1200/txrx.c:603:35: sparse: cast to restricted __be16
drivers/net/wireless/cw1200/txrx.c:603:35: sparse: cast to restricted __be16
drivers/net/wireless/cw1200/txrx.c:610:43: sparse: restricted __le16 degrades to integer
drivers/net/wireless/cw1200/txrx.c:617:64: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/txrx.c:768:15: sparse: incompatible types in comparison expression (different address spaces)
drivers/net/wireless/cw1200/main.c:245:5: sparse: symbol 'cw1200_ba_rx_tids' was not declared. Should it be static?
drivers/net/wireless/cw1200/main.c:246:5: sparse: symbol 'cw1200_ba_tx_tids' was not declared. Should it be static?
drivers/net/wireless/cw1200/hwio.c:80:13: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/hwio.c:73:16: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/hwio.c:80:13: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/hwio.c:73:16: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/hwio.c:80:13: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/hwio.c:73:16: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/hwio.c:80:13: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/hwio.c:88:16: sparse: cast to restricted __le16
drivers/net/wireless/cw1200/hwio.c:95:13: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/hwio.h:185:13: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/hwio.h:185:13: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/hwio.h:185:13: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/hwio.h:176:15: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/hwio.h:176:15: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/hwio.h:200:13: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/hwio.h:185:13: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:100:22: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/wsm.c:117:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:118:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:119:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:122:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:123:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:125:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:146:18: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/wsm.c:153:34: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/wsm.c:155:56: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/wsm.c:156:56: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/wsm.c:157:49: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/wsm.c:176:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:206:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:207:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:224:13: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/wsm.c:227:13: sparse: cast to restricted __le16
drivers/net/wireless/cw1200/wsm.c:230:16: sparse: cast to restricted __le16
drivers/net/wireless/cw1200/wsm.c:258:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:259:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:313:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:320:17: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:321:17: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:322:17: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:323:17: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:324:17: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:328:17: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:363:32: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/wsm.c:364:29: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/wsm.c:367:28: sparse: cast to restricted __le16
drivers/net/wireless/cw1200/wsm.c:368:34: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/wsm.c:369:37: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/wsm.c:386:17: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/wsm.c:418:23: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/wsm.c:422:32: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/wsm.c:423:32: sparse: cast to restricted __le32
drivers/net/wireless/cw1200/wsm.c:441:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:443:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:448:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:450:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:451:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:480:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:481:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:527:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:555:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:556:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:557:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:581:9: sparse: cast from restricted __le16
drivers/net/wireless/cw1200/wsm.c:581:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:582:9: sparse: cast from restricted __le16
drivers/net/wireless/cw1200/wsm.c:582:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:583:9: sparse: cast from restricted __le16
drivers/net/wireless/cw1200/wsm.c:583:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:584:9: sparse: cast from restricted __le16
drivers/net/wireless/cw1200/wsm.c:584:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:586:9: sparse: cast from restricted __le16
drivers/net/wireless/cw1200/wsm.c:586:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:587:9: sparse: cast from restricted __le16
drivers/net/wireless/cw1200/wsm.c:587:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:588:9: sparse: cast from restricted __le16
drivers/net/wireless/cw1200/wsm.c:588:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:589:9: sparse: cast from restricted __le16
drivers/net/wireless/cw1200/wsm.c:589:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:591:9: sparse: cast from restricted __le16
drivers/net/wireless/cw1200/wsm.c:592:9: sparse: cast from restricted __le16
drivers/net/wireless/cw1200/wsm.c:593:9: sparse: cast from restricted __le16
drivers/net/wireless/cw1200/wsm.c:594:9: sparse: cast from restricted __le16
drivers/net/wireless/cw1200/wsm.c:596:9: sparse: cast from restricted __le16
drivers/net/wireless/cw1200/wsm.c:596:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:597:9: sparse: cast from restricted __le16
drivers/net/wireless/cw1200/wsm.c:597:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:598:9: sparse: cast from restricted __le16
drivers/net/wireless/cw1200/wsm.c:598:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:599:9: sparse: cast from restricted __le16
drivers/net/wireless/cw1200/wsm.c:599:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:601:9: sparse: cast from restricted __le32
drivers/net/wireless/cw1200/wsm.c:601:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:602:9: sparse: cast from restricted __le32
drivers/net/wireless/cw1200/wsm.c:602:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:603:9: sparse: cast from restricted __le32
drivers/net/wireless/cw1200/wsm.c:603:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:604:9: sparse: cast from restricted __le32
drivers/net/wireless/cw1200/wsm.c:604:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:628:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:682:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:683:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:684:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:690:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:714:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:764:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:786:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:787:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.c:820:44: sparse: cast to restricted __le16
drivers/net/wireless/cw1200/wsm.c:821:44: sparse: cast to restricted __le16
drivers/net/wireless/cw1200/wsm.c:822:37: sparse: cast to restricted __le16
drivers/net/wireless/cw1200/wsm.c:823:37: sparse: cast to restricted __le16
drivers/net/wireless/cw1200/wsm.c:824:37: sparse: cast to restricted __le16
drivers/net/wireless/cw1200/wsm.c:825:37: sparse: cast to restricted __le16
drivers/net/wireless/cw1200/wsm.c:826:37: sparse: cast to restricted __le16
drivers/net/wireless/cw1200/wsm.c:827:37: sparse: too many warnings
drivers/net/wireless/cw1200/wsm.h:1480:23: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.h:1480:23: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.h:1480:23: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.h:1480:23: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:66:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:66:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:66:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:66:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:66:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:67:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:67:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:67:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:67:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:67:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:68:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:68:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:68:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:68:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:68:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:69:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:69:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:69:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:69:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:69:9: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:625:33: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:635:17: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:635:17: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:635:17: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:635:17: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:635:17: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/sta.c:649:65: sparse: restricted __le16 degrades to integer
drivers/net/wireless/cw1200/sta.c:1094:29: sparse: cast to restricted __le16
drivers/net/wireless/cw1200/sta.c:1098:29: sparse: cast to restricted __le16
drivers/net/wireless/cw1200/sta.c:1105:35: sparse: cast to restricted __le16
drivers/net/wireless/cw1200/sta.c:1790:75: sparse: incorrect type in argument 1 (different base types)
drivers/net/wireless/cw1200/sta.c:1792:73: sparse: incorrect type in argument 1 (different base types)
drivers/net/wireless/cw1200/sta.c:1950:29: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.h:1480:23: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/wsm.h:1480:23: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/cw1200_spi.c:82:17: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/cw1200/cw1200_spi.c:142:17: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath9k/xmit.c:2161:16: sparse: restricted __le16 degrades to integer
drivers/net/wireless/ath/ath9k/xmit.c:2162:36: sparse: invalid assignment: &drivers/nfc/nfcsim.c:484:12: sparse: symbol 'nfcsim_init' was not declared. Should it be static?
drivers/nfc/nfcsim.c:525:13: sparse: symbol 'nfcsim_exit' was not declared. Should it be static?
drivers/net/ethernet/via/via-velocity.c:97:26: sparse: incorrect type in initializer (different address spaces)
drivers/net/ethernet/via/via-velocity.c:100:49: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:102:36: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/via/via-velocity.c:2256:40: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:2264:48: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:2437:48: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:2450:48: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:2881:40: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:3153:48: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:3159:48: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:3211:40: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:3278:48: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:3293:48: sparse: incorrect type in argument 2 (different base types)
net/ipv6/icmp.c:99:47: sparse: incorrect type in argument 3 (different base types)
drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c:1394:59: sparse: restricted pci_power_t degrades to integer
drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c:1394:70: sparse: restricted pci_power_t degrades to integer
drivers/net/can/c_can/c_can_platform.c:205:32: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:4335:17: sparse: memset with byte count of 262144
kernel/time/clockevents.c:466:17: sparse: symbol 'clockevents_subsys' was not declared. Should it be static?
kernel/time/clockevents.c:471:8: sparse: symbol 'tick_percpu_dev' was not declared. Should it be static?
drivers/mfd/rtsx_pcr.c:1091:25: sparse: incorrect type in argument 1 (different base types)
drivers/mfd/rtsx_pcr.c:1091:39: sparse: incorrect type in argument 2 (different base types)
drivers/mfd/rtsx_pcr.c:1091:22: sparse: too many arguments for function kzalloc
drivers/mfd/rtsx_pcr.c:1097:25: sparse: too many arguments for function kzalloc
drivers/mfd/sm501.c:1581:27: sparse: incorrect type in argument 1 (different base types)
fs/btrfs/disk-io.c:1421:19: sparse: symbol 'btrfs_read_tree_root' was not declared. Should it be static?
fs/btrfs/disk-io.c:1522:19: sparse: symbol 'btrfs_lookup_fs_root' was not declared. Should it be static?
drivers/iommu/amd_iommu_init.c:157:6: sparse: symbol 'amd_iommu_pc_present' was not declared. Should it be static?
drivers/infiniband/core/cma.c:825:26: sparse: incorrect type in assignment (different base types)
drivers/infiniband/hw/qib/qib_iba7322.c:2746:6: sparse: symbol 'qib_irq_notifier_notify' was not declared. Should it be static?
drivers/infiniband/hw/qib/qib_iba7322.c:2762:6: sparse: symbol 'qib_irq_notifier_release' was not declared. Should it be static?
drivers/infiniband/hw/ocrdma/ocrdma.h:399:17: sparse: cast to restricted __le32
drivers/infiniband/hw/ocrdma/ocrdma.h:399:17: sparse: cast to restricted __le32
drivers/infiniband/hw/ocrdma/ocrdma.h:411:17: sparse: cast to restricted __le32
drivers/infiniband/hw/ocrdma/ocrdma.h:417:17: sparse: cast to restricted __le32
drivers/infiniband/hw/ocrdma/ocrdma.h:405:17: sparse: cast to restricted __le32
drivers/infiniband/hw/ocrdma/ocrdma.h:393:21: sparse: cast to restricted __le32
drivers/infiniband/hw/ocrdma/ocrdma.h:399:17: sparse: cast to restricted __le32
drivers/infiniband/hw/ocrdma/ocrdma.h:393:21: sparse: cast to restricted __le32
drivers/target/target_core_pr.c:2069:57: sparse: incorrect type in return expression (different base types)
drivers/target/target_core_pr.c:2179:21: sparse: incorrect type in assignment (different base types)
drivers/target/target_core_pr.c:2197:13: sparse: incorrect type in assignment (different base types)
drivers/tty/serial/8250/8250_core.c:2902:28: sparse: context imbalance in 'serial8250_console_write' - unexpected unlock
arch/x86/mm/pageattr.c:372:7: sparse: symbol '_lookup_address_cpa' was not declared. Should it be static?
arch/x86/mm/pageattr.c:1381:40: sparse: Using plain integer as NULL pointer
arch/x86/mm/pageattr.c:1400:40: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/i915/intel_display.c:4922:43: sparse: mixing different enum types
drivers/gpu/drm/i915/intel_display.c:5781:43: sparse: mixing different enum types
drivers/gpu/drm/i915/intel_display.c:5915:43: sparse: mixing different enum types
drivers/gpu/drm/i915/intel_display.c:7706:58: sparse: mixing different enum types
drivers/gpu/drm/i915/intel_display.c:4922:43: sparse: mixing different enum types
drivers/gpu/drm/i915/intel_display.c:5781:43: sparse: mixing different enum types
drivers/gpu/drm/i915/intel_display.c:5915:43: sparse: mixing different enum types
drivers/gpu/drm/i915/intel_display.c:7706:58: sparse: mixing different enum types
drivers/gpu/drm/mgag200/mgag200_cursor.c:134:57: sparse: incorrect type in argument 1 (different address spaces)
drivers/gpu/drm/mgag200/mgag200_cursor.c:200:65: sparse: incorrect type in argument 1 (different address spaces)
drivers/gpu/drm/mgag200/mgag200_cursor.c:218:55: sparse: incorrect type in argument 1 (different address spaces)
drivers/acpi/osl.c:1928:5: sparse: symbol '__acpi_install_region' was not declared. Should it be static?
kernel/time/timekeeping_debug.c:68:6: sparse: symbol 'tk_debug_account_sleep_time' was not declared. Should it be static?
drivers/leds/leds-mc13783.c:280:33: sparse: undefined identifier 'of_get_next_child'
drivers/gpu/drm/i915/intel_pm.c:5054:6: sparse: symbol 'i915_request_power_well' was not declared. Should it be static?
drivers/gpu/drm/i915/intel_pm.c:5068:6: sparse: symbol 'i915_release_power_well' was not declared. Should it be static?
drivers/rapidio/rio.c:1280:5: sparse: symbol 'rio_init_mports' was not declared. Should it be static?
drivers/clk/x86/clk-lpt.c:45:12: sparse: symbol 'lpt_clk_init' was not declared. Should it be static?
drivers/acpi/csrt.c:130:13: sparse: symbol 'acpi_csrt_init' was not declared. Should it be static?
drivers/media/pci/cx88/cx88-cards.c:1513:36: sparse: Initializer entry defined twice
drivers/char/ipmi/ipmi_acpi.c:618:5: sparse: symbol 'acpi_ipmi_init' was not declared. Should it be static?
drivers/char/ipmi/ipmi_acpi.c:638:6: sparse: symbol 'acpi_ipmi_exit' was not declared. Should it be static?
fs/proc/self.c:51:13: sparse: symbol 'proc_self_init' was not declared. Should it be static?
fs/btrfs/compression.c:742:26: sparse: symbol 'btrfs_compress_op' was not declared. Should it be static?
drivers/staging/media/solo6x10/v4l2.c:53:10: sparse: symbol 'video_nr' was not declared. Should it be static?
drivers/staging/gdm72xx/netlink_k.c:89:13: sparse: symbol 'netlink_init' was not declared. Should it be static?
drivers/staging/gdm72xx/netlink_k.c:109:6: sparse: symbol 'netlink_exit' was not declared. Should it be static?
drivers/staging/gdm72xx/netlink_k.c:114:5: sparse: symbol 'netlink_send' was not declared. Should it be static?
drivers/usb/phy/isp1301.c:55:19: sparse: symbol 'isp1301_get_client' was not declared. Should it be static?
include/acpi/acexcep.h:191:12: sparse: symbol 'acpi_gbl_exception_names_env' was not declared. Should it be static?
include/acpi/acexcep.h:223:12: sparse: symbol 'acpi_gbl_exception_names_pgm' was not declared. Should it be static?
include/acpi/acexcep.h:236:12: sparse: symbol 'acpi_gbl_exception_names_tbl' was not declared. Should it be static?
include/acpi/acexcep.h:245:12: sparse: symbol 'acpi_gbl_exception_names_aml' was not declared. Should it be static?
include/acpi/acexcep.h:282:12: sparse: symbol 'acpi_gbl_exception_names_ctrl' was not declared. Should it be static?
drivers/media/pci/cx25821/cx25821-core.c:332:25: sparse: symbol 'mpegq' was not declared. Should it be static?
drivers/media/pci/cx25821/cx25821-audio-upstream.h:62:6: sparse: symbol '_defaultAudioName' was not declared. Should it be static?
net/netfilter/nf_conntrack_core.c:59:5: sparse: symbol 'nf_nat_seq_adjust_hook' was not declared. Should it be static?
drivers/mtd/devices/doc2000.c:508:6: sparse: symbol 'DoC2k_init' was not declared. Should it be static?
drivers/mtd/devices/doc2001.c:317:6: sparse: symbol 'DoCMil_init' was not declared. Should it be static?
drivers/mtd/devices/doc2001.c:740:5: sparse: symbol 'doc_erase' was not declared. Should it be static?
drivers/mtd/devices/doc2001plus.c:440:6: sparse: symbol 'DoCMilPlus_init' was not declared. Should it be static?
drivers/mtd/devices/doc2001plus.c:992:5: sparse: symbol 'doc_erase' was not declared. Should it be static?
drivers/clk/x86/clk-lpss.c:71:12: sparse: symbol 'clk_register_lpss_gate' was not declared. Should it be static?
drivers/gpu/drm/drm_modes.c:918:6: sparse: symbol 'drm_mode_validate_clocks' was not declared. Should it be static?
net/netfilter/ipvs/ip_vs_core.c:72:5: sparse: symbol 'ip_vs_net_id' was not declared. Should it be static?
net/dcb/dcbevent.c:26:5: sparse: symbol 'register_dcbevent_notifier' was not declared. Should it be static?
net/dcb/dcbevent.c:32:5: sparse: symbol 'unregister_dcbevent_notifier' was not declared. Should it be static?
net/dcb/dcbevent.c:38:5: sparse: symbol 'call_dcbevent_notifiers' was not declared. Should it be static?
include/trace/events/kvm.h:73:1: sparse: expression using sizeof bool
./arch/x86/kvm/trace.h:62:1: sparse: expression using sizeof bool
arch/x86/kvm/x86.c:1061:8: sparse: symbol 'cpu_tsc_khz' was not declared. Should it be static?
arch/x86/kvm/x86.c:5137:8: sparse: symbol 'current_vcpu' was not declared. Should it be static?
arch/x86/kvm/x86.c:5339:5: sparse: symbol 'kvm_hv_hypercall' was not declared. Should it be static?
arch/x86/kvm/./mmutrace.h:145:1: sparse: expression using sizeof bool
kernel/compat.c:384:1: sparse: symbol 'compat_sys_sigprocmask' was not declared. Should it be static?
kernel/rcutree_plugin.h:1702:6: sparse: symbol 'rcu_idle_demigrate' was not declared. Should it be static?
mm/swap.c:42:8: sparse: symbol 'lru_add_pvec' was not declared. Should it be static?
mm/mm_init.c:153:5: sparse: symbol 'vm_committed_as_batch' was not declared. Should it be static?
mm/hugetlb.c:1764:6: sparse: symbol 'hugetlb_unregister_node' was not declared. Should it be static?
mm/hugetlb.c:1808:6: sparse: symbol 'hugetlb_register_node' was not declared. Should it be static?
fs/bio-integrity.c:37:23: sparse: symbol 'bip_slab' was not declared. Should it be static?
fs/compat.c:1164:1: sparse: symbol 'compat_sys_preadv64' was not declared. Should it be static?
fs/compat.c:1230:1: sparse: symbol 'compat_sys_pwritev64' was not declared. Should it be static?
fs/read_write.c:253:1: sparse: symbol 'compat_sys_lseek' was not declared. Should it be static?
fs/dcache.c:121:8: sparse: symbol 'nr_dentry_unused' was not declared. Should it be static?
drivers/scsi/aic7xxx_old/aic7xxx_proc.c:82:1: sparse: symbol 'aic7xxx_proc_info' was not declared. Should it be static?
drivers/net/ethernet/brocade/bna/bfa_ioc.c:1850:1: sparse: symbol 'bfa_ioc_boot' redeclared with different type (originally declared at drivers/net/ethernet/brocade/bna/bfa_ioc.c:79) - incompatible argument 2 (different signedness)
kernel/time/timekeeping.c:1387:6: sparse: symbol 'do_timer' was not declared. Should it be static?
drivers/leds/ledtrig-cpu.c:38:8: sparse: symbol 'cpu_trig' was not declared. Should it be static?
kernel/trace/trace_entries.h:58:1: sparse: symbol 'ftrace_define_fields_function' was not declared. Should it be static?
kernel/trace/trace_entries.h:75:1: sparse: symbol 'ftrace_define_fields_funcgraph_entry' was not declared. Should it be static?
kernel/trace/trace_entries.h:91:1: sparse: symbol 'ftrace_define_fields_funcgraph_exit' was not declared. Should it be static?
kernel/trace/trace_entries.h:127:1: sparse: symbol 'ftrace_define_fields_context_switch' was not declared. Should it be static?
kernel/trace/trace_entries.h:147:1: sparse: symbol 'ftrace_define_fields_wakeup' was not declared. Should it be static?
kernel/trace/trace_entries.h:175:1: sparse: symbol 'ftrace_define_fields_kernel_stack' was not declared. Should it be static?
kernel/trace/trace_entries.h:194:1: sparse: symbol 'ftrace_define_fields_user_stack' was not declared. Should it be static?
kernel/trace/trace_entries.h:216:1: sparse: symbol 'ftrace_define_fields_bprint' was not declared. Should it be static?
kernel/trace/trace_entries.h:232:1: sparse: symbol 'ftrace_define_fields_print' was not declared. Should it be static?
kernel/trace/trace_entries.h:247:1: sparse: symbol 'ftrace_define_fields_mmiotrace_rw' was not declared. Should it be static?
kernel/trace/trace_entries.h:268:1: sparse: symbol 'ftrace_define_fields_mmiotrace_map' was not declared. Should it be static?
kernel/trace/trace_entries.h:292:1: sparse: symbol 'ftrace_define_fields_branch' was not declared. Should it be static?
drivers/media/usb/dvb-usb-v2/af9035.h:60:5: sparse: symbol 'clock_lut' was not declared. Should it be static?
drivers/media/usb/dvb-usb-v2/af9035.h:75:5: sparse: symbol 'clock_lut_it9135' was not declared. Should it be static?
drivers/pci/hotplug/cpci_hotplug_core.c:709:1: sparse: symbol 'cpci_hotplug_init' was not declared. Should it be static?
drivers/pci/hotplug/cpci_hotplug_core.c:716:1: sparse: symbol 'cpci_hotplug_exit' was not declared. Should it be static?
drivers/pci/pcie/portdrv_acpi.c:34:5: sparse: symbol 'pcie_port_acpi_setup' was not declared. Should it be static?
drivers/net/phy/vitesse.c:64:5: sparse: symbol 'vsc824x_add_skew' was not declared. Should it be static?
drivers/acpi/sysfs.c:719:12: sparse: symbol 'acpi_sysfs_init' was not declared. Should it be static?
drivers/acpi/container.c:183:13: sparse: symbol 'acpi_container_init' was not declared. Should it be static?
drivers/acpi/button.c:220:5: sparse: symbol 'acpi_lid_notifier_register' was not declared. Should it be static?
drivers/acpi/button.c:226:5: sparse: symbol 'acpi_lid_notifier_unregister' was not declared. Should it be static?
drivers/acpi/button.c:232:5: sparse: symbol 'acpi_lid_open' was not declared. Should it be static?
drivers/base/devtmpfs.c:410:12: sparse: symbol 'devtmpfs_init' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
