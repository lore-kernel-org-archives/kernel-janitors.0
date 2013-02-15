From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 15 Feb 2013 17:15:18 +0000
Subject: build regressions 2013-02-15
Message-Id: <511e6d26.EJZ1ZGSy8pPz83fN%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/gpu/drm/drm_fb_cma_helper.c:392:23: error: 'dev' undeclared (first use in this function)
/c/kernel-tests/src/linux/include/linux/list_lru.h:75:1: error: expected identifier or '(' before '{' token
fs/xfs/xfs_super.c:1458:2: error: void value not ignored as it ought to be
drivers/gpu/drm/i915/i915_dma.c:1661:36: error: 'struct shrinker' has no member named 'shrink'
drivers/gpu/drm/i915/i915_dma.c:1698:36: error: 'struct shrinker' has no member named 'shrink'
fs/ubifs/super.c:52:2: error: unknown field 'shrink' specified in initializer
drivers/staging/ramster/zcache-main.c:1125:2: error: unknown field 'shrink' specified in initializer
drivers/staging/android/lowmemorykiller.c:163:2: error: unknown field 'shrink' specified in initializer
drivers/gpu/drm/i915/i915_gem.c:4200:32: error: 'struct shrinker' has no member named 'shrink'
drivers/staging/zcache/zcache-main.c:1549:2: error: unknown field 'shrink' specified in initializer
arch/ia64/kernel/topology.c:278:16: error: conflicting types for 'cache_show'
kernel/sched/fair.c:4411:6: error: 'sched_policy' undeclared (first use in this function)
kernel/sched/fair.c:4443:6: error: 'sched_policy' undeclared (first use in this function)
/c/kernel-tests/src/blackfin/include/linux/list_lru.h:75:1: error: expected identifier or '(' before '{' token
mm/huge_memory.c:233:2: error: unknown field 'shrink' specified in initializer
/c/kernel-tests/src/x86/include/linux/list_lru.h:75:1: error: expected identifier or '(' before '{' token

[warnings]
arch/arm/kernel/entry-armv.S:404:2: warning: #warning "NPTL on non MMU needs fixing" [-Wcpp]
arch/arm/kernel/entry-armv.S:867:2: warning: #warning "NPTL on non MMU needs fixing" [-Wcpp]
arch/arm/kernel/entry-armv.S:940:2: warning: #warning "NPTL on non MMU needs fixing" [-Wcpp]
/c/kernel-tests/src/linux/include/linux/memcontrol.h:396:1: warning: no return statement in function returning non-void [-Wreturn-type]
fs/xfs/xfs_super.c:1459:1: warning: control reaches end of non-void function [-Wreturn-type]
fs/ubifs/super.c:52:2: warning: initialization from incompatible pointer type [enabled by default]
fs/ubifs/super.c:52:2: warning: (near initialization for 'ubifs_shrinker_info.count_objects') [enabled by default]
drivers/staging/ramster/zcache-main.c:1125:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/staging/ramster/zcache-main.c:1125:2: warning: (near initialization for 'zcache_shrinker.count_objects') [enabled by default]
drivers/staging/android/lowmemorykiller.c:163:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/staging/android/lowmemorykiller.c:163:2: warning: (near initialization for 'lowmem_shrinker.count_objects') [enabled by default]
drivers/staging/zcache/zcache-main.c:1549:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/staging/zcache/zcache-main.c:1549:2: warning: (near initialization for 'zcache_shrinker.count_objects') [enabled by default]
WARNING: arch/powerpc/kernel/built-in.o(.text+0x244fa): Section mismatch in reference from the function .smp_release_cpus() to the variable .init.data:boot_paca.32613
WARNING: vmlinux.o(.text+0x95f8): Section mismatch in reference from the function .start_secondary_prolog() to the function .cpuinit.text:.start_secondary()
WARNING: vmlinux.o(.text+0x960c): Section mismatch in reference from the function .start_secondary_resume() to the function .cpuinit.text:.start_secondary()
/c/kernel-tests/src/blackfin/include/linux/memcontrol.h:396:1: warning: no return statement in function returning non-void [-Wreturn-type]
mm/huge_memory.c:233:2: warning: initialization from incompatible pointer type [enabled by default]
mm/huge_memory.c:233:2: warning: (near initialization for 'huge_zero_page_shrinker.count_objects') [enabled by default]
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:3787): No description found for parameter 'wiphy'
Warning(include/net/cfg80211.h:3787): Excess function parameter 'dev' description in 'cfg80211_radar_event'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
Warning(include/net/cfg80211.h:699): Enum value 'CFG80211_STA_AP_MLME_CLIENT' not described in enum 'cfg80211_station_type'
drivers/xen/xen-acpi-cpuhotplug.c:425:3: warning: initialization from incompatible pointer type [enabled by default]
drivers/xen/xen-acpi-cpuhotplug.c:425:3: warning: (near initialization for 'xen_acpi_processor_driver.ops.remove') [enabled by default]
drivers/xen/xen-acpi-memhotplug.c:417:3: warning: initialization from incompatible pointer type [enabled by default]
drivers/xen/xen-acpi-memhotplug.c:417:3: warning: (near initialization for 'xen_acpi_memory_device_driver.ops.remove') [enabled by default]
drivers/block/xen-blkback/blkback.c:902:3: warning: 'preq.dev' may be used uninitialized in this function [-Wuninitialized]
drivers/net/wireless/iwlegacy/4965-mac.c:1847:33: warning: 'phys_addr' may be used uninitialized in this function [-Wmaybe-uninitialized]
/c/kernel-tests/src/x86/include/linux/memcontrol.h:396:1: warning: no return statement in function returning non-void [-Wreturn-type]

[sparse]
drivers/i2c/busses/i2c-ismt.c:185:14: sparse: duplicate const
drivers/i2c/busses/i2c-ismt.c:238:9: sparse: incorrect type in argument 1 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:241:9: sparse: incorrect type in argument 1 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:244:9: sparse: incorrect type in argument 1 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:247:9: sparse: incorrect type in argument 1 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:250:9: sparse: incorrect type in argument 1 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:253:9: sparse: incorrect type in argument 1 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:267:9: sparse: incorrect type in argument 1 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:270:9: sparse: incorrect type in argument 1 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:273:9: sparse: incorrect type in argument 1 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:276:9: sparse: incorrect type in argument 1 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:279:9: sparse: incorrect type in argument 1 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:282:9: sparse: incorrect type in argument 1 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:302:32: sparse: incorrect type in argument 1 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:304:27: sparse: incorrect type in argument 2 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:307:32: sparse: incorrect type in argument 1 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:309:27: sparse: incorrect type in argument 2 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:619:32: sparse: incorrect type in argument 1 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:625:35: sparse: incorrect type in argument 2 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:650:45: sparse: incorrect type in argument 2 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:653:44: sparse: incorrect type in argument 2 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:656:30: sparse: incorrect type in argument 2 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:659:32: sparse: incorrect type in argument 1 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:661:28: sparse: incorrect type in argument 2 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:667:32: sparse: incorrect type in argument 1 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:676:36: sparse: incorrect type in argument 2 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:682:36: sparse: incorrect type in argument 2 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:688:36: sparse: incorrect type in argument 2 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:694:36: sparse: incorrect type in argument 2 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:702:32: sparse: incorrect type in argument 1 (different address spaces)
drivers/i2c/busses/i2c-ismt.c:866:20: sparse: incorrect type in assignment (different address spaces)
drivers/remoteproc/remoteproc_elf_loader.c:315:23: sparse: symbol 'rproc_elf_get_rsctab_addr' was not declared. Should it be static?
drivers/remoteproc/remoteproc_virtio.c:230:6: sparse: symbol 'rproc_virtio_get' was not declared. Should it be static?
drivers/remoteproc/remoteproc_virtio.c:242:6: sparse: symbol 'rproc_virtio_set' was not declared. Should it be static?
drivers/net/ethernet/intel/igb/e1000_82575.c:230:5: sparse: symbol 'igb_init_nvm_params_82575' was not declared. Should it be static?

[smatch]
drivers/extcon/extcon-max8997.c:708 max8997_muic_probe() error: we previously assumed 'pdata->muic_pdata' could be null (see line 695)

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
