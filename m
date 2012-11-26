From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 26 Nov 2012 17:07:43 +0000
Subject: build regressions 2012-11-26
Message-Id: <50b3a1df.mOU5z7tdv5V8fZiZ%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
of_iommu.c:(.text+0x114dbc): undefined reference to `__aeabi_uldivmod'
arch/arm/mach-omap2/timer.c:195:3: error: implicit declaration of function 'prom_add_property' [-Werror=implicit-function-declaration]
drivers/net/ethernet/ti/cpts.c:30:24: fatal error: plat/clock.h: No such file or directory
net/mac80211/mlme.c:1868:3: error: 'ifmgd' undeclared (first use in this function)
drivers/mfd/da9052-i2c.c:63:5: error: redefinition of 'da9052_i2c_fix'

[warnings]
drivers/media/platform/soc_camera/mx3_camera.c:1134:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/media/platform/soc_camera/mx3_camera.c:1134:2: warning: (near initialization for 'mx3_soc_camera_host_ops.set_crop') [enabled by default]
warning: (NET_DSA_TAG_DSA && NET_DSA_TAG_EDSA && NET_DSA_TAG_TRAILER) selects NET_DSA which has unmet direct dependencies (NET && EXPERIMENTAL && NETDEVICES && !S390)

[sparse]
drivers/gpu/drm/qxl/qxl_debugfs.c:109:42: sparse: Using plain integer as NULL pointer

[smatch]
net/wireless/nl80211.c:3728 nl80211_set_bss() info: why not propagate 'params.p2p_ctwindow' from nla_get_s8() instead of -22?

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
