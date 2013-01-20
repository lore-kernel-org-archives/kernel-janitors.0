From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 20 Jan 2013 00:50:00 +0000
Subject: build regressions 2013-01-19
Message-Id: <50fb3f38.ywSNJmULUKNk/mWW%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/usb/core/port.c:25:2: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
drivers/usb/core/port.c:38:2: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
drivers/usb/core/port.c:38:40: error: 'GFP_KERNEL' undeclared (first use in this function)
arch/arm/mach-omap2/board-omap3beagle.c:188:15: error: variable 'beagle_vzippy' has initializer but incomplete type
arch/arm/mach-omap2/board-omap3beagle.c:189:2: error: unknown field 'supply_name' specified in initializer
arch/arm/mach-omap2/board-omap3beagle.c:190:2: error: unknown field 'microvolts' specified in initializer
arch/arm/mach-omap2/board-omap3beagle.c:191:2: error: unknown field 'startup_delay' specified in initializer
arch/arm/mach-omap2/board-omap3beagle.c:192:2: error: unknown field 'enable_high' specified in initializer
arch/arm/mach-omap2/board-omap3beagle.c:193:2: error: unknown field 'enabled_at_boot' specified in initializer
arch/arm/mach-omap2/board-omap3beagle.c:194:2: error: unknown field 'init_data' specified in initializer
arch/arm/mach-omap2/board-omap3beagle.c:194:16: error: 'beagle_vmmc2' undeclared here (not in a function)
fs/nfs/nfs4client.c:351:8: error: label at end of compound statement
snapshot.c:(.text+0x3518c): undefined reference to `__virt_addr_valid'
drivers/gpu/drm/drm_gem_cma_helper.c:38:2: error: implicit declaration of function 'dma_free_writecombine' [-Werror=implicit-function-declaration]
drivers/gpu/drm/drm_gem_cma_helper.c:61:2: error: implicit declaration of function 'dma_alloc_writecombine' [-Werror=implicit-function-declaration]
drivers/gpu/drm/tilcdc/tilcdc_panel.o:(.data+0x0): multiple definition of `__mod_of_device_table'
drivers/gpu/drm/tilcdc/tilcdc_tfp410.o:(.data+0x0): first defined here
block/elevator.c:112:17: error: called object 'request_module' is not a function
drivers/spi/spi.c:824:6: error: redefinition of 'of_register_node_spi_devices'
drivers/spi/spi.c:915:6: error: redefinition of 'of_register_spi_devices'
drivers/media/usb/dvb-usb-v2/af9015.h:98:2: error: redeclaration of enumerator 'BOOT'
block/elevator.c:112:17: error: called object 'request_module' is not a function

[warnings]
arch/arm/mach-omap2/board-omap3beagle.c:189:2: warning: excess elements in struct initializer [enabled by default]
arch/arm/mach-omap2/board-omap3beagle.c:189:2: warning: (near initialization for 'beagle_vzippy') [enabled by default]
drivers/usb/core/port.c:38:11: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/staging/zcache/zbud.c:323:2: warning: passing argument 4 of 'debugfs_create_size_t' from incompatible pointer type [enabled by default]
drivers/staging/zcache/zcache-main.c:195:2: warning: passing argument 4 of 'debugfs_create_size_t' from incompatible pointer type [enabled by default]
drivers/video/st7735fb.c:562:1: warning: label 'ssbuf_fail' defined but not used [-Wunused-label]
drivers/gpu/drm/drm_gem_cma_helper.c:61:17: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/gpu/drm/drm_gem_cma_helper.c:267:4: warning: format '%d' expects argument of type 'int', but argument 8 has type 'size_t' [-Wformat]
warning: (I2C_TAOS_EVM) selects SERIO which has unmet direct dependencies (!S390 && !UML && TTY)
net/ieee802154/6lowpan.c:1044:5: warning: "DEBUG" is not defined [-Wundef]
net/ieee802154/6lowpan.c:788:4: warning: 'tag' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/core/netpoll.c:441:9: warning: 'eth' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/core/netpoll.c:392:12: warning: 'ip_len' may be used uninitialized in this function [-Wmaybe-uninitialized]
warning: (RTL8192CE && RTL8192SE && RTL8192DE && RTL8723AE && RTL8192CU) selects RTLWIFI which has unmet direct dependencies (NETDEVICES && WLAN && (RTL8192CE || RTL8192CU || RTL8192SE || RTL8192DE))

[sparse]
drivers/net/usb/asix_devices.c:505:6: sparse: symbol 'ax88772_unbind' was not declared. Should it be static?
drivers/staging/zcache/zcache-main.c:993:67: sparse: Using plain integer as NULL pointer
drivers/staging/zcache/zbud.c:323:50: sparse: incorrect type in argument 4 (different type sizes)
drivers/staging/zcache/zcache-main.c:195:43: sparse: incorrect type in argument 4 (different type sizes)
drivers/staging/zcache/zcache-main.c:251:6: sparse: symbol 'zcache_dump' was not declared. Should it be static?
drivers/staging/zcache/zcache-main.c:690:6: sparse: symbol 'zcache_pampd_create_finish' was not declared. Should it be static?
drivers/video/st7735fb.c:252:24: sparse: cast removes address space of expression
drivers/video/st7735fb.c:594:27: sparse: incorrect type in argument 1 (different address spaces)
net/ieee802154/6lowpan.c:1044:5: sparse: undefined preprocessor identifier 'DEBUG'
net/ieee802154/6lowpan.c:959:23: sparse: context imbalance in 'lowpan_process_data' - different lock contexts for basic block
net/mac802154/mib.c:109:20: sparse: incorrect type in return expression (different base types)
drivers/net/ieee802154/serial.c:901:69: sparse: restricted __le16 degrades to integer
drivers/char/hw_random/exynos-rng.c:165:1: sparse: symbol 'exynos_rng_pm_ops' was not declared. Should it be static?
drivers/clk/clk-divider.c:202:12: sparse: context imbalance in 'clk_divider_set_rate' - different lock contexts for basic block
drivers/clk/clk-gate.c:65:9: sparse: context imbalance in 'clk_gate_endisable' - different lock contexts for basic block
drivers/clk/clk-mux.c:59:12: sparse: context imbalance in 'clk_mux_set_parent' - different lock contexts for basic block
drivers/clk/clk.c:847:24: sparse: Using plain integer as NULL pointer
drivers/staging/zcache/zcache-main.c:128:8: sparse: symbol 'zcache_preloads' was not declared. Should it be static?
drivers/staging/zcache/zcache-main.c:362:5: sparse: symbol 'zcache_new_client' was not declared. Should it be static?
drivers/staging/zcache/zcache-main.c:639:6: sparse: symbol 'zcache_pampd_create' was not declared. Should it be static?
drivers/staging/zcache/zcache-main.c:855:8: sparse: symbol 'zcache_dstmem' was not declared. Should it be static?
drivers/staging/zcache/zcache-main.c:1294:5: sparse: symbol 'zcache_new_pool' was not declared. Should it be static?
drivers/staging/zcache/zcache-main.c:1346:5: sparse: symbol 'zcache_autocreate_pool' was not declared. Should it be static?
drivers/staging/zcache/zcache-main.c:1498:23: sparse: symbol 'zcache_cleancache_register_ops' was not declared. Should it be static?
drivers/staging/zcache/zcache-main.c:1629:22: sparse: symbol 'zcache_frontswap_register_ops' was not declared. Should it be static?
fs/nfs/nfs4client.c:352:17: sparse: Expected ; at end of statement
fs/nfs/nfs4client.c:352:17: sparse: got }
drivers/clk/x86/clk-lpss.c:71:12: sparse: symbol 'clk_register_lpss_gate' was not declared. Should it be static?

[smatch]
drivers/staging/zcache/zbud.c:963 zbud_evict_pageframe_lru() warn: returning with unbalanced local_bh_disable
drivers/net/ieee802154/serial.c:839 ieee802154_serial_set_laddr() warn: inconsistent returns mutex:&zbdev->mutex: locked (802,819) unlocked (795,839)
drivers/gpu/drm/i2c/tda998x_drv.c:731 tda998x_encoder_get_modes() error: not allocating enough data 136 vs 128

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
