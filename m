From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Date: Thu, 21 Sep 2017 14:31:58 +0000
Subject: Re: [PATCH][drm-next] drm/i915/gvt: ensure -ve return value is handled correctly
Message-Id: <1506004318.5382.4.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170919155534.25334-1-colin.king@canonical.com>
 <20170919214614.cfiolgznopouv34e@zhen-hp.sh.intel.com>
 <1505874923.2067.14.camel@perches.com>
 <20170920224406.jscthkglwfy3xhtf@zhen-hp.sh.intel.com>
In-Reply-To: <20170920224406.jscthkglwfy3xhtf@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Joe Perches <joe@perches.com>
Cc: fred gao <fred.gao@intel.com>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, Colin King <colin.king@canonical.com>, intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>

On Thu, 2017-09-21 at 06:44 +0800, Zhenyu Wang wrote:
> On 2017.09.19 19:35:23 -0700, Joe Perches wrote:
> > On Wed, 2017-09-20 at 05:46 +0800, Zhenyu Wang wrote:
> > > On 2017.09.19 16:55:34 +0100, Colin King wrote:
> > > > From: Colin Ian King <colin.king@canonical.com>
> > > > 
> > > > An earlier fix changed the return type from find_bb_size however the
> > > > integer return is being assigned to a unsigned int so the -ve error
> > > > check will never be detected. Make bb_size an int to fix this.
> > > > 
> > > > Detected by CoverityScan CID#1456886 ("Unsigned compared against 0")
> > > > 
> > > > Fixes: 1e3197d6ad73 ("drm/i915/gvt: Refine error handling for perform_bb_shadow")
> > > > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > > > ---
> > > >  drivers/gpu/drm/i915/gvt/cmd_parser.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > > > index 2c0ccbb817dc..f41cbf664b69 100644
> > > > --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > > > +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > > > @@ -1628,7 +1628,7 @@ static int perform_bb_shadow(struct parser_exec_state *s)
> > > >  	struct intel_shadow_bb_entry *entry_obj;
> > > >  	struct intel_vgpu *vgpu = s->vgpu;
> > > >  	unsigned long gma = 0;
> > > > -	uint32_t bb_size;
> > > > +	int bb_size;
> > > >  	void *dst = NULL;
> > > >  	int ret = 0;
> > > >  
> > > 
> > > Applied this, thanks!
> > 
> > Is it possible for bb_size to be both >= 2g and valid?
> 
> Never be possible in practise and if really that big I think something
> is already insane indeed.

It's good idea to document these assumptions as WARN_ON's. In i915, if
the value is completely internal to kernel, we're using GEM_BUG_ON for
these so that our CI will notice breakage. If it's not a driver
internal value only, a WARN_ON is the appropriate action.

Otherwise the information is lost and the next person reading the code
will have the same question in mind.

Regards, Joonas
-- 
Joonas Lahtinen
Open Source Technology Center
Intel Corporation
