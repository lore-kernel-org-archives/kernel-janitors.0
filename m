From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 13 Dec 2019 10:59:47 +0000
Subject: Re: [PATCH] drm/i915/selftests: remove a condition
Message-Id: <157623478741.2219.10541788661599243416@skylake-alporthouse-com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191213105050.y2v5nylsuxvc44jj@kili.mountain>
In-Reply-To: <20191213105050.y2v5nylsuxvc44jj@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Matthew Auld <matthew.auld@intel.com>

Quoting Dan Carpenter (2019-12-13 10:50:50)
> We know that "err" is non-zero so there is no need to check.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/i915/selftests/i915_request.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
> index 99c94b4f69fb..71a4ca38fbac 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> @@ -1086,8 +1086,7 @@ static int __live_parallel_engine1(void *arg)
>                 rq = i915_request_create(engine->kernel_context);
>                 if (IS_ERR(rq)) {
>                         err = PTR_ERR(rq);
> -                       if (err)
> -                               break;
> +                       break;

I don't know how that got there.
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
