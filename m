From: Andi Shyti <andi@etezian.org>
Date: Fri, 11 Sep 2020 12:11:07 +0000
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: test the correct variable in igt_gem_ww_ctx()
Message-Id: <20200911121107.GA2330@jack.zhora.eu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200911113414.GC367487@mwanda>
In-Reply-To: <20200911113414.GC367487@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>, Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@intel.com>, Matthew Auld <matthew.auld@intel.com>

Hi Dan,

> There is a copy and paste error here.  The "obj" should be "obj2".  The
> current code could result in an Oops.
> 
> Fixes: 80f0b679d6f0 ("drm/i915: Add an implementation for i915_gem_ww_ctx locking, v2.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/i915/selftests/i915_gem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
> index 23a6132c5f4e..412e21604a05 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
> @@ -211,8 +211,8 @@ static int igt_gem_ww_ctx(void *arg)
>  		return PTR_ERR(obj);
>  
>  	obj2 = i915_gem_object_create_internal(i915, PAGE_SIZE);
> -	if (IS_ERR(obj)) {
> -		err = PTR_ERR(obj);
> +	if (IS_ERR(obj2)) {
> +		err = PTR_ERR(obj2);
>  		goto put1;
>  	}

ops...

Reviewed-by: Andi Shyti <andi.shyti@intel.com>

Thanks,
Andi
