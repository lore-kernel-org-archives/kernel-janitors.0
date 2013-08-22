From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 22 Aug 2013 16:16:50 +0000
Subject: build regressions 2013-08-22
Message-Id: <52163972.KgF7PWPWt7SlQaRh%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/staging/imx-drm/imx-tve.c:24:26: fatal error: linux/of_i2c.h: No such file or directory
sound/soc/fsl/imx-sgtl5000.c:16:26: fatal error: linux/of_i2c.h: No such file or directory
sound/soc/fsl/imx-wm8962.c:18:26: fatal error: linux/of_i2c.h: No such file or directory
ERROR: "snd_dmaengine_pcm_set_config_from_dai_data" [sound/soc/omap/snd-soc-omap.ko] undefined!
ERROR: "snd_dmaengine_pcm_open_request_chan" [sound/soc/omap/snd-soc-omap.ko] undefined!
ERROR: "snd_dmaengine_pcm_close_release_chan" [sound/soc/omap/snd-soc-omap.ko] undefined!
drivers/gpu/host1x/drm/output.c:12:26: fatal error: linux/of_i2c.h: No such file or directory
drivers/thermal/fair_share.c:85: error: invalid type argument of '->'
drivers/thermal/fair_share.c:88: error: incompatible types in assignment
drivers/gpu/drm/radeon/cik.c:5696:3: error: implicit declaration of function 'cik_update_gfx_pg' [-Werror=implicit-function-declaration]
drivers/thermal/fair_share.c:85:6: error: wrong type argument to unary exclamation mark
drivers/thermal/fair_share.c:85:26: error: invalid type argument of '->' (have 'struct thermal_zone_params')
drivers/thermal/fair_share.c:88:6: error: incompatible types when assigning to type 'const struct thermal_zone_params *' from type 'struct thermal_zone_params'
security/integrity/digsig.c:61:5: error: redefinition of 'integrity_init_keyring'
sound/pci/rme96.c:1575:2: error: implicit declaration of function 'vfree' [-Werror=implicit-function-declaration]
sound/pci/rme96.c:2490:2: error: implicit declaration of function 'vmalloc' [-Werror=implicit-function-declaration]
drivers/clk/clk-voltage-notifier.c:195:2: error: implicit declaration of function 'regulator_set_voltage_time' [-Werror=implicit-function-declaration]

[warnings]
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
Warning(include/net/mac80211.h:1503): Enum value 'IEEE80211_HW_SUPPORTS_HT_CCK_RATES' not described in enum 'ieee80211_hw_flags'
drivers/staging/dgnc/dgnc_driver.c:945:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
drivers/staging/dgnc/dgnc_tty.c:614:1: warning: the frame size of 1056 bytes is larger than 1024 bytes [-Wframe-larger-than=]
sound/pci/rme96.c:2490:33: warning: assignment makes pointer from integer without a cast [enabled by default]
sound/pci/rme96.c:2497:32: warning: assignment makes pointer from integer without a cast [enabled by default]

[sparse]
fs/nfs/nfs4proc.c:939:45: sparse: incorrect type in assignment (different base types) @@    expected char [signed] [char] <noident> @@    got restrictchar [signed] [char] <noident> @@
fs/nfs/nfs4proc.c:940:45: sparse: incorrect type in assignment (different base types) @@    expected char [signed] [char] <noident> @@    got restrictchar [signed] [char] <noident> @@
drivers/thermal/fair_share.c:85:33: sparse: cannot dereference this type
kernel/events/persistent.c:539:5: sparse: context imbalance in 'perf_event_attach' - different lock contexts for basic block

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
