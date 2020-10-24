From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 24 Oct 2020 13:47:52 +0000
Subject: Re: [PATCH] drm/i915: Fix a crash in shmem_pin_map() error handling
Message-Id: <20201024134752.GF18329@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201023113401.GG282278@mwanda>
 <20201023121941.GB18499@lst.de>
In-Reply-To: <20201023121941.GB18499@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Andrew Morton <akpm@linux-foundation.org>

On Fri, Oct 23, 2020 at 02:19:41PM +0200, Christoph Hellwig wrote:
> > diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
> > index f011ea42487e..7eb542018219 100644
> > --- a/drivers/gpu/drm/i915/gt/shmem_utils.c
> > +++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
> > @@ -52,8 +52,9 @@ struct file *shmem_create_from_object(struct drm_i915_gem_object *obj)
> >  void *shmem_pin_map(struct file *file)
> >  {
> >  	struct page **pages;
> > -	size_t n_pages, i;
> > +	size_t n_pages;
> >  	void *vaddr;
> > +	int i;
> >  
> >  	n_pages = file->f_mapping->host->i_size >> PAGE_SHIFT;
> >  	pages = kvmalloc_array(n_pages, sizeof(*pages), GFP_KERNEL);
> 
> This assumes we never have more than INT_MAX worth of pages before
> a failure. 

Doh.  Yeah.  My bad.

regards,
dan carpenter
