From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 16 Apr 2013 16:34:59 +0000
Subject: build regressions 2013-04-16
Message-Id: <516d7db3.S3sM2T3dnBNMI9B5%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/irqchip/built-in.o:irq-gic.c:(.text+0x854): first defined here
drivers/irqchip/built-in.o:irq-gic.c:(.text+0x85c): first defined here
drivers/ata/built-in.o:(.text+0x133da): first defined here
drivers/ata/built-in.o:(.text+0x133e7): first defined here
drivers/s390/cio/cio.h:136:39: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'do'
drivers/s390/cio/cio.h:136:45: error: expected identifier or '(' before 'while'
drivers/s390/cio/cio.h:136:39: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'do'
drivers/s390/cio/cio.h:136:45: error: expected identifier or '(' before 'while'
drivers/s390/cio/css.h:51:21: error: field 'ps' has incomplete type
drivers/s390/cio/cio.h:136:39: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'do'
drivers/s390/cio/cio.h:136:45: error: expected identifier or '(' before 'while'
drivers/s390/cio/css.h:51:21: error: field 'ps' has incomplete type
drivers/s390/cio/css.c:1039:2: error: implicit declaration of function 'cio_register_early_subchannels' [-Werror=implicit-function-declaration]
drivers/s390/cio/cio.h:136:39: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'do'
drivers/s390/cio/cio.h:136:45: error: expected identifier or '(' before 'while'
(.text+0x41a09f): multiple definition of `of_pci_process_ranges'
kernel/built-in.o:(.text+0x5b5f8): first defined here
(.text+0x41a096): multiple definition of `of_pci_range_parser'
kernel/built-in.o:(.text+0x5b5ef): first defined here
ld: cannot find drivers/pci/host/built-in.o: No such file or directory
drivers/uio/uio_pdrv_genirq.o:uio_pdrv_genirq.c:(.text+0x4d0): first defined here
drivers/uio/uio_pdrv_genirq.o:uio_pdrv_genirq.c:(.text+0x4e0): first defined here
drivers/char/ipmi/built-in.o:(.text+0x8445): first defined here
drivers/char/ipmi/built-in.o:(.text+0x844e): first defined here
drivers/char/ipmi/built-in.o:(.text+0x8445): first defined here
drivers/char/ipmi/built-in.o:(.text+0x844e): first defined here
drivers/tty/built-in.o:(.text+0x1e980): first defined here
drivers/tty/built-in.o:(.text+0x1e990): first defined here
arch/x86/pci/common.c:176:2: error: implicit declaration of function 'acpi_pci_add_bus' [-Werror=implicit-function-declaration]
arch/x86/pci/common.c:181:2: error: implicit declaration of function 'acpi_pci_remove_bus' [-Werror=implicit-function-declaration]
arch/xtensa/platforms/iss/simdisk.c:236:22: error: 'count' undeclared (first use in this function)
arch/xtensa/platforms/iss/simdisk.c:242:6: error: 'buffer' undeclared (first use in this function)

[warnings]
drivers/net/wireless/ath/ath9k/ar9003_eeprom.c:3130:21: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/gpu/drm/i915/i915_gem_gtt.c:246:5: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/regulator/max8925-regulator.c:269:51: warning: 'regulator_idx' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/s390/cio/css.h:41:1: warning: empty declaration [enabled by default]
drivers/s390/cio/css.h:41:1: warning: empty declaration [enabled by default]
arch/s390/include/uapi/asm/debug.h:29:1: warning: empty declaration [enabled by default]
drivers/vhost/tcm_vhost.c:811:12: warning: 'vhost_scsi_set_endpoint' defined but not used
drivers/vhost/tcm_vhost.c:988:12: warning: 'vhost_scsi_set_features' defined but not used
drivers/vhost/tcm_vhost.c:1062:12: warning: 'vhost_scsi_set_features' defined but not used
include/linux/of_address.h:92:11: warning: 'struct device_noed' declared inside parameter list [enabled by default]
include/linux/of_address.h:92:11: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
arch/x86/include/asm/dma-mapping.h:173:12: warning: 'ddb_size' may be used uninitialized in this function [-Wmaybe-uninitialized]
usr/include/linux/fuse.h:99: found __[us]{8,16,32,64} type without #include <linux/types.h>
drivers/dma/ioat/dma_v3.c:252:11: warning: array subscript is below array bounds [-Warray-bounds]
drivers/dma/ioat/dma_v3.c:252:11: warning: array subscript is below array bounds [-Warray-bounds]
arch/xtensa/platforms/iss/simdisk.c:221:12: warning: initialization discards 'const' qualifier from pointer target type [enabled by default]
WARNING: drivers/staging/built-in.o(.text+0x154780): Section mismatch in reference from the function dma_fifo_out_complete() to the variable .init.data:use_frontswap_selfshrink
WARNING: drivers/staging/zcache/zcache.o(.text+0x1340): Section mismatch in reference from the (unknown reference) (unknown) to the variable .init.data:use_frontswap_selfshrink

[sparse]
drivers/pci/pci-driver.c:395:20: sparse: restricted pci_power_t degrades to integer
drivers/pci/pci-driver.c:395:39: sparse: restricted pci_power_t degrades to integer
drivers/block/mtip32xx/mtip32xx.c:84:18: sparse: symbol 'online_list' was not declared. Should it be static?
drivers/block/mtip32xx/mtip32xx.c:85:18: sparse: symbol 'removing_list' was not declared. Should it be static?
net/netfilter/ipvs/ip_vs_ctl.c:1527:35: sparse: dereference of noderef expression
net/netfilter/ipvs/ip_vs_ctl.c:1527:35: sparse: dereference of noderef expression
net/netfilter/ipvs/ip_vs_ctl.c:1527:35: sparse: dereference of noderef expression
include/linux/rcupdate.h:326:30: sparse: context imbalance in 'ip_vs_conn_seq_next' - unexpected unlock
include/linux/rcupdate.h:326:30: sparse: context imbalance in 'ip_vs_conn_seq_stop' - unexpected unlock
net/netfilter/ipvs/ip_vs_lblc.c:174:51: sparse: incorrect type in argument 2 (different modifiers)
net/netfilter/ipvs/ip_vs_lblc.c:248:17: sparse: dereference of noderef expression
net/netfilter/ipvs/ip_vs_lblc.c:278:17: sparse: dereference of noderef expression
net/netfilter/ipvs/ip_vs_lblc.c:334:17: sparse: dereference of noderef expression
net/netfilter/ipvs/ip_vs_lblc.c:373:17: sparse: dereference of noderef expression
net/netfilter/ipvs/ip_vs_lblcr.c:348:51: sparse: incorrect type in argument 2 (different modifiers)
net/netfilter/ipvs/ip_vs_lblcr.c:418:17: sparse: dereference of noderef expression
net/netfilter/ipvs/ip_vs_lblcr.c:447:17: sparse: dereference of noderef expression
net/netfilter/ipvs/ip_vs_lblcr.c:502:17: sparse: dereference of noderef expression
net/netfilter/ipvs/ip_vs_lblcr.c:540:17: sparse: dereference of noderef expression
net/netfilter/ipvs/ip_vs_ctl.c:1940:21: sparse: context imbalance in 'ip_vs_info_seq_start' - wrong count at exit
include/linux/rcupdate.h:326:30: sparse: context imbalance in 'ip_vs_info_seq_stop' - unexpected unlock
drivers/net/usb/cdc_ether.c:409:46: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:92:20: sparse: incorrect type in argument 1 (different address spaces)
drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:93:32: sparse: incorrect type in argument 1 (different address spaces)
drivers/dma/ioat/dma_v3.c:257:21: sparse: symbol 'ioat3_alloc_sed' was not declared. Should it be static?
drivers/dma/ioat/dma_v3.c:278:6: sparse: symbol 'ioat3_free_sed' was not declared. Should it be static?
drivers/gpu/drm/drm_prime.c:505:5: sparse: symbol 'drm_prime_add_buf_handle' was not declared. Should it be static?
drivers/gpu/drm/drm_prime.c:546:6: sparse: symbol 'drm_prime_remove_buf_handle' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_drv.c:49:5: sparse: symbol 'qxl_modeset' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_kms.c:140:19: sparse: incorrect type in assignment (different address spaces)
drivers/gpu/drm/qxl/qxl_kms.c:154:26: sparse: incorrect type in assignment (different address spaces)
drivers/gpu/drm/qxl/qxl_kms.c:104:5: sparse: symbol 'qxl_device_init' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_kms.c:249:21: sparse: incorrect type in argument 1 (different address spaces)
drivers/gpu/drm/qxl/qxl_kms.c:250:21: sparse: incorrect type in argument 1 (different address spaces)
drivers/gpu/drm/qxl/qxl_kms.c:233:6: sparse: symbol 'qxl_device_fini' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_display.c:416:5: sparse: symbol 'qxl_framebuffer_surface_dirty' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_display.c:622:6: sparse: symbol 'qxl_crtc_load_lut' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_display.c:636:5: sparse: symbol 'qdev_crtc_init' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_display.c:767:20: sparse: symbol 'qxl_best_encoder' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_display.c:858:5: sparse: symbol 'qdev_output_init' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_ttm.c:318:15: sparse: symbol 'qxl_ttm_tt_create' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_fb.c:162:23: sparse: symbol 'qxl_defio' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_fb.c:427:27: sparse: incorrect type in assignment (different address spaces)
drivers/gpu/drm/qxl/qxl_object.c:164:40: sparse: incorrect type in return expression (different address spaces)
drivers/gpu/drm/qxl/qxl_object.c:200:33: sparse: incorrect type in argument 1 (different address spaces)
drivers/gpu/drm/qxl/qxl_gem.c:130:5: sparse: symbol 'qxl_gem_set_domain' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_cmd.c:147:6: sparse: symbol 'qxl_ring_pop' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_cmd.c:172:6: sparse: symbol 'qxl_ring_wait_idle' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_cmd.c:612:6: sparse: symbol 'qxl_surface_evict_locked' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_ioctl.c:33:5: sparse: symbol 'qxl_alloc_ioctl' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_ioctl.c:61:5: sparse: symbol 'qxl_map_ioctl' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_ioctl.c:104:15: sparse: symbol 'qxlhw_handle_to_bo' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_ioctl.c:156:21: sparse: incorrect type in argument 2 (different address spaces)
drivers/gpu/drm/qxl/qxl_ioctl.c:185:146: sparse: incorrect type in argument 2 (different address spaces)
drivers/gpu/drm/qxl/qxl_ioctl.c:195:29: sparse: incorrect type in argument 2 (different address spaces)
drivers/gpu/drm/qxl/qxl_ioctl.c:132:5: sparse: symbol 'qxl_execbuffer_ioctl' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_ioctl.c:269:5: sparse: symbol 'qxl_update_area_ioctl' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_ioctl.c:154:51: sparse: dereference of noderef expression
drivers/gpu/drm/qxl/qxl_ioctl.c:185:168: sparse: dereference of noderef expression
drivers/gpu/drm/qxl/qxl_ioctl.c:195:29: sparse: dereference of noderef expression
drivers/gpu/drm/qxl/qxl_release.c:120:5: sparse: symbol 'qxl_release_bo_alloc' was not declared. Should it be static?
arch/x86/kernel/cpu/perf_event_intel.c:158:42: sparse: not a function <noident>
drivers/hwmon/tmp401.c:107:10: sparse: symbol 'TMP432_STATUS_REG' was not declared. Should it be static?
drivers/target/iscsi/iscsi_target.c:1161:5: sparse: symbol 'iscsit_handle_scsi_cmd' was not declared. Should it be static?
drivers/infiniband/ulp/isert/ib_isert.c:1424:1: sparse: symbol 'isert_cq_tx_work' was not declared. Should it be static?
drivers/usb/gadget/mv_u3d_core.c:51:33: sparse: incorrect type in initializer (different base types)
drivers/usb/gadget/mv_u3d_core.c:256:35: sparse: incorrect type in assignment (different base types)
drivers/usb/gadget/mv_u3d_core.c:262:41: sparse: incorrect type in assignment (different base types)
drivers/usb/gadget/mv_u3d_core.c:321:29: sparse: incorrect type in assignment (different base types)
drivers/usb/gadget/mv_u3d_core.c:323:25: sparse: incorrect type in assignment (different base types)
drivers/usb/gadget/mv_u3d_core.c:367:34: sparse: incorrect type in assignment (different base types)
drivers/usb/gadget/mv_u3d_core.c:369:30: sparse: incorrect type in assignment (different base types)
drivers/usb/gadget/mv_u3d_core.c:906:42: sparse: incorrect type in argument 2 (different address spaces)
drivers/usb/gadget/mv_u3d_core.c:1487:26: sparse: cast from restricted __le16
drivers/usb/renesas_usbhs/common.c:448:24: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/renesas_usbhs/common.c:449:36: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/chipidea/core.c:411:20: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/chipidea/core.c:412:32: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/chipidea/udc.c:407:37: sparse: incorrect type in assignment (different base types)
drivers/usb/chipidea/udc.c:408:37: sparse: incorrect type in assignment (different base types)
drivers/usb/chipidea/udc.c:410:45: sparse: invalid assignment: |drivers/usb/chipidea/udc.c:421:29: sparse: incorrect type in assignment (different base types)
drivers/usb/chipidea/udc.c:422:28: sparse: invalid assignment: &drivers/usb/chipidea/udc.c:423:28: sparse: invalid assignment: |drivers/usb/chipidea/udc.c:425:36: sparse: incorrect type in assignment (different base types)
drivers/usb/chipidea/udc.c:427:36: sparse: incorrect type in assignment (different base types)
drivers/usb/chipidea/udc.c:429:43: sparse: invalid assignment: |drivers/usb/chipidea/udc.c:431:29: sparse: incorrect type in assignment (different base types)
drivers/usb/chipidea/udc.c:435:36: sparse: incorrect type in assignment (different base types)
drivers/usb/chipidea/udc.c:447:46: sparse: incorrect type in assignment (different base types)
drivers/usb/chipidea/udc.c:449:45: sparse: incorrect type in assignment (different base types)
drivers/usb/chipidea/udc.c:463:32: sparse: incorrect type in assignment (different base types)
drivers/usb/chipidea/udc.c:464:31: sparse: invalid assignment: &drivers/usb/chipidea/udc.c:465:26: sparse: invalid assignment: |drivers/usb/chipidea/udc.c:487:14: sparse: restricted __le32 degrades to integer
drivers/usb/chipidea/udc.c:491:22: sparse: restricted __le32 degrades to integer
drivers/usb/chipidea/udc.c:501:28: sparse: cast to restricted __le32
drivers/usb/chipidea/udc.c:509:30: sparse: cast to restricted __le32
drivers/usb/chipidea/udc.c:1010:34: sparse: invalid assignment: |drivers/usb/chipidea/udc.c:1012:34: sparse: invalid assignment: &drivers/usb/chipidea/udc.c:1014:34: sparse: invalid assignment: &drivers/usb/chipidea/udc.c:1016:26: sparse: invalid assignment: |drivers/usb/chipidea/udc.c:1018:30: sparse: invalid assignment: |drivers/usb/phy/phy-samsung-usb3.c:248:20: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/phy/phy-samsung-usb3.c:249:32: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/gadget/f_serial.c:346:21: sparse: symbol 'gser_alloc' was not declared. Should it be static?
drivers/usb/gadget/f_obex.c:501:21: sparse: symbol 'obex_alloc' was not declared. Should it be static?
drivers/nfc/pn533.c:2564:5: sparse: symbol 'pn533_dev_up' was not declared. Should it be static?
drivers/nfc/pn533.c:2569:5: sparse: symbol 'pn533_dev_down' was not declared. Should it be static?
drivers/i2c/busses/i2c-designware-platdrv.c:116:23: sparse: incorrect type in argument 1 (different address spaces)
drivers/i2c/busses/i2c-designware-platdrv.c:117:35: sparse: incorrect type in argument 1 (different address spaces)
drivers/tty/sysrq.c:56:5: sparse: symbol 'sysrq_reset_downtime_ms' was not declared. Should it be static?
drivers/spi/spi-pxa2xx.c:1093:23: sparse: incorrect type in argument 1 (different address spaces)
drivers/spi/spi-pxa2xx.c:1094:35: sparse: incorrect type in argument 1 (different address spaces)
drivers/spi/spi-pxa2xx.c:1094:31: sparse: incorrect type in return expression (different base types)
drivers/gpu/drm/qxl/qxl_ioctl.c:411:5: sparse: symbol 'qxl_max_ioctls' was not declared. Should it be static?
drivers/block/mtip32xx/mtip32xx.c:86:12: sparse: symbol 'dev_lock' was not declared. Should it be static?
arch/x86/kernel/cpu/perf_event_intel.c:158:9: sparse: undefined identifier 'INTEL_UEVENT_PEBS_LDLAT_EXTRA_REG'
net/ipv6/addrconf_core.c:83:5: sparse: symbol 'register_inet6addr_notifier' was not declared. Should it be static?
net/ipv6/addrconf_core.c:89:5: sparse: symbol 'unregister_inet6addr_notifier' was not declared. Should it be static?
net/ipv6/addrconf_core.c:95:5: sparse: symbol 'inet6addr_notifier_call_chain' was not declared. Should it be static?
drivers/acpi/pci_slot.c:162:6: sparse: symbol 'acpi_pci_slot_enumerate' was not declared. Should it be static?
drivers/acpi/pci_slot.c:170:6: sparse: symbol 'acpi_pci_slot_remove' was not declared. Should it be static?
drivers/usb/gadget/ncm.c:114:16: sparse: symbol 'the_dev' was not declared. Should it be static?
include/linux/of_address.h:91:5: sparse: symbol 'of_pci_range_parser' was not declared. Should it be static?
include/linux/of_address.h:97:21: sparse: symbol 'of_pci_process_ranges' was not declared. Should it be static?

[smatch]
drivers/staging/comedi/drivers/unioxx5.c:384 __unioxx5_subdev_init() warn: possible memory leak of 'usp'

[coccinelle]
drivers/gpu/drm/qxl/qxl_display.c:99:1-29: ERROR: reference preceded by free on line 86
drivers/gpu/drm/qxl/qxl_display.c:99:1-29: ERROR: reference preceded by free on line 86
drivers/net/wireless/ath/ath6kl/htc_mbox.c:105:32-43: ERROR: invalid reference to the index variable of the iterator on line 62
drivers/net/wireless/ath/ath6kl/htc_mbox.c:105:32-43: ERROR: invalid reference to the index variable of the iterator on line 62

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
