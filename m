From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 28 Mar 2013 16:02:21 +0000
Subject: build regressions 2013-03-28
Message-Id: <5154698d.MumZELkyhzy1VZ1w%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/net/ethernet/adi/bfin_mac.c:694:2: error: implicit declaration of function 'bfin_read_EMAC_PTP_CTL' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:702:3: error: implicit declaration of function 'bfin_write_EMAC_PTP_FV3' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:712:3: error: implicit declaration of function 'bfin_write_EMAC_PTP_CTL' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:717:3: error: implicit declaration of function 'bfin_write_EMAC_PTP_FOFF' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:723:3: error: implicit declaration of function 'bfin_write_EMAC_PTP_FV1' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:725:3: error: implicit declaration of function 'bfin_write_EMAC_PTP_FV2' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:804:14: error: 'PTP_EN' undeclared (first use in this function)
drivers/net/ethernet/adi/bfin_mac.c:815:3: error: implicit declaration of function 'bfin_read_EMAC_PTP_RXSNAPLO' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:816:3: error: implicit declaration of function 'bfin_read_EMAC_PTP_RXSNAPHI' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:818:3: error: implicit declaration of function 'bfin_read_EMAC_PTP_TXSNAPLO' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:819:3: error: implicit declaration of function 'bfin_read_EMAC_PTP_TXSNAPHI' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:847:3: error: implicit declaration of function 'bfin_read_EMAC_PTP_ISTAT' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:847:42: error: 'TXTL' undeclared (first use in this function)
drivers/net/ethernet/adi/bfin_mac.c:876:39: error: 'RXEL' undeclared (first use in this function)
drivers/net/ethernet/adi/bfin_mac.c:900:2: error: implicit declaration of function 'bfin_write_EMAC_PTP_ADDEND' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:917:2: error: implicit declaration of function 'bfin_read_EMAC_PTP_TIMELO' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:918:2: error: implicit declaration of function 'bfin_read_EMAC_PTP_TIMEHI' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:935:2: error: implicit declaration of function 'bfin_write_EMAC_PTP_TIMELO' [-Werror=implicit-function-declaration]
drivers/net/ethernet/adi/bfin_mac.c:936:2: error: implicit declaration of function 'bfin_write_EMAC_PTP_TIMEHI' [-Werror=implicit-function-declaration]
drivers/net/macvtap.c:728:2: error: implicit declaration of function 'skb_probe_transport_header' [-Werror=implicit-function-declaration]
drivers/mfd/pm8xxx-irq.c:361:2: error: implicit declaration of function 'set_irq_wake' [-Werror=implicit-function-declaration]
drivers/input/keyboard/pmic8xxx-keypad.c:24:35: fatal error: linux/mfd/pm8xxx/gpio.h: No such file or directory
drivers/mfd/pm8921-core.c:193:12: error: 'THIS_MODULE' undeclared here (not in a function)
drivers/mfd/pm8921-core.c:209:16: error: expected declaration specifiers or '...' before string constant
drivers/mfd/pm8921-core.c:210:20: error: expected declaration specifiers or '...' before string constant
drivers/mfd/pm8921-core.c:211:16: error: expected declaration specifiers or '...' before string constant
drivers/mfd/pm8921-core.c:212:14: error: expected declaration specifiers or '...' before string constant
drivers/gpu/drm/i915/intel_dp.c:804:1: error: expected expression before '<<' token
drivers/gpu/drm/i915/intel_dp.c:807:1: error: expected expression before '=' token
drivers/gpu/drm/i915/intel_dp.c:810:1: error: expected expression before '>>' token
drivers/net/tun.c:1206:2: error: implicit declaration of function 'skb_probe_transport_header' [-Werror=implicit-function-declaration]
net/packet/af_packet.c:1515:2: error: implicit declaration of function 'skb_probe_transport_header' [-Werror=implicit-function-declaration]
olpc-xo1-pm.c:(.devinit.text+0x4c): undefined reference to `mfd_cell_enable'
olpc-xo1-pm.c:(.devexit.text+0x7): undefined reference to `mfd_cell_disable'
drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c:12525:3: error: 'struct bnx2x' has no member named 'vf2pf_mutex'
nvme-scsi.c:(.text+0x201c9c): undefined reference to `__udivdi3'
drivers/net/can/sja1000/sja1000_of_platform.c:126:13: error: 'NO_IRQ' undeclared (first use in this function)
drivers/usb/gadget/configfs.c:442:2: error: implicit declaration of function '__WARN_printf' [-Werror=implicit-function-declaration]
drivers/usb/gadget/configfs.c:733:2: error: implicit declaration of function '__WARN' [-Werror=implicit-function-declaration]
drivers/acpi/osl.c:629:29: error: 'max_low_pfn_mapped' undeclared (first use in this function)
include/linux/llist.h:160:3: error: implicit declaration of function 'cmpxchg_local' [-Werror=implicit-function-declaration]
include/linux/gpio.h:60:19: error: redefinition of 'gpio_cansleep'
include/linux/gpio.h:62:2: error: implicit declaration of function '__gpio_cansleep'
include/linux/gpio.h:67:2: error: implicit declaration of function '__gpio_to_irq'
drivers/gpio/devres.c:26:2: error: implicit declaration of function 'gpio_free'
drivers/gpio/devres.c:60:2: error: implicit declaration of function 'gpio_request'
drivers/mfd/pm8xxx-irq.c:131:4: error: implicit declaration of function 'generic_handle_irq' [-Werror=implicit-function-declaration]
drivers/mfd/pm8xxx-irq.c:162:9: error: implicit declaration of function 'irq_desc_get_handler_data' [-Werror=implicit-function-declaration]
drivers/mfd/pm8xxx-irq.c:163:9: error: implicit declaration of function 'irq_desc_get_chip' [-Werror=implicit-function-declaration]
drivers/mfd/pm8xxx-irq.c:186:9: error: implicit declaration of function 'irq_data_get_irq_chip_data' [-Werror=implicit-function-declaration]
drivers/mfd/pm8xxx-irq.c:347:3: error: implicit declaration of function 'irq_set_chip_and_handler' [-Werror=implicit-function-declaration]
drivers/mfd/pm8xxx-irq.c:349:5: error: 'handle_level_irq' undeclared (first use in this function)
drivers/mfd/pm8xxx-irq.c:350:3: error: implicit declaration of function 'irq_set_chip_data' [-Werror=implicit-function-declaration]
drivers/mfd/pm8xxx-irq.c:354:3: error: implicit declaration of function 'irq_set_noprobe' [-Werror=implicit-function-declaration]
drivers/mfd/pm8xxx-irq.c:358:2: error: implicit declaration of function 'irq_set_irq_type' [-Werror=implicit-function-declaration]
drivers/mfd/pm8xxx-irq.c:359:2: error: implicit declaration of function 'irq_set_handler_data' [-Werror=implicit-function-declaration]
drivers/mfd/pm8xxx-irq.c:360:2: error: implicit declaration of function 'irq_set_chained_handler' [-Werror=implicit-function-declaration]
drivers/video/vfb.c:429:52: error: 'PAGE_SHARED' undeclared (first use in this function)
sound/pci/lx6464es/lx6464es.c:557:2: error: implicit declaration of function 'ioport_unmap' [-Werror=implicit-function-declaration]
sound/pci/lx6464es/lx6464es.c:1020:2: error: implicit declaration of function 'ioport_map' [-Werror=implicit-function-declaration]
drivers/staging/ced1401/usb1401.c:147:2: error: implicit declaration of function 'usb_buffer_free' [-Werror=implicit-function-declaration]
drivers/staging/ced1401/usb1401.c:162:2: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
drivers/staging/ced1401/usb1401.c:1386:11: error: 'THIS_MODULE' undeclared here (not in a function)
drivers/staging/ced1401/usb1401.c:1394:2: error: unknown field 'ioctl' specified in initializer
drivers/staging/ced1401/usb1401.c:1420:2: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
drivers/staging/ced1401/usb1401.c:1477:6: error: implicit declaration of function 'usb_buffer_alloc' [-Werror=implicit-function-declaration]
drivers/staging/ced1401/usb1401.c:1637:16: error: expected declaration specifiers or '...' before string constant
make[2]: *** No rule to make target `drivers/serial/serial_core.c', needed by `Documentation/DocBook/kernel-api.xml'.
make[2]: *** No rule to make target `drivers/serial/8250.c', needed by `Documentation/DocBook/kernel-api.xml'.
make[2]: *** No rule to make target `kernel/sched.c', needed by `Documentation/DocBook/kernel-api.xml'.
make[2]: *** No rule to make target `drivers/base/sys.c', needed by `Documentation/DocBook/kernel-api.xml'.
make[2]: *** No rule to make target `arch/powerpc/kernel/rio.c', needed by `Documentation/DocBook/rapidio.xml'.
make[2]: *** No rule to make target `drivers/net/wan/syncppp.c', needed by `Documentation/DocBook/networking.xml'.
drivers/nfc/microread/mei.c:25:27: fatal error: linux/mei_bus.h: No such file or directory

[warnings]
sound/soc/soc-compress.c:201:22: warning: unused variable 'codec_dai' [-Wunused-variable]
drivers/gpu/drm/i915/intel_dp.c:783:18: warning: unused variable 'cpu_transcoder' [-Wunused-variable]
drivers/gpu/drm/i915/intel_dp.c:782:6: warning: unused variable 'pipe' [-Wunused-variable]
drivers/gpu/drm/i915/intel_dp.c:781:24: warning: unused variable 'm_n' [-Wunused-variable]
drivers/gpu/drm/i915/intel_dp.c:778:27: warning: unused variable 'dev_priv' [-Wunused-variable]
mm/page_alloc.c:5134:3: warning: passing argument 1 of 'virt_to_phys' makes pointer from integer without a cast [enabled by default]
drivers/net/ethernet/intel/e1000e/ich8lan.c:898:4: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/mfd/pm8xxx-irq.c:162:29: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/mfd/pm8xxx-irq.c:163:30: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/mfd/pm8xxx-irq.c:186:29: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/mfd/pm8xxx-irq.c:201:29: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/mfd/pm8xxx-irq.c:216:29: warning: initialization makes pointer from integer without a cast [enabled by default]
warning: (ARM_GIC && ARM_VIC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_TPS65910 && TWL4030_CORE && MFD_LP8788 && MFD_MAX77686 && MFD_MAX8997 && MFD_WM831X_I2C && MFD_WM831X_SPI && AB8500_CORE && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_VIC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_TPS65910 && TWL4030_CORE && MFD_LP8788 && MFD_MAX77686 && MFD_MAX8997 && MFD_WM831X_I2C && MFD_WM831X_SPI && AB8500_CORE && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_VIC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_TPS65910 && TWL4030_CORE && MFD_LP8788 && MFD_MAX77686 && MFD_MAX8997 && MFD_WM831X_I2C && MFD_WM831X_SPI && AB8500_CORE && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
drivers/base/regmap/regmap.c:946:4: warning: passing argument 1 of 'map->format.parse_val' discards 'const' qualifier from pointer target type [enabled by default]
drivers/net/can/usb/peak_usb/pcan_usb_pro.c:707:10: warning: 'usb_msg.u.rec_cnt_rd' may be used uninitialized in this function [-Wmaybe-uninitialized]

[smatch]
drivers/mfd/pm8921-core.c:178 pm8921_remove() error: potential NULL dereference 'pmic'.
drivers/mfd/pm8921-core.c:178 pm8921_remove() error: we previously assumed 'pmic' could be null (see line 176)
drivers/nfc/microread/mei.c:130 microread_event_cb() error: use kfree_skb() here instead of kfree(skb)
drivers/block/nvme-core.c:492 nvme_map_bio() error: potential NULL dereference 'sg'.
mm/fremap.c:250 sys_remap_file_pages() error: we previously assumed 'vma' could be null (see line 166)
drivers/usb/gadget/mv_u3d_core.c:313 mv_u3d_build_trb_one() warn: possible memory leak of 'trb'
mm/page_alloc.c:1958 get_page_from_freelist() warn: bitwise AND condition is false here
kernel/workqueue.c:4440 wq_numa_init() warn: possible memory leak of 'tbl'
kernel/workqueue.c:3889 apply_workqueue_attrs() warn: possible memory leak of 'pwq_tbl'
drivers/media/dvb-frontends/mb86a20s.c:1897 mb86a20s_set_frontend() error: buffer overflow 'mb86a20s_subchannel' 8 <= 8
drivers/media/v4l2-core/v4l2-mem2mem.c:233 v4l2_m2m_try_schedule() error: double lock 'irqsave:flags'
drivers/media/v4l2-core/v4l2-mem2mem.c:236 v4l2_m2m_try_schedule() error: double unlock 'irqsave:flags'
drivers/media/v4l2-core/v4l2-mem2mem.c:242 v4l2_m2m_try_schedule() error: double unlock 'irqsave:flags'
drivers/media/common/siano/smscoreapi.c:396 smscore_translate_msg() error: buffer overflow 'siano_msgs' 401 <= 401
drivers/media/common/siano/smsdvb-main.c:155 smsdvb_stats_not_ready() warn: missing break? reassigning 'n_layers'
drivers/media/usb/dvb-usb-v2/af9035.c:121 af9035_ctrl_msg() warn: inconsistent returns mutex:&d->usb_mutex: locked (105) unlocked (121)
drivers/staging/media/go7007/go7007-usb.c:969 go7007_usb_i2c_master_xfer() warn: was 'sizeof(*buf)' intended?
drivers/staging/media/go7007/go7007-driver.c:384 frame_boundary() warn: variable dereferenced before check 'vb' (see line 381)
drivers/staging/media/go7007/go7007-driver.c:532 go7007_parse_video_stream() error: we previously assumed 'vb' could be null (see line 531)
drivers/net/caif/caif_virtio.c:743 cfv_probe() error: we previously assumed 'vdev->vringh_config' could be null (see line 674)
drivers/input/misc/ims-pcu.c:295 ims_pcu_setup_gamepad() warn: possible memory leak of 'gamepad'
drivers/staging/dwc2/hcd_intr.c:1366 dwc2_hc_nyet_intr() warn: variable dereferenced before check 'qtd->urb' (see line 1365)
drivers/staging/dwc2/hcd_ddma.c:226 dwc2_update_frame_list() error: we previously assumed 'hsotg' could be null (see line 225)
drivers/usb/gadget/udc-core.c:247 usb_add_gadget_udc_release() warn: possible memory leak of 'udc'
drivers/usb/phy/phy-samsung-usb.c:115 samsung_usbphy_set_isolation() error: potential NULL dereference 'reg'.
drivers/usb/phy/phy-samsung-usb.h:235 samsung_usbphy_get_driver_data() error: potential NULL dereference 'match'.
ipc/util.c:724 ipc_lock() warn: inconsistent returns spin_lock:&out->lock: locked (719) unlocked (724)
fs/dcache.c:1263 d_add_ci() error: 'found' dereferencing possible ERR_PTR()
fs/file_table.c:174 alloc_file() error: 'file' dereferencing possible ERR_PTR()

[coccinelle]
drivers/firmware/efivars.c:738:8-15: WARNING opportunity for memdup_user
drivers/infiniband/hw/cxgb4/device.c:597:2-14: code aligned with following code on line 599
drivers/net/tun.c:138:8-15: WARNING opportunity for memdup_user
net/packet/af_packet.c:3659:4-50: code aligned with following code on line 3660
drivers/gpu/drm/i915/intel_dp.c:908:31-32: duplicated argument to & or |
drivers/gpu/drm/i915/intel_dp.c:909:34-35: duplicated argument to & or |
drivers/gpu/drm/i915/intel_dp.c:911:32-33: duplicated argument to & or |
drivers/gpu/drm/i915/intel_dp.c:912:25-26: duplicated argument to & or |
drivers/gpu/drm/i915/intel_dp.c:912:33-34: duplicated argument to & or |
drivers/gpu/drm/i915/intel_dp.c:915:26-27: duplicated argument to & or |
drivers/gpu/drm/i915/intel_dp.c:915:34-35: duplicated argument to & or |
drivers/gpu/drm/i915/i915_gem.c:795:1-7: preceding lock on line 766
drivers/gpu/drm/drm_prime.c:278:9-16: WARNING: ERR_CAST can be used with attach
drivers/md/dm-cache-metadata.c:1011:1-7: Replace memcpy with struct assignment
drivers/md/dm-cache-metadata.c:1019:1-7: Replace memcpy with struct assignment
drivers/md/dm-cache-target.c:1822:1-7: Replace memcpy with struct assignment
drivers/misc/mei/amthif.c:194:3-9: preceding lock on line 191

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
