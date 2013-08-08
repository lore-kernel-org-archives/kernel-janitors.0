From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 08 Aug 2013 19:57:05 +0000
Subject: build regressions 2013-08-08
Message-Id: <5203f811.q/EfsswNL9Zra3TL%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
include/linux/stddef.h:8:16: error: expected identifier or '(' before 'void'
include/linux/stddef.h:8:23: error: expected ')' before numeric constant
include/linux/stddef.h:8:16: error: expected identifier or '(' before 'void'
include/linux/stddef.h:8:23: error: expected ')' before numeric constant
fs/f2fs/f2fs.h:435:17: error: field 's_kobj' has incomplete type

[warnings]
drivers/gpu/drm/i915/intel_display.c:10426:18: warning: unused variable 'cpu_transcoder' [-Wunused-variable]
fs/ext4/extents_status.c:950:6: warning: unused variable 'ret' [-Wunused-variable]
Warning(include/drm/drm_flip_work.h:67): No description found for parameter ')'
Warning(include/drm/drm_flip_work.h:67): No description found for parameter ')'

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
