From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 12 Apr 2013 17:30:20 +0000
Subject: build regressions 2013-04-12
Message-Id: <516844ac.FQynwILU0vkREm5c%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/usb/gadget/mv_u3d_core.c:70:2: error: implicit declaration of function 'ioread32' [-Werror=implicit-function-declaration]
drivers/usb/gadget/mv_u3d_core.c:72:2: error: implicit declaration of function 'iowrite32' [-Werror=implicit-function-declaration]
drivers/usb/gadget/ether.c:112:1: error: expected ')' before '.' token
drivers/usb/gadget/ether.c:112:1: error: expected ')' before string constant
drivers/usb/gadget/ether.c:112:1: error: expected ')' before '.' token
drivers/usb/gadget/ether.c:112:1: error: expected ')' before string constant
drivers/usb/gadget/ether.c:112:1: error: expected ')' before '.' token
drivers/usb/gadget/ether.c:112:1: error: expected ')' before string constant
drivers/usb/gadget/ether.c:112:1: error: expected ')' before '.' token
drivers/usb/gadget/ether.c:112:1: error: expected ')' before string constant
drivers/usb/gadget/ether.c:112:1: error: expected ')' before '.' token
drivers/usb/gadget/ether.c:112:1: error: expected ')' before string constant
drivers/usb/gadget/ether.c:112:1: error: expected ')' before '.' token
drivers/usb/gadget/ether.c:112:1: error: expected ')' before string constant
drivers/usb/gadget/ether.c:115:21: error: expected ')' before 'uint'
drivers/usb/gadget/ether.c:116:25: error: expected ')' before string constant
drivers/usb/gadget/ether.c:121:28: error: expected ')' before string constant
drivers/usb/gadget/ether.c:126:29: error: expected ')' before string constant
drivers/usb/gadget/ether.c:257:23: error: expected ')' before 'bool'
drivers/usb/gadget/ether.c:258:27: error: expected ')' before string constant
drivers/usb/gadget/ether.c:374:20: error: expected declaration specifiers or '...' before string constant
drivers/usb/gadget/ether.c:375:15: error: expected declaration specifiers or '...' before string constant
drivers/usb/gadget/ether.c:376:16: error: expected declaration specifiers or '...' before string constant
drivers/mfd/syscon.c:94:15: error: variable 'syscon_regmap_config' has initializer but incomplete type
drivers/mfd/syscon.c:95:2: error: unknown field 'reg_bits' specified in initializer
drivers/mfd/syscon.c:96:2: error: unknown field 'val_bits' specified in initializer
drivers/mfd/syscon.c:97:2: error: unknown field 'reg_stride' specified in initializer
drivers/mfd/syscon.c:124:2: error: invalid use of undefined type 'struct regmap_config'
drivers/mfd/syscon.c:125:2: error: implicit declaration of function 'devm_regmap_init_mmio' [-Werror=implicit-function-declaration]
drivers/media/pci/sta2x11/sta2x11_vip.c:1314:2: error: implicit declaration of function 'i2c_get_adapter' [-Werror=implicit-function-declaration]
drivers/media/pci/sta2x11/sta2x11_vip.c:1330:2: error: implicit declaration of function 'i2c_put_adapter' [-Werror=implicit-function-declaration]
drivers/media/i2c/adv7180.c:194:2: error: implicit declaration of function 'i2c_smbus_read_byte_data' [-Werror=implicit-function-declaration]
drivers/media/i2c/adv7180.c:251:2: error: implicit declaration of function 'i2c_smbus_write_byte_data' [-Werror=implicit-function-declaration]
drivers/media/i2c/adv7180.c:551:2: error: implicit declaration of function 'i2c_check_functionality' [-Werror=implicit-function-declaration]
drivers/media/i2c/adv7180.c:554:2: error: implicit declaration of function 'i2c_adapter_id' [-Werror=implicit-function-declaration]
drivers/usb/gadget/g_ffs.c:76:25: error: 'QMULT_DEFAULT' undeclared here (not in a function)
drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:1796:2: error: call to '__compiletime_assert_1800' declared with attribute error: BUILD_BUG_ON failed: SKB_WITH_OVERHEAD(IXGBE_RXBUFFER_2K) < (NET_SKB_PAD + NET_IP_ALIGN + VLAN_HLEN + ETH_FRAME_LEN + ETH_FCS_LEN)
drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:1842:2: error: call to '__compiletime_assert_1846' declared with attribute error: BUILD_BUG_ON failed: SKB_WITH_OVERHEAD(IXGBE_RXBUFFER_2K) < (NET_SKB_PAD + NET_IP_ALIGN + VLAN_HLEN + ETH_FRAME_LEN + ETH_FCS_LEN)
drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:1885:2: error: call to '__compiletime_assert_1889' declared with attribute error: BUILD_BUG_ON failed: SKB_WITH_OVERHEAD(IXGBE_RXBUFFER_2K) < (NET_SKB_PAD + NET_IP_ALIGN + VLAN_HLEN + ETH_FRAME_LEN + ETH_FCS_LEN)

[warnings]
warning: (FB_ATMEL) selects OF_VIDEOMODE which has unmet direct dependencies (HAS_IOMEM && OF)
warning: (FB_ATMEL) selects OF_VIDEOMODE which has unmet direct dependencies (HAS_IOMEM && OF)
warning: (FB_ATMEL) selects OF_VIDEOMODE which has unmet direct dependencies (HAS_IOMEM && OF)
warning: (FB_ATMEL) selects OF_VIDEOMODE which has unmet direct dependencies (HAS_IOMEM && OF)
warning: (FB_ATMEL) selects OF_VIDEOMODE which has unmet direct dependencies (HAS_IOMEM && OF)
drivers/gpu/drm/qxl/qxl_kms.c:131:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/gpu/drm/qxl/qxl_kms.c:131:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/gpu/drm/qxl/qxl_kms.c:131:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/gpu/drm/qxl/qxl_kms.c:131:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/gpu/drm/qxl/qxl_ioctl.c:154:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/gpu/drm/qxl/qxl_ioctl.c:195:8: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/usb/gadget/ether.c:120:1: warning: data definition has no type or storage class [enabled by default]
drivers/usb/gadget/ether.c:120:1: warning: type defaults to 'int' in declaration of 'module_param' [-Wimplicit-int]
drivers/usb/gadget/ether.c:120:1: warning: parameter names (without types) in function declaration [enabled by default]
drivers/usb/gadget/ether.c:125:1: warning: data definition has no type or storage class [enabled by default]
drivers/usb/gadget/ether.c:125:1: warning: type defaults to 'int' in declaration of 'module_param' [-Wimplicit-int]
drivers/usb/gadget/ether.c:125:1: warning: parameter names (without types) in function declaration [enabled by default]
fs/ext4/page-io.c:66:6: warning: unused variable 'i' [-Wunused-variable]
drivers/mfd/syscon.c:95:2: warning: excess elements in struct initializer [enabled by default]
drivers/mfd/syscon.c:95:2: warning: (near initialization for 'syscon_regmap_config') [enabled by default]
drivers/mfd/syscon.c:96:2: warning: excess elements in struct initializer [enabled by default]
drivers/mfd/syscon.c:96:2: warning: (near initialization for 'syscon_regmap_config') [enabled by default]
drivers/mfd/syscon.c:97:2: warning: excess elements in struct initializer [enabled by default]
drivers/mfd/syscon.c:97:2: warning: (near initialization for 'syscon_regmap_config') [enabled by default]
drivers/mfd/syscon.c:125:17: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/net/wireless/ath/ath9k/hif_usb.c:982:25: warning: 'bulk_out_ep' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/media/pci/sta2x11/sta2x11_vip.c:1314:15: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/media/i2c/adv7180.c:663:1: warning: data definition has no type or storage class [enabled by default]
drivers/media/i2c/adv7180.c:663:1: warning: type defaults to 'int' in declaration of 'module_i2c_driver' [-Wimplicit-int]
drivers/media/i2c/adv7180.c:663:1: warning: parameter names (without types) in function declaration [enabled by default]
drivers/media/i2c/adv7180.c:649:26: warning: 'adv7180_driver' defined but not used [-Wunused-variable]
warning: (STA2X11_VIP) selects VIDEO_ADV7180 which has unmet direct dependencies (MEDIA_SUPPORT && VIDEO_V4L2 && I2C)
warning: (STA2X11_VIP) selects VIDEO_ADV7180 which has unmet direct dependencies (MEDIA_SUPPORT && VIDEO_V4L2 && I2C)
warning: (STA2X11_VIP) selects VIDEO_ADV7180 which has unmet direct dependencies (MEDIA_SUPPORT && VIDEO_V4L2 && I2C)
warning: (STA2X11_VIP) selects VIDEO_ADV7180 which has unmet direct dependencies (MEDIA_SUPPORT && VIDEO_V4L2 && I2C)
warning: (STA2X11_VIP) selects VIDEO_ADV7180 which has unmet direct dependencies (MEDIA_SUPPORT && VIDEO_V4L2 && I2C)
drivers/scsi/qla2xxx/qla_mr.c:3007:7: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/scsi/qla2xxx/qla_mr.c:3011:7: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/tty/serial/8250/8250_dw.c:275:3: warning: passing argument 1 of 'dw8250_probe_acpi' from incompatible pointer type [enabled by default]
drivers/gpu/drm/qxl/qxl_cmd.c:459:2: warning: 'idr_pre_get' is deprecated (declared at include/linux/idr.h:147) [-Wdeprecated-declarations]
drivers/gpu/drm/qxl/qxl_cmd.c:466:2: warning: 'idr_get_new_above' is deprecated (declared at include/linux/idr.h:162) [-Wdeprecated-declarations]
drivers/gpu/drm/qxl/qxl_release.c:60:2: warning: 'idr_pre_get' is deprecated (declared at include/linux/idr.h:147) [-Wdeprecated-declarations]
drivers/gpu/drm/qxl/qxl_release.c:66:2: warning: 'idr_get_new_above' is deprecated (declared at include/linux/idr.h:162) [-Wdeprecated-declarations]
drivers/staging/video/axivdma/xvdma.c:146:23: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/video/axivdma/xvdma.c:186:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/video/axivdma/xvdma.c:210:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/video/axivdma/xvdma.c:276:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/video/axivdma/xvdma.c:293:31: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/staging/video/axivdma/xvdma.c:294:31: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/staging/video/axivdma/xvdma.c:335:24: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/staging/video/axivdma/xvdma.c:338:24: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/mfd/wm8994-core.c:762:19: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/staging/comedi/drivers/unioxx5.c:381:18: warning: 'usp' may be used uninitialized in this function [-Wuninitialized]

[sparse]
include/trace/events/vmscan.h:71:1: sparse: cast from restricted gfp_t
include/trace/events/vmscan.h:71:1: sparse: cast from restricted gfp_t
include/trace/events/vmscan.h:71:1: sparse: cast from restricted gfp_t
include/trace/events/vmscan.h:71:1: sparse: cast from restricted gfp_t
include/trace/events/vmscan.h:71:1: sparse: cast from restricted gfp_t
include/trace/events/vmscan.h:71:1: sparse: cast from restricted gfp_t
include/trace/events/vmscan.h:71:1: sparse: cast from restricted gfp_t
include/trace/events/vmscan.h:71:1: sparse: cast from restricted gfp_t
include/trace/events/vmscan.h:71:1: sparse: cast from restricted gfp_t
include/trace/events/vmscan.h:71:1: sparse: cast from restricted gfp_t
include/trace/events/vmscan.h:71:1: sparse: cast from restricted gfp_t
include/trace/events/vmscan.h:71:1: sparse: cast from restricted gfp_t
include/trace/events/vmscan.h:71:1: sparse: cast from restricted gfp_t
include/trace/events/vmscan.h:71:1: sparse: cast from restricted gfp_t
include/trace/events/vmscan.h:71:1: sparse: cast from restricted gfp_t
include/trace/events/vmscan.h:71:1: sparse: cast from restricted gfp_t
include/trace/events/vmscan.h:71:1: sparse: cast from restricted gfp_t
include/trace/events/vmscan.h:71:1: sparse: cast from restricted gfp_t
include/trace/events/vmscan.h:71:1: sparse: cast from restricted gfp_t
include/trace/events/vmscan.h:71:1: sparse: cast from restricted gfp_t
include/trace/events/vmscan.h:71:1: sparse: cast from restricted gfp_t
include/trace/events/vmscan.h:71:1: sparse: cast from restricted gfp_t
include/trace/events/vmscan.h:71:1: sparse: cast from restricted gfp_t
include/trace/events/vmscan.h:71:1: sparse: incorrect type in argument 3 (different base types)
include/trace/events/vmscan.h:71:1: sparse: cast to restricted gfp_t
include/trace/events/vmscan.h:71:1: sparse: restricted gfp_t degrades to integer

[smatch]
net/9p/trans_rdma.c:511 rdma_request() warn: inconsistent returns sem:&rdma->sq_sem: locked (497 [s32min-s32max]) unlocked (501 [(-5)], 511 [0], 511 [s32min-(-1),1-s32max], 511 [0])
drivers/block/loop.c:984 loop_clr_fd() warn: inconsistent returns mutex:&lo->lo_ctl_mutex: locked (935 [(-6)], 938 [(-16)], 941 [(-22)]) unlocked (984 [0])
kernel/hrtimer.c:271 switch_hrtimer_base() warn: inconsistent returns spin_lock:&base->cpu_base->lock: locked (229 [s32min-s32max], 271 [s32min-s32max]) unlocked (271 [4096-s64max])
drivers/net/wireless/ipw2x00/libipw_wx.c:427 libipw_wx_set_encode() error: we previously assumed '*crypt->ops' could be null (see line 376)

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
