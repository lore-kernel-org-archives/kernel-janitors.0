From: Christoph Hellwig <hch@lst.de>
Date: Fri, 23 Oct 2020 12:19:41 +0000
Subject: Re: [PATCH] drm/i915: Fix a crash in shmem_pin_map() error handling
Message-Id: <20201023121941.GB18499@lst.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201023113401.GG282278@mwanda>
In-Reply-To: <20201023113401.GG282278@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>

On Fri, Oct 23, 2020 at 02:34:01PM +0300, Dan Carpenter wrote:
> There is a signedness bug in shmem_pin_map() error handling because "i"
> is unsigned.  The "while (--i >= 0)" will loop forever until the system
> crashes.

I actually sent a patch to Andrew before the end of the merge window
to use a for loop with a new j iterator to fix this based on your
automated report, but it looks like that didn't go in.

> Fixes: bfed6708d6c9 ("drm/i915: use vmap in shmem_pin_map")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/i915/gt/shmem_utils.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
> index f011ea42487e..7eb542018219 100644
> --- a/drivers/gpu/drm/i915/gt/shmem_utils.c
> +++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
> @@ -52,8 +52,9 @@ struct file *shmem_create_from_object(struct drm_i915_gem_object *obj)
>  void *shmem_pin_map(struct file *file)
>  {
>  	struct page **pages;
> -	size_t n_pages, i;
> +	size_t n_pages;
>  	void *vaddr;
> +	int i;
>  
>  	n_pages = file->f_mapping->host->i_size >> PAGE_SHIFT;
>  	pages = kvmalloc_array(n_pages, sizeof(*pages), GFP_KERNEL);

This assumes we never have more than INT_MAX worth of pages before
a failure. 
