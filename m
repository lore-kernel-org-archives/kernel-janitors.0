From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 11 Jan 2021 13:10:02 +0000
Subject: Re: [PATCH] drm/i915/selftests: Fix some error codes
Message-Id: <161037060292.28181.5373987654669273170@build.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X/xMdcewtft7+QFM@mwanda>
In-Reply-To: <X/xMdcewtft7+QFM@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Matthew Auld <matthew.auld@intel.com>

Quoting Dan Carpenter (2021-01-11 13:02:45)
> These error paths return success instead of negative error codes as
> intended.
> 
> Fixes: c92724de6db1 ("drm/i915/selftests: Try to detect rollback during batchbuffer preemption")
> Fixes: 2d19a71ce68f ("drm/i915/selftests: Exercise long preemption chains")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/i915/gt/selftest_lrc.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> index 95d41c01d0e0..0f9fbae98158 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> @@ -2679,8 +2679,10 @@ static int create_gang(struct intel_engine_cs *engine,
>                 goto err_obj;
>  
>         cs = i915_gem_object_pin_map(obj, I915_MAP_WC);
> -       if (IS_ERR(cs))
> +       if (IS_ERR(cs)) {
> +               err = PTR_ERR(cs);
>                 goto err_obj;
> +       }
>  
>         /* Semaphore target: spin until zero */
>         *cs++ = MI_ARB_ON_OFF | MI_ARB_ENABLE;
> @@ -2707,8 +2709,10 @@ static int create_gang(struct intel_engine_cs *engine,
>         i915_gem_object_unpin_map(obj);
>  
>         rq = intel_context_create_request(ce);
> -       if (IS_ERR(rq))
> +       if (IS_ERR(rq)) {
> +               err = PTR_ERR(rq);
>                 goto err_obj;
> +       }

Smatch already caught this pair for us, thanks.

>         rq->batch = i915_vma_get(vma);
>         i915_request_get(rq);
> @@ -3264,8 +3268,10 @@ static int live_preempt_user(void *arg)
>  
>                         rq = create_gpr_client(engine, global,
>                                                NUM_GPR * i * sizeof(u32));
> -                       if (IS_ERR(rq))
> +                       if (IS_ERR(rq)) {
> +                               err = PTR_ERR(rq);
>                                 goto end_test;
> +                       }

But it hasn't yet caught this one.

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
