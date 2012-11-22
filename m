From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 22 Nov 2012 16:06:24 +0000
Subject: build regressions 2012-11-22
Message-Id: <50ae4d80.nFLzP92cFX6mRPwZ%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/video/omap2/omapfb/omapfb-main.c:1350:2: error: implicit declaration of function 'dma_free_attrs' [-Werror=implicit-function-declaration]
drivers/video/omap2/omapfb/omapfb-main.c:1415:2: error: implicit declaration of function 'dma_alloc_attrs' [-Werror=implicit-function-declaration]
drivers/video/display/panel-dpi.c:32:12: error: static declaration of 'display_entity_set_state' follows non-static declaration
drivers/video/display/panel-dpi.c:35:28: error: 'ent' undeclared (first use in this function)
drivers/video/display/panel-dpi.c:46:8: error: 'DISPLAY_ENTITY_STREAM_CONTINUOUS' undeclared (first use in this function)
drivers/video/sh_mobile_lcdcfb.c:2604:32: error: 'struct display_entity' has no member named 'width'
drivers/video/sh_mobile_lcdcfb.c:2605:33: error: 'struct display_entity' has no member named 'height'
drivers/video/omap2/omapfb/omapfb-ioctl.c:861:23: error: 'SZ_1M' undeclared (first use in this function)
drivers/video/of_display_timing.c:124:3: error: implicit declaration of function 'of_get_next_child' [-Werror=implicit-function-declaration]
net/mac80211/mlme.c:3269:20: error: 'IEEE80211_STA_DISABLE_11N' undeclared (first use in this function)
drivers/video/via/via_modesetting.h:36:8: error: redefinition of 'struct display_timing'

[warnings]
WARNING: drivers/mfd/built-in.o(.text+0xe589): Section mismatch in reference from the function max8997_i2c_probe() to the variable .devinit.data:max8997_pmic_dt_match
drivers/video/omap2/omapfb/omapfb-main.c:1415:8: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/video/display/panel-dpi.c:49:1: warning: no return statement in function returning non-void [-Wreturn-type]
drivers/video/display/panel-dpi.c:35:20: warning: unused variable 'panel' [-Wunused-variable]
drivers/video/of_display_timing.c:124:9: warning: assignment makes pointer from integer without a cast [enabled by default]

[sparse]
drivers/video/via/via_modesetting.h:36:23: sparse: redefinition of struct display_timing
drivers/video/of_display_timing.c:124:25: sparse: undefined identifier 'of_get_next_child'
drivers/video/display/panel-dpi.c:35:35: sparse: undefined identifier 'ent'
drivers/video/omap2/omapfb/omapfb-ioctl.c:861:37: sparse: undefined identifier 'SZ_1M'

[smatch]
fs/gfs2/inode.c:756 gfs2_create_inode() warn: variable dereferenced before check 'ip->i_gl' (see line 741)
drivers/mfd/retu-mfd.c:130 retu_power_off() info: ignoring unreachable code.
drivers/net/wireless/ath/ath9k/btcoex.c:414 ath9k_hw_btcoex_set_concur_txprio() error: buffer overflow 'stomp_txprio' 4 <= 4
fs/btrfs/extent-tree.c:2318 run_clustered_refs() warn: variable dereferenced before check 'locked_ref' (see line 2244)
drivers/net/can/usb/kvaser_usb.c:431 kvaser_usb_send_simple_msg() error: doing dma on the stack ((null))
drivers/net/can/usb/kvaser_usb.c:1073 kvaser_usb_set_opt_mode() error: doing dma on the stack ((null))
drivers/net/can/usb/kvaser_usb.c:1174 kvaser_usb_flush_queue() error: doing dma on the stack ((null))
drivers/net/can/usb/kvaser_usb.c:1384 kvaser_usb_set_bittiming() error: doing dma on the stack ((null))

[coccinelle]
drivers/vfio/vfio.c:244:2-8: preceding lock on line 239
lib/raid6/recov_avx2.c:311:48-49: name: first occurrence line 316, second occurrence line 318

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
