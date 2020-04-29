From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 29 Apr 2020 13:53:45 +0000
Subject: Re: [PATCH] drm/i915/selftests: fix error handling in __live_lrc_indirect_ctx_bb()
Message-Id: <158816842543.4620.13969605148556812046@build.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200429132425.GE815283@mwanda>
In-Reply-To: <20200429132425.GE815283@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Matthew Auld <matthew.auld@intel.com>

Quoting Dan Carpenter (2020-04-29 14:24:25)
> If intel_context_create() fails then it leads to an error pointer
> dereference.  I shuffled things around to make error handling easier.
> 
> Fixes: 1dd47b54baea ("drm/i915: Add live selftests for indirect ctx batchbuffers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/i915/gt/selftest_lrc.c | 30 +++++++++++++++-----------
>  1 file changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> index d3fa91aed7dee..c4bfad5c49dea 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> @@ -5795,26 +5795,29 @@ static int indirect_ctx_bb_check(struct intel_context *ce)
>  static int __live_lrc_indirect_ctx_bb(struct intel_engine_cs *engine)
>  {
>         struct intel_context *a, *b;
> -       int err = 0;
> +       int err;
>  
>         a = intel_context_create(engine);
> -       b = intel_context_create(engine);
> -
> +       if (IS_ERR(a))
> +               return PTR_ERR(a);
>         err = intel_context_pin(a);
>         if (err)
> -               return err;
> +               goto put_a;
>  
> -       err = intel_context_pin(b);
> -       if (err) {
> -               intel_context_put(a);
> -               return err;
> +       b = intel_context_create(engine);
> +       if (IS_ERR(b)) {
> +               err = PTR_ERR(b);
> +               goto unpin_a;
>         }
> +       err = intel_context_pin(b);
> +       if (err)
> +               goto put_b;
>  
>         /* We use the already reserved extra page in context state */
>         if (!a->wa_bb_page) {
>                 GEM_BUG_ON(b->wa_bb_page);
>                 GEM_BUG_ON(INTEL_GEN(engine->i915) = 12);
> -               goto out;
> +               goto unpin_b;
>         }
>  
>         /*
> @@ -5829,14 +5832,17 @@ static int __live_lrc_indirect_ctx_bb(struct intel_engine_cs *engine)
>  
>         err = indirect_ctx_bb_check(a);
>         if (err)
> -               goto out;
> +               goto unpin_b;
>  
>         err = indirect_ctx_bb_check(b);
> -out:
> +
> +unpin_b:
>         intel_context_unpin(b);
> +put_b:
>         intel_context_put(b);
> -
> +unpin_a:
>         intel_context_unpin(a);
> +put_a:
>         intel_context_put(a);

Onion looks correct, and there should not be any issue with this
sequence of create/pin.

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
