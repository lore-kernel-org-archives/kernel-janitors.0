From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 09 Oct 2012 23:22:52 +0000
Subject: [drm-intel:drm-intel-nightly 30/30] drivers/gpu/drm/i915/intel_pm.c:3445:2: error:
Message-Id: <20121009232252.GB8107@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi Daniel,

FYI, kernel build failed on

tree:   git://people.freedesktop.org/~danvet/drm-intel.git drm-intel-nightly
head:   90adfd05fd3bd8c970bde7de4db0e4b5b9642725
commit: 90adfd05fd3bd8c970bde7de4db0e4b5b9642725 [30/30] Merge remote-tracking branch 'origin/drm-intel-fixes' into drm-intel-nightly
config: x86_64-allmodconfig

All error/warnings:

drivers/gpu/drm/i915/intel_pm.c: In function 'gen6_init_clock_gating':
drivers/gpu/drm/i915/intel_pm.c:3445:2: error: '_3D_CHICKEN3_SF_DISABLE_FASTCLIP_CULL' undeclared (first use in this function)
drivers/gpu/drm/i915/intel_pm.c:3445:2: note: each undeclared identifier is reported only once for each function it appears in

vim +3445 drivers/gpu/drm/i915/intel_pm.c

6f1d69b0 Eugeni Dodonov  2012-04-18  3439  	I915_WRITE(GEN6_UCGCTL2,
0f846f81 Jesse Barnes    2012-06-14  3440  		   GEN7_VDSUNIT_CLOCK_GATE_DISABLE |
6f1d69b0 Eugeni Dodonov  2012-04-18  3441  		   GEN6_RCPBUNIT_CLOCK_GATE_DISABLE |
6f1d69b0 Eugeni Dodonov  2012-04-18  3442  		   GEN6_RCCUNIT_CLOCK_GATE_DISABLE);
6f1d69b0 Eugeni Dodonov  2012-04-18  3443  
6f1d69b0 Eugeni Dodonov  2012-04-18  3444  	/* Bspec says we need to always set all mask bits. */
c8f1e7e2 Kenneth Graunke 2012-10-07 @3445  	I915_WRITE(_3D_CHICKEN3, (0xFFFF << 16) |
c8f1e7e2 Kenneth Graunke 2012-10-07  3446  		   _3D_CHICKEN3_SF_DISABLE_FASTCLIP_CULL);
6f1d69b0 Eugeni Dodonov  2012-04-18  3447  
6f1d69b0 Eugeni Dodonov  2012-04-18  3448  	/*

The code at line 3445 was first introduced by commit:
c8f1e7e drm/i915: Set guardband clipping workaround bit in the right register.

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
