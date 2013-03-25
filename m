From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 25 Mar 2013 04:27:38 +0000
Subject: build regressions 2013-03-24
Message-Id: <514fd23a.RHGYr0ziB5EBWWG0%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/mach-tegra/cpu-tegra.c:131:28: error: 'policy' undeclared (first use in this function)
fs/nfs/nfs4proc.c:111:3: error: expected ':' or '...' before 'return'
include/linux/mfd/winbond_superio.h:60:20: error: inlining failed in call to always_inline 'winbond_superio_enter': function body not available
drivers/watchdog/winbond_wdt.c:61:23: error: called from here
include/linux/mfd/winbond_superio.h:61:20: error: inlining failed in call to always_inline 'winbond_superio_exit': function body not available
drivers/watchdog/winbond_wdt.c:64:22: error: called from here
include/linux/mfd/winbond_superio.h:60:20: error: inlining failed in call to always_inline 'winbond_superio_enter': function body not available
drivers/watchdog/winbond_wdt.c:131:23: error: called from here
include/linux/mfd/winbond_superio.h:61:20: error: inlining failed in call to always_inline 'winbond_superio_exit': function body not available
drivers/watchdog/winbond_wdt.c:235:22: error: called from here
drivers/gpu/drm/i915/i915_drv.c:131:5: error: redefinition of 'i915_disable_power_well'
drivers/gpu/drm/i915/i915_drv.c:132:60: error: redefinition of '__check_disable_power_well'
drivers/gpu/drm/i915/i915_drv.c:132:145: error: redefinition of '__param_perm_check_disable_power_well'
drivers/gpu/drm/i915/i915_drv.c:132:388: error: redefinition of '__param_str_disable_power_well'
drivers/gpu/drm/i915/i915_drv.c:132:489: error: redefinition of '__param_disable_power_well'

[warnings]
drivers/vhost/tcm_vhost.c:871:1: warning: label 'err_dev' defined but not used [-Wunused-label]

[sparse]
drivers/cpufreq/cpufreq.c:247:6: sparse: symbol '__cpufreq_notify_transition' was not declared. Should it be static?
fs/nfs/nfs4proc.c:111:17: sparse: Expected : after default/case
fs/nfs/nfs4proc.c:111:17: sparse: got return

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
