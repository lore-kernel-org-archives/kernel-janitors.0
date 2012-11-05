From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 05 Nov 2012 16:58:14 +0000
Subject: build regressions 2012-11-05
Message-Id: <20121105165814.GB21790@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/video/omap2/dss/dispc.c:1996:6: error: expected identifier or '(' before numeric constant
zcache-main.c:(.text+0x7f9c8): undefined reference to `zcache_debugfs_init'
arch/x86/kernel/cpu/perf_event.c:1625:3: error: implicit declaration of function 'intel_pmu_lbr_init_context' [-Werror=implicit-function-declaration]
drivers/video/omap2/omapfb/omapfb-main.c:34:23: fatal error: plat/vram.h: No such file or directory
drivers/video/omap2/omapfb/omapfb-ioctl.c:34:23: fatal error: plat/vram.h: No such file or directory
drivers/video/omap2/vram.c:36:23: fatal error: plat/vram.h: No such file or directory
(.text+0x1959d): undefined reference to `acpi_target_system_state'

[warnings]
drivers/gpu/drm/i915/i915_gem_gtt.c:38:6: warning: 'addr' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/staging/ramster/ramster/ramster.c:101:2: warning: passing argument 4 of 'debugfs_create_size_t' from incompatible pointer type [enabled by default]
WARNING: drivers/staging/ramster/zcache.o(.text+0x2f94): Section mismatch in reference from the function zcache_init() to the function .init.text:zbud_init()
mm/slub.c:1934:1: warning: 'unfreeze_partials' uses dynamic stack allocation [enabled by default]
mm/slub.c:1870:1: warning: 'deactivate_slab' uses dynamic stack allocation [enabled by default]
mm/slub.c:2569:1: warning: '__slab_free' uses dynamic stack allocation [enabled by default]
mm/slub.c:1577:1: warning: 'get_partial_node.isra.37' uses dynamic stack allocation [enabled by default]
mm/slub.c:2305:1: warning: '__slab_alloc.constprop.45' uses dynamic stack allocation [enabled by default]
drivers/staging/ramster/zcache-main.c:357:2: warning: format '%u' expects argument of type 'unsigned int', but argument 2 has type 'ssize_t' [-Wformat]
ipc/msg.c:778:5: warning: 'copy_number' may be used uninitialized in this function [-Wmaybe-uninitialized]
ipc/msg.c:968:12: warning: 'copy' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/cifs/dir.c:408:3: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]

[sparse]
drivers/gpu/drm/i915/i915_gem_gtt.c:366:36: sparse: dereference of noderef expression
drivers/scsi/hptiop.c:252:44: sparse: incorrect type in assignment (different base types)
drivers/scsi/hptiop.c:461:64: sparse: incorrect type in initializer (different address spaces)
drivers/scsi/hptiop.c:949:34: sparse: incompatible types for operation (++)
fs/fat/nfs.c:105:1: sparse: symbol 'fat_encode_fh_nostale' was not declared. Should it be static?
fs/fat/nfs.c:159:15: sparse: symbol 'fat_fh_to_dentry_nostale' was not declared. Should it be static?
fs/fat/nfs.c:206:15: sparse: symbol 'fat_fh_to_parent_nostale' was not declared. Should it be static?
fs/cifs/dir.c:408:17: sparse: mixing declarations and code
drivers/video/omap2/vram.c:36:11: sparse: unable to open 'plat/vram.h'
drivers/video/omap2/dss/dispc.c:1997:13: sparse: missing identifier in declaration
drivers/video/omap2/displays/panel-acx565akm.c:204:23: sparse: cast to restricted __be32
drivers/video/omap2/omapfb/omapfb-main.c:34:11: sparse: unable to open 'plat/vram.h'
drivers/video/omap2/omapfb/omapfb-ioctl.c:34:11: sparse: unable to open 'plat/vram.h'
drivers/video/omap2/dss/dispc.c:2002:13: sparse: Expected ; at the end of type declaration
drivers/video/omap2/dss/dispc.c:2002:13: sparse: got 7
drivers/video/omap2/dss/manager-sysfs.c:70:17: sparse: undefined identifier '__func__'

[smatch]
mm/cleancache.c:163 get_poolid_from_fake() error: buffer overflow 'fs_poolid_map' 32 <= 999
mm/cleancache.c:311 __cleancache_invalidate_fs() error: buffer overflow 'fs_poolid_map' 32 <= 999
ipc/msg.c:878 do_msgrcv() error: we previously assumed 'msg' could be null (see line 865)
include/linux/bitops.h:164 fls_long() info: ignoring unreachable code.

[coccinelle]
drivers/staging/ramster/tmem.c:647:1-7: preceding lock on line 613
drivers/video/backlight/lm3639_bl.c:406:1-3: ERROR: test of a variable/field address

[cppcheck]
drivers/staging/ramster/ramster/ramster.c:49: error: "ramster needs sysfs to define cluster nodes to use"

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
