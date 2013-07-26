From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 26 Jul 2013 17:00:18 +0000
Subject: build regressions 2013-07-26
Message-Id: <51f2ab22.u+ijDeFLyGhDxm13%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/staging/gdm724x/gdm_endian.h:43:6: error: conflicting types for 'set_endian'
drivers/staging/gdm724x/gdm_endian.h:43:6: error: conflicting types for 'set_endian'
drivers/staging/gdm724x/gdm_endian.c:17:6: error: conflicting types for 'set_endian'

[warnings]
drivers/media/pci/cx18/cx18-driver.c:357:1: warning: the frame size of 1060 bytes is larger than 1024 bytes [-Wframe-larger-than=]
include/trace/events/power.h:87:17: warning: initialization discards 'const' qualifier from pointer target type [enabled by default]
include/trace/events/power.h:88:17: warning: initialization discards 'const' qualifier from pointer target type [enabled by default]
include/trace/events/power.h:87:17: warning: initialization discards 'const' qualifier from pointer target type [enabled by default]
include/trace/events/power.h:88:17: warning: initialization discards 'const' qualifier from pointer target type [enabled by default]

[sparse]
include/trace/events/power.h:69:1: sparse: incorrect type in initializer (different modifiers) @@    expected char *tmp_p @@    got char cchar *tmp_p @@
include/trace/events/power.h:69:1: sparse: incorrect type in initializer (different modifiers) @@    expected char *tmp_i @@    got char cchar *tmp_i @@
include/trace/events/power.h:69:1: sparse: incorrect type in initializer (different modifiers) @@    expected char *tmp_p @@    got char cchar *tmp_p @@
include/trace/events/power.h:69:1: sparse: incorrect type in initializer (different modifiers) @@    expected char *tmp_i @@    got char cchar *tmp_i @@
drivers/pnp/driver.c:223:25: sparse: symbol 'pnp_bus_dev_pm_ops' was not declared. Should it be static?
drivers/gpu/drm/radeon/rv6xx_dpm.c:2093:5: sparse: symbol 'rv6xx_dpm_force_performance_level' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
