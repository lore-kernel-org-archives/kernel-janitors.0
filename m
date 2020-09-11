From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Fri, 11 Sep 2020 13:02:28 +0000
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: test the correct variable in igt_gem_ww_ctx()
Message-Id: <2c117e1e-2d51-a649-62df-7f9034dfe6cd@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200911113414.GC367487@mwanda>
In-Reply-To: <20200911113414.GC367487@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>, =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@intel.com>, Matthew Auld <matthew.auld@intel.com>


On 11/09/2020 12:34, Dan Carpenter wrote:
> There is a copy and paste error here.  The "obj" should be "obj2".  The
> current code could result in an Oops.
> 
> Fixes: 80f0b679d6f0 ("drm/i915: Add an implementation for i915_gem_ww_ctx locking, v2.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/gpu/drm/i915/selftests/i915_gem.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
> index 23a6132c5f4e..412e21604a05 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
> @@ -211,8 +211,8 @@ static int igt_gem_ww_ctx(void *arg)
>   		return PTR_ERR(obj);
>   
>   	obj2 = i915_gem_object_create_internal(i915, PAGE_SIZE);
> -	if (IS_ERR(obj)) {
> -		err = PTR_ERR(obj);
> +	if (IS_ERR(obj2)) {
> +		err = PTR_ERR(obj2);
>   		goto put1;
>   	}
>   
> 
Oopsie I did point this out in review! (msgid 
c03481f1-92c2-24ad-b56e-a92fbb70f9fe@linux.intel.com)

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
