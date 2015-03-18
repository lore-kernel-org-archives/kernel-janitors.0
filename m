From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 18 Mar 2015 08:41:06 +0000
Subject: Re: [Intel-gfx] [patch] drm/i915: memory leak in __i915_gem_vma_create()
Message-Id: <20150318084106.GE31422@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150318082158.GB10434@mwanda>
 <87k2yepuqq.fsf@intel.com>
In-Reply-To: <87k2yepuqq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Daniel Vetter <daniel.vetter@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Wed, Mar 18, 2015 at 10:36:45AM +0200, Jani Nikula wrote:
> On Wed, 18 Mar 2015, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > In the original code then if WARN_ON(i915_is_ggtt(vm) != !!ggtt_view)
> > was true then we leak "vma".  Presumably that doesn't happen often but
> > static checkers complain and this bug is easy to fix.
> >
> > Fixes: c3bbb6f2825d ('drm/i915: Do not use ggtt_view with (aliasing) PPGTT')
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Queued for -next, thanks for the patch.
-Daniel

> 
> >
> > diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
> > index f1b9ea6..cbf013f 100644
> > --- a/drivers/gpu/drm/i915/i915_gem_gtt.c
> > +++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
> > @@ -2340,12 +2340,13 @@ __i915_gem_vma_create(struct drm_i915_gem_object *obj,
> >  		      struct i915_address_space *vm,
> >  		      const struct i915_ggtt_view *ggtt_view)
> >  {
> > -	struct i915_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
> > -	if (vma = NULL)
> > -		return ERR_PTR(-ENOMEM);
> > +	struct i915_vma *vma;
> >  
> >  	if (WARN_ON(i915_is_ggtt(vm) != !!ggtt_view))
> >  		return ERR_PTR(-EINVAL);
> > +	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
> > +	if (vma = NULL)
> > +		return ERR_PTR(-ENOMEM);
> >  
> >  	INIT_LIST_HEAD(&vma->vma_link);
> >  	INIT_LIST_HEAD(&vma->mm_list);
> 
> -- 
> Jani Nikula, Intel Open Source Technology Center
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
