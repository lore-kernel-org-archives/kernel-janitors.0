From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 28 May 2013 01:46:47 +0000
Subject: build regressions 2013-05-27
Message-Id: <51a40c87.OL0BCIuNuBQp29rk%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
clkdev.c:(.text+0xb4730): undefined reference to `shdma_chan_filter'
dwc3-omap.c:(.text+0x105078): undefined reference to `extcon_unregister_interest'
dwc3-omap.c:(.text+0x105080): undefined reference to `extcon_unregister_interest'
dwc3-omap.c:(.text+0x10516e): undefined reference to `extcon_get_extcon_dev'
dwc3-omap.c:(.text+0x1051f1): undefined reference to `extcon_register_interest'
dwc3-omap.c:(.text+0x10520e): undefined reference to `extcon_register_interest'
ERROR: "extcon_register_interest" undefined!
ERROR: "extcon_unregister_interest" undefined!
net/wireless/core.h:99:18: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:101:29: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:102:20: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:103:19: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:104:17: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:105:17: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:106:27: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:107:19: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:108:19: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.c:666:17: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:99:18: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:101:29: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:102:20: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:103:19: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:104:17: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:105:17: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:106:27: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:107:19: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:108:19: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/sysfs.c:103:19: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/sysfs.c:106:40: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:99:18: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:101:29: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:102:20: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:103:19: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:104:17: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:105:17: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:106:27: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:107:19: error: 'struct wiphy' has no member named 'wowlan_config'
net/wireless/core.h:108:19: error: 'struct wiphy' has no member named 'wowlan_config'
(.text+0x13bed2): undefined reference to `v4l2_subdev_init'
(.text+0x13c00d): undefined reference to `v4l2_device_register_subdev'
crct10dif.c:(.text+0x2a985): undefined reference to `crc_t10dif_generic'
crct10dif.c:(.text+0x2a9a3): undefined reference to `crc_t10dif_generic'
crct10dif.c:(.text+0x2a9c2): undefined reference to `crc_t10dif_generic'
r820t.c:(.text+0xdf2cf): undefined reference to `byte_rev_table'

[warnings]
net/ipv4/ping.c:533:9: warning: 'code' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ipv4/ping.c:505:3: warning: 'type' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ipv4/ping.c:486:2: warning: 'icmph' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ipv4/ping.c:663:2: warning: 'type' may be used uninitialized in this function [-Wuninitialized]
net/ipv4/ping.c:449:63: warning: 'code' may be used uninitialized in this function [-Wmaybe-uninitialized]

[coccinelle]
drivers/extcon/extcon-palmas.c:207:2-41: duplicated argument to & or |

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
