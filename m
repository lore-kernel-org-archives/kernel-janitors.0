From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 26 Jan 2013 17:23:45 +0000
Subject: build regressions 2013-01-26
Message-Id: <51041121.TdQtSNaAhI5xYDz2%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
imx-pcm.c:(.text+0x464): multiple definition of `imx_pcm_free'
sound/soc/fsl/snd-soc-imx-pcm-fiq.o:imx-pcm-fiq.c:(.text+0x1a4): first defined here
imx-pcm.c:(.text+0x360): multiple definition of `snd_imx_pcm_mmap'
sound/soc/fsl/snd-soc-imx-pcm-fiq.o:imx-pcm-fiq.c:(.text+0xa0): first defined here
imx-pcm.c:(.text+0x3e0): multiple definition of `imx_pcm_new'
sound/soc/fsl/snd-soc-imx-pcm-fiq.o:imx-pcm-fiq.c:(.text+0x120): first defined here
fs/readdir.c:82:12: error: invalid storage class for function 'fillonedir'
arch/arm/mach-omap2/board-rx51-peripherals.c:45:50: fatal error: ../drivers/staging/iio/light/tsl2563.h: No such file or directory
fs/namespace.c:634:13: error: invalid storage class for function '__touch_mnt_namespace'
fs/namespace.c:646:13: error: invalid storage class for function 'dentry_reset_mounted'
fs/namespace.c:666:13: error: invalid storage class for function 'detach_mnt'

[warnings]
fs/namespace.c:1495: warning: unused variable 'sb'
fs/namespace.c:2886: warning: unused variable 'mntns_operations'
fs/namespace.c:1055: warning: unused variable 'mounts_op'
drivers/platform/goldfish/goldfish_pipe.c:351:6: warning: 'status' may be used uninitialized in this function [-Wmaybe-uninitialized]
warning: (DRM_RADEON && DRM_I915 && STUB_POULSBO && FB_BACKLIGHT && USB_APPLEDISPLAY && FB_OLPC_DCON && ASUS_LAPTOP && SONY_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_CMPC && SAMSUNG_Q10) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)
warning: (DRM_RADEON && DRM_I915 && STUB_POULSBO && FB_BACKLIGHT && USB_APPLEDISPLAY && FB_OLPC_DCON && ASUS_LAPTOP && SONY_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_CMPC && SAMSUNG_Q10) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)
warning: (DRM_RADEON && DRM_I915 && STUB_POULSBO && FB_BACKLIGHT && USB_APPLEDISPLAY && FB_OLPC_DCON && ASUS_LAPTOP && SONY_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_CMPC && SAMSUNG_Q10) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)
drivers/spi/spi-gpio.c:378:3: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/spi/spi-gpio.c:385:3: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/spi/spi-pxa2xx.c:384:7: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/spi/spi-pxa2xx.c:384:40: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/spi/spi-pxa2xx.c:1579:34: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/spi/spi-pxa2xx.c:1579:34: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/spi/spi-pxa2xx.c:1579:34: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/spi/spi-pxa2xx.c:1579:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
fs/namespace.c:1323:2: warning: #warning FIXME mnt_ns_loop should be called when propogating mounts.... [-Wcpp]
fs/namespace.c:1324:2: warning: #warning FIXME mnt_ns_loop should be called when unsharing mount namespaces... [-Wcpp]
arch/x86/mm/numa.c:222:3: warning: passing argument 1 of '__phys_addr_nodebug' makes integer from pointer without a cast [enabled by default]
arch/x86/kernel/kvm.c:302:3: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'phys_addr_t' [-Wformat]

[sparse]
arch/x86/kernel/apic/io_apic.c:2985:14: sparse: symbol '__create_irqs' was not declared. Should it be static?
arch/x86/kernel/apic/io_apic.c:3201:5: sparse: symbol 'setup_msix_irqs' was not declared. Should it be static?
drivers/ata/libahci.c:1743:6: sparse: symbol 'ahci_port_intr' was not declared. Should it be static?
drivers/ata/libahci.c:1776:6: sparse: symbol 'ahci_hw_port_interrupt' was not declared. Should it be static?
drivers/ata/ahci.c:1064:5: sparse: symbol 'ahci_init_interrupts' was not declared. Should it be static?
drivers/platform/x86/fujitsu-tablet.c:458:27: sparse: incorrect type in initializer (different argument counts)
drivers/platform/x86/ideapad-laptop.c:914:23: sparse: incorrect type in initializer (different argument counts)
drivers/i2c/busses/i2c-ocores.c:369:23: sparse: incorrect type in argument 1 (different address spaces)
drivers/i2c/busses/i2c-ocores.c:370:35: sparse: incorrect type in argument 1 (different address spaces)
drivers/platform/goldfish/goldfish_pipe.c:292:35: sparse: cast removes address space of expression
fs/ext4/indirect.c:1542:52: sparse: incorrect type in argument 2 (different base types)
fs/ext4/indirect.c:1544:33: sparse: incorrect type in argument 4 (different base types)
drivers/gpu/drm/nouveau/nouveau_drm.c:678:6: sparse: symbol 'nouveau_drm_ioctl' was not declared. Should it be static?
fs/namespace.c:1323:2: sparse: FIXME mnt_ns_loop should be called when propogating mounts....
fs/namespace.c:1324:2: sparse: FIXME mnt_ns_loop should be called when unsharing mount namespaces...
drivers/usb/dwc3/dwc3-omap.c:135:33: sparse: symbol '_omap' was not declared. Should it be static?
security/integrity/digsig_asymmetric.c:41:32: sparse: cast to restricted __be32
security/integrity/digsig_asymmetric.c:41:32: sparse: cast to restricted __be32
security/integrity/digsig_asymmetric.c:41:32: sparse: cast to restricted __be32
security/integrity/digsig_asymmetric.c:41:32: sparse: cast to restricted __be32
security/integrity/digsig_asymmetric.c:41:32: sparse: cast to restricted __be32
security/integrity/digsig_asymmetric.c:41:32: sparse: cast to restricted __be32
security/integrity/digsig_asymmetric.c:90:23: sparse: cast to restricted __be16
security/integrity/digsig_asymmetric.c:90:23: sparse: cast to restricted __be16
security/integrity/digsig_asymmetric.c:90:23: sparse: cast to restricted __be16
security/integrity/digsig_asymmetric.c:90:23: sparse: cast to restricted __be16

[smatch]
drivers/staging/comedi/drivers/addi_apci_3501.c:164 apci3501_auto_attach() error: we previously assumed 'this_board->pc_EepromChip' could be null (see line 117)
fs/libfs.c:189 dcache_readdir() error: we previously assumed 'next->d_inode' could be null (see line 173)
fs/union.c:250 union_copyup_dir_one() error: 'dentry' dereferencing possible ERR_PTR()
fs/configfs/dir.c:1655 configfs_dir_lseek() warn: inconsistent returns mutex:&file_inode(file)->i_mutex: locked (1655) unlocked (1629)
fs/super.c:507 sget() warn: inconsistent returns spin_lock:&sb_lock: locked (479,482) unlocked (489,498,507)
fs/namei.c:2464 path_lookupat() warn: variable dereferenced before check 'nd' (see line 2434)
fs/namei.c:3393 lookup_open() error: we previously assumed 'dentry' could be null (see line 3362)
drivers/media/pci/cx23885/cx23885-dvb.c:1362 dvb_register() error: potential NULL dereference 'i2c_bus'.
drivers/media/dvb-frontends/ds3000.c:1009 ds3000_read_snr() error: buffer overflow 'dvbs_snr_tab' 31 <= 31
drivers/base/regmap/regmap-debugfs.c:140 regmap_debugfs_get_dump_start() error: potential NULL dereference 'c'.
drivers/base/regmap/regmap-debugfs.c:140 regmap_debugfs_get_dump_start() error: we previously assumed 'c' could be null (see line 120)
drivers/staging/zram/zram_drv.c:361 zram_bvec_write() error: double free of 'uncmem'

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
