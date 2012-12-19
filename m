From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 19 Dec 2012 18:27:19 +0000
Subject: build regressions 2012-12-19
Message-Id: <50d20707.h0Zotalpnavol9cY%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/mach-omap2/i2c.c:130:2: error: implicit declaration of function 'omap_pm_set_max_mpu_wakeup_lat' [-Werror=implicit-function-declaration]
(.text+0x8a507): undefined reference to `drm_vma_offset_lookup'
ERROR: "drm_vma_offset_man_init" [drivers/gpu/drm/ttm/ttm.ko] undefined!
ERROR: "drm_vma_offset_destroy" [drivers/gpu/drm/ttm/ttm.ko] undefined!
ERROR: "drm_vma_offset_lookup_rb" [drivers/gpu/drm/ttm/ttm.ko] undefined!
ERROR: "drm_vma_offset_setup" [drivers/gpu/drm/ttm/ttm.ko] undefined!
ERROR: "drm_vma_offset_man_fini" [drivers/gpu/drm/ttm/ttm.ko] undefined!
include/drm/drm_vma_offset_man.h:55:46: error: 'PAGE_SHIFT' undeclared (first use in this function)
drivers/gpu/drm/ttm/ttm_bo_util.c:441:5: error: 'struct ttm_buffer_object' has no member named 'vm_node'
drivers/gpu/drm/ttm/ttm_bo_vm.c:118:8: error: 'struct ttm_buffer_object' has no member named 'vm_node'
drivers/gpu/drm/gma500/gem.c:41:9: error: 'struct drm_gem_object' has no member named 'map_list'
drivers/gpu/drm/udl/udl_gem.c:226:13: error: 'struct drm_gem_object' has no member named 'map_list'
drivers/gpu/drm/drm_vma_offset_man.c:94:2: error: implicit declaration of function 'list_init' [-Werror=implicit-function-declaration]
ERROR: "drm_vma_offset_lookup" [drivers/gpu/drm/drm.ko] undefined!

[warnings]
drivers/block/drbd/drbd_receiver.c:4644:2: warning: 'what' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/wireless/rtlwifi/rtl8192de/../wifi.h:1899:27: warning: 'value32' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/dma/ioat/dma_v3.c:1130:17: warning: 'dma_addr' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/drm/drm_vma_offset_man.h:56:1: warning: control reaches end of non-void function [-Wreturn-type]
include/drm/drm_vma_offset_man.h:39:14: warning: 'struct address_space' declared inside parameter list [enabled by default]
include/drm/drm_vma_offset_man.h:39:14: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
drivers/gpu/drm/ttm/ttm_bo.c:1601:10: warning: passing argument 1 of 'drm_vma_unmap_mapping' from incompatible pointer type [enabled by default]
include/linux/of_irq.h:82:7: warning: 'struct device_node' declared inside parameter list [enabled by default]
include/linux/of_irq.h:82:7: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
warning: (USB_XUSBPS_DR_OF && XILINX_ZED_USB_OTG) selects USB_ULPI which has unmet direct dependencies (USB_SUPPORT && (USB || USB_GADGET) && ARM)
WARNING: drivers/rtc/built-in.o(.text+0x2b8): Section mismatch in reference from the (unknown reference) (unknown) to the function .init.text:rtc_hctosys()

[sparse]
drivers/gpu/drm/drm_vma_offset_man.c:4:28: sparse: symbol 'drm_vma_offset_lookup_rb_locked' was not declared. Should it be static?
drivers/gpu/drm/gma500/gem.c:90:20: sparse: cast from unknown type
drivers/gpu/drm/gma500/gem.c:90:47: sparse: incompatible types for operation (<<)
drivers/gpu/drm/udl/udl_gem.c:256:20: sparse: cast from unknown type
drivers/gpu/drm/udl/udl_gem.c:256:53: sparse: incompatible types for operation (<<)
drivers/gpu/drm/drm_vma_offset_man.c:33:28: sparse: symbol 'drm_vma_offset_lookup_rb' was not declared. Should it be static?
sound/usb/quirks.c:531:5: sparse: symbol 'snd_usb_mbox2_boot_quirk' was not declared. Should it be static?
drivers/gpu/drm/ttm/ttm_bo_util.c:441:12: sparse: no member 'vm_node' in struct ttm_buffer_object
drivers/gpu/drm/ttm/ttm_bo_vm.c:118:15: sparse: no member 'vm_node' in struct ttm_buffer_object
drivers/gpu/drm/gma500/gem.c:41:16: sparse: no member 'map_list' in struct drm_gem_object
drivers/gpu/drm/udl/udl_gem.c:226:20: sparse: no member 'map_list' in struct drm_gem_object
drivers/gpu/drm/drm_vma_offset_man.c:94:9: sparse: undefined identifier 'list_init'

[smatch]
drivers/staging/bcm/CmHost.c:1281 DumpCmControlPacket() debug: remove_pools: nr_children over 4000 (8255). (psfCSType->cCPacketClassificationRule.u8EthernetSourceMACAddress s32min-s32max)

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
