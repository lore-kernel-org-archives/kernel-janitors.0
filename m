From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 14 Jul 2020 17:15:22 +0000
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/selftest: Fix an error code in live_noa_gpr()
Message-Id: <159474692212.3188.5286642208247298191@build.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200714143652.GA337376@mwanda>
 <29d5e25e-45e1-fca0-7d09-fd5e303b9eea@intel.com>
In-Reply-To: <29d5e25e-45e1-fca0-7d09-fd5e303b9eea@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jani Nikula <jani.nikula@linux.intel.com>, Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org

Quoting Lionel Landwerlin (2020-07-14 15:39:21)
> On 14/07/2020 17:36, Dan Carpenter wrote:
> > The error code needs to be set on this path.  It currently returns
> > success.
> >
> > Fixes: ed2690a9ca89 ("drm/i915/selftest: Check that GPR are restored across noa_wait")
> > Reported-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > v2: Fix a different bug instead.  :P  Colin fixed mine already.

I was thinking that Colin already sent the patch for this one...

> >
> >   drivers/gpu/drm/i915/selftests/i915_perf.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/i915/selftests/i915_perf.c b/drivers/gpu/drm/i915/selftests/i915_perf.c
> > index 0aa151501fb3..c232194c60a2 100644
> > --- a/drivers/gpu/drm/i915/selftests/i915_perf.c
> > +++ b/drivers/gpu/drm/i915/selftests/i915_perf.c
> > @@ -358,6 +358,7 @@ static int live_noa_gpr(void *arg)
> >               cs = intel_ring_begin(rq, 4);
> >               if (IS_ERR(cs)) {
> >                       i915_request_add(rq);
> > +                     err = PTR_ERR(cs);
> >                       goto out_rq;
> >               }
> >   
> 
> Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

Ta,
-Chris
