From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 01 Sep 2013 19:19:51 +0000
Subject: build regressions 2013-09-01
Message-Id: <52239357.vAbgDdF6hxsRgqGf%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
sysctl_net.c:(.text+0x3454c): undefined reference to `snmp_mib_free'
ERROR: "nouveau_switcheroo_optimus_dsm" [drivers/gpu/drm/nouveau/nouveau.ko] undefined!
(.text+0x4ca7d): undefined reference to `snmp_mib_free'
fs/fat/file.c:166:20: error: 'struct dentry' has no member named 'd_count'
fs/dcache.c:840:12: error: 'struct dentry' has no member named 'd_count'
drivers/net/vxlan.c:1352:3: error: implicit declaration of function 'csum_ipv6_magic' [-Werror=implicit-function-declaration]
kernel/rcutree.c:661:48: error: request for member 'dynticks' in something not a structure or union
drivers/input/serio/opencores_ps2.c:113:2: error: implicit declaration of function 'platform_get_resource' [-Werror=implicit-function-declaration]
drivers/input/serio/opencores_ps2.c:119:2: error: implicit declaration of function 'platform_get_irq' [-Werror=implicit-function-declaration]
drivers/input/serio/opencores_ps2.c:126:35: error: dereferencing pointer to incomplete type
drivers/input/serio/opencores_ps2.c:142:10: error: dereferencing pointer to incomplete type
drivers/input/serio/opencores_ps2.c:146:16: error: dereferencing pointer to incomplete type
drivers/input/serio/opencores_ps2.c:154:35: error: dereferencing pointer to incomplete type
drivers/input/serio/opencores_ps2.c:155:45: error: dereferencing pointer to incomplete type
drivers/input/serio/opencores_ps2.c:157:45: error: dereferencing pointer to incomplete type
drivers/input/serio/opencores_ps2.c:161:2: error: implicit declaration of function 'platform_set_drvdata' [-Werror=implicit-function-declaration]
drivers/input/serio/opencores_ps2.c:178:9: error: implicit declaration of function 'platform_get_drvdata' [-Werror=implicit-function-declaration]
drivers/input/serio/opencores_ps2.c:194:15: error: variable 'ocps2_driver' has initializer but incomplete type
drivers/input/serio/opencores_ps2.c:195:2: error: unknown field 'probe' specified in initializer
drivers/input/serio/opencores_ps2.c:196:2: error: unknown field 'remove' specified in initializer
drivers/input/serio/opencores_ps2.c:197:2: error: unknown field 'driver' specified in initializer
drivers/input/serio/opencores_ps2.c:197:2: error: extra brace group at end of initializer
drivers/input/serio/opencores_ps2.c:206:2: error: implicit declaration of function 'platform_driver_register' [-Werror=implicit-function-declaration]
drivers/input/serio/opencores_ps2.c:211:2: error: implicit declaration of function 'platform_driver_unregister' [-Werror=implicit-function-declaration]
drivers/spi/spi_opencores.c:22:25: fatal error: asm/cpuinfo.h: No such file or directory

[warnings]
drivers/staging/imx-drm/ipuv3-crtc.c:158:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/staging/imx-drm/ipuv3-crtc.c:158:2: warning: (near initialization for 'ipu_crtc_funcs.page_flip') [enabled by default]
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
Warning(include/net/cfg80211.h:446): No description found for parameter 'c'
Warning(include/net/cfg80211.h:446): Excess function parameter 'chandef' description in 'cfg80211_chandef_dfs_required'
drivers/input/serio/opencores_ps2.c:101:31: warning: 'struct platform_device' declared inside parameter list [enabled by default]
drivers/input/serio/opencores_ps2.c:101:31: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
drivers/input/serio/opencores_ps2.c:113:12: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/input/serio/opencores_ps2.c:176:32: warning: 'struct platform_device' declared inside parameter list [enabled by default]
drivers/input/serio/opencores_ps2.c:178:31: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/input/serio/opencores_ps2.c:195:2: warning: excess elements in struct initializer [enabled by default]
drivers/input/serio/opencores_ps2.c:195:2: warning: (near initialization for 'ocps2_driver') [enabled by default]
drivers/input/serio/opencores_ps2.c:196:2: warning: excess elements in struct initializer [enabled by default]
drivers/input/serio/opencores_ps2.c:196:2: warning: (near initialization for 'ocps2_driver') [enabled by default]
drivers/input/serio/opencores_ps2.c:201:2: warning: excess elements in struct initializer [enabled by default]
drivers/input/serio/opencores_ps2.c:201:2: warning: (near initialization for 'ocps2_driver') [enabled by default]

[sparse]
drivers/net/vxlan.c:1585:34: sparse: incorrect type in assignment (different base types) @@    expected unsigned char [unsigned] [addressable] [assigned] [usertype] flowic_proto @@    got sable] [assigned] [usertype] flowic_proto @@
kernel/rcutree.c:661:55: sparse: expected structure or union

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
