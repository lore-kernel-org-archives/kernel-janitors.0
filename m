From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 31 Aug 2012 08:59:18 +0000
Subject: Re: [drm-intel:drm-intel-nightly 52/52] drivers/gpu/drm/i915/i915_irq.c:1330:2: error: implicit decl
Message-Id: <20120831085918.GB10023@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120831065519.GB6761@localhost>
	<CAKMK7uH1YiyUNF=_tDYYd9g5bogaYZZacqvLNj23nrMtiGRPMw@mail.gmail.com>
In-Reply-To: <CAKMK7uH1YiyUNF=_tDYYd9g5bogaYZZacqvLNj23nrMtiGRPMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Fri, Aug 31, 2012 at 10:47:59AM +0200, Daniel Vetter wrote:
> On Fri, Aug 31, 2012 at 8:55 AM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> > Hi Daniel,
> >
> > FYI, kernel build failed on
> >
> > tree:   git://people.freedesktop.org/~danvet/drm-intel.git drm-intel-nightly
> > head:   faee69aa381f507731eb68d263dcd0d446c1fd58
> > commit: faee69aa381f507731eb68d263dcd0d446c1fd58 [52/52] Merge remote-tracking branch 'origin/drm-intel-fixes' into drm-intel-nightly
> > config: i386-randconfig-b943 (attached as .config)
> >
> > Build errors:
> >
> > drivers/gpu/drm/i915/i915_irq.c:1330:2: error: implicit declaration of function 'i915_get_extra_instdone' [-Werror=implicit-function-declaration]
> 
> Hm, seems to compile fine here and afaict the function declaration
> also exists in that file. Can you please double-check?


Daniel,

It's too late here and I'm traveling these days, I'll check it some 
time later. It may well be some bug in the build or test system. Sorry
for the noise!

Thanks,
Fengguang


> Fyi I've checked this on:
> 
> commit faee69aa381f507731eb68d263dcd0d446c1fd58
> Merge: 0e0428b 0fb8728
> Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> Date:   Thu Aug 30 11:09:53 2012 +0200
> 
>     Merge remote-tracking branch 'origin/drm-intel-fixes' into drm-intel-nightly
> 
> Thanks, Daniel
> 
> >
> > vim +1330 drivers/gpu/drm/i915/i915_irq.c
> >   1327
> >   1328          pr_err("render error detected, EIR: 0x%08x\n", eir);
> >   1329
> >> 1330          i915_get_extra_instdone(dev, instdone);
> >   1331
> >   1332          if (IS_G4X(dev)) {
> >   1333                  if (eir & (GM45_ERROR_MEM_PRIV | GM45_ERROR_CP_PRIV)) {
> >
> > ---
> > 0-DAY kernel build testing backend         Open Source Technology Centre
> > Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
> 
> 
> 
> -- 
> Daniel Vetter
> daniel.vetter@ffwll.ch - +41 (0) 79 365 57 48 - http://blog.ffwll.ch
