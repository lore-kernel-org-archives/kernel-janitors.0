From: Jesse Barnes <jbarnes@virtuousgeek.org>
Date: Thu, 04 Oct 2012 14:46:21 +0000
Subject: Re: [drm-intel:drm-intel-fixes 15/18] drivers/gpu/drm/i915/intel_ringbuffer.c:1405:24: error:
Message-Id: <20121004094621.51eadeea@jbarnes-t420>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121003141538.GB9009@localhost>
	<20121003151217.GI5329@phenom.ffwll.local>
In-Reply-To: <20121003151217.GI5329@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Fengguang Wu <fengguang.wu@intel.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Wed, 3 Oct 2012 17:12:18 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, Oct 03, 2012 at 10:15:38PM +0800, Fengguang Wu wrote:
> > Hi Jesse,
> > 
> > FYI, kernel build failed on
> > 
> > tree:   git://people.freedesktop.org/~danvet/drm-intel.git drm-intel-fixes
> > head:   2cb47a9c6d49f2961dcf57f69ff968e65d48e876
> > commit: 307daa1b856699f1d4acc3972374017c3e99d331 [15/18] drm/i915: TLB invalidation with MI_FLUSH_DW requires a post-sync op
> > config: x86_64-allyesconfig
> 
> Thanks for the report, should be fixed now - somehow I've failed to notice
> that my .config has gone awry.

No, this is because this patch depends on the earlier patch to add the
GEM_SCRATCH_INDEX to i915_drv.h, which wasn't included in this series.
Did you pull it in from the earlier series?  Or fix it up some other
way that caused the breakage you saw?

Jesse
