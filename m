From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 29 Sep 2012 11:34:39 +0000
Subject: [calxeda:ubuntu-quantal 94/299] drivers/gpu/drm/i915/i915_sysfs.c:105:16: error: 'GEN7_L3LOG_SIZE'
Message-Id: <20120929113439.GA8674@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Tim,

FYI, kernel build failed on

tree:   git://sources.calxeda.com/kernel/linux.git ubuntu-quantal
head:   c07f1571f9b6e609109d50bd6ba2b2547e873614
commit: f22af270b676180993593f98bd23a51b9fc910d0 [94/299] drm/i915: l3 parity sysfs interface
config: x86_64-allmodconfig

These errors are then fixed by some later commit and only hurts bisectability.
If you don't care about bisectability of your tree, please let me know. Thanks!

All error/warnings:

drivers/gpu/drm/i915/i915_sysfs.c: In function 'l3_access_valid':
drivers/gpu/drm/i915/i915_sysfs.c:105:16: error: 'GEN7_L3LOG_SIZE' undeclared (first use in this function)
drivers/gpu/drm/i915/i915_sysfs.c:105:16: note: each undeclared identifier is reported only once for each function it appears in
drivers/gpu/drm/i915/i915_sysfs.c: In function 'i915_l3_read':
drivers/gpu/drm/i915/i915_sysfs.c:134:37: error: 'GEN7_L3LOG_SIZE' undeclared (first use in this function)
drivers/gpu/drm/i915/i915_sysfs.c:135:30: error: 'GEN7_L3LOG_BASE' undeclared (first use in this function)
drivers/gpu/drm/i915/i915_sysfs.c: In function 'i915_l3_write':
drivers/gpu/drm/i915/i915_sysfs.c:164:19: error: 'struct <anonymous>' has no member named 'l3_remap_info'
drivers/gpu/drm/i915/i915_sysfs.c:165:18: error: 'GEN7_L3LOG_SIZE' undeclared (first use in this function)
drivers/gpu/drm/i915/i915_sysfs.c:184:15: error: 'struct <anonymous>' has no member named 'l3_remap_info'
drivers/gpu/drm/i915/i915_sysfs.c:186:21: error: 'struct <anonymous>' has no member named 'l3_remap_info'
drivers/gpu/drm/i915/i915_sysfs.c:190:2: error: implicit declaration of function 'i915_gem_l3_remap' [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/i915_sysfs.c: At top level:
drivers/gpu/drm/i915/i915_sysfs.c:199:10: error: 'GEN7_L3LOG_SIZE' undeclared here (not in a function)
cc1: some warnings being treated as errors

vim +105 drivers/gpu/drm/i915/i915_sysfs.c

f22af270 (Ben Widawsky 2012-05-25   99) 	if (!IS_IVYBRIDGE(dev))
f22af270 (Ben Widawsky 2012-05-25  100) 		return -EPERM;
f22af270 (Ben Widawsky 2012-05-25  101) 
f22af270 (Ben Widawsky 2012-05-25  102) 	if (offset % 4 != 0)
f22af270 (Ben Widawsky 2012-05-25  103) 		return -EINVAL;
f22af270 (Ben Widawsky 2012-05-25  104) 
f22af270 (Ben Widawsky 2012-05-25 @105) 	if (offset >= GEN7_L3LOG_SIZE)
f22af270 (Ben Widawsky 2012-05-25  106) 		return -ENXIO;
f22af270 (Ben Widawsky 2012-05-25  107) 
f22af270 (Ben Widawsky 2012-05-25  108) 	return 0;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
