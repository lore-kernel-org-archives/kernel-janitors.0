From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 12 Jul 2013 20:15:10 +0000
Subject: build regressions 2013-07-12
Message-Id: <51e063ce.wuNnCxPwaMYfqy00%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
kernel/cgroup.c:1722:24: error: 'tmp_links' undeclared (first use in this function)
drivers/gpu/drm/i915/intel_display.c:2188:2: error: 'struct drm_i915_gem_object' has no member named 'gtt_offset'
drivers/gpu/drm/i915/intel_display.c:2197:2: error: 'struct drm_i915_gem_object' has no member named 'gtt_offset'
drivers/gpu/drm/i915/i915_gem_context.c:125:3: error: implicit declaration of function 'GEN8_CXT_SOL_SIZE' [-Werror=implicit-function-declaration]
(.text+0x130ca4): undefined reference to `dmabuf_sync_ww_class'
(.text+0x130cb5): undefined reference to `dmabuf_sync_ww_class'

[warnings]
fs/reiserfs/stree.c:792:1: warning: the frame size of 1052 bytes is larger than 1024 bytes [-Wframe-larger-than=]
kernel/cgroup.c:1723:2: warning: label 'rm_base_files' defined but not used [-Wunused-label]
kernel/time/tick-sched.c:346:6: warning: unused variable 'cpu' [-Wunused-variable]

[sparse]
drivers/net/usb/r815x.c:38:16: sparse: cast to restricted __le32
drivers/net/usb/r815x.c:67:15: sparse: cast to restricted __le32
drivers/net/usb/r815x.c:69:13: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [addressable] [assigned] [usertype] tmp @@    got sable] [assigned] [usertype] tmp @@
drivers/spi/spi-xilinx.c:385:24: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const *ptr @@    got void [nodervoid const *ptr @@
drivers/spi/spi-xilinx.c:386:35: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const *ptr @@    got void [nodervoid const *ptr @@
kernel/cgroup.c:1721:31: sparse: undefined identifier 'tmp_links'

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
