From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 16 Oct 2012 07:24:32 +0000
Subject: Re: [drm-intel:drm-intel-next-queued 42/44] drivers/gpu/drm/i915/intel_pm.c:2506:2: error: 'ret' und
Message-Id: <20121016072432.GE5753@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121016005951.GA6855@localhost>
In-Reply-To: <20121016005951.GA6855@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Ben Widawsky <ben@bwidawsk.net>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Tue, Oct 16, 2012 at 08:59:51AM +0800, Fengguang Wu wrote:
> Hi Ben,
> 
> FYI, kernel build failed on
> 
> tree:   git://people.freedesktop.org/~danvet/drm-intel.git drm-intel-next-queued
> head:   861b675336a1f686f480d92990251e99a3ec0956
> commit: 686279dbcbc69f71ce86efdccaa8cad762cba2ea [42/44] drm/i915: Extract PCU communication
> config: x86_64-allyesconfig # make ARCH=x86_64 allyesconfig
> 
> All error/warnings:
> 
> drivers/gpu/drm/i915/intel_pm.c: In function 'gen6_enable_rps':
> drivers/gpu/drm/i915/intel_pm.c:2506:2: error: 'ret' undeclared (first use in this function)
> drivers/gpu/drm/i915/intel_pm.c:2506:2: note: each undeclared identifier is reported only once for each function it appears in
> 
> vim +2506 drivers/gpu/drm/i915/intel_pm.c
> 
> 89ba829e Jesse Barnes   2012-05-22  2500  		   GEN6_RP_MEDIA_HW_NORMAL_MODE |
> 2b4e57bd Eugeni Dodonov 2012-04-18  2501  		   GEN6_RP_MEDIA_IS_GFX |
> 2b4e57bd Eugeni Dodonov 2012-04-18  2502  		   GEN6_RP_ENABLE |
> 2b4e57bd Eugeni Dodonov 2012-04-18  2503  		   GEN6_RP_UP_BUSY_AVG |
> 5a7dc92a Eugeni Dodonov 2012-07-02  2504  		   (IS_HASWELL(dev) ? GEN7_RP_DOWN_IDLE_AVG : GEN6_RP_DOWN_IDLE_CONT));
> 2b4e57bd Eugeni Dodonov 2012-04-18  2505  
> 686279db Ben Widawsky   2012-09-26 @2506  	ret = sandybridge_pcode_write(dev_priv, GEN6_PCODE_WRITE_MIN_FREQ_TABLE, 0);
> 686279db Ben Widawsky   2012-09-26  2507  	if (!ret) {
> 686279db Ben Widawsky   2012-09-26  2508  		pcu_mbox = 0;
> 686279db Ben Widawsky   2012-09-26  2509  		ret = sandybridge_pcode_read(dev_priv, GEN6_READ_OC_PARAMS, &pcu_mbox);

Fixed up, thanks a lot for the report.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
