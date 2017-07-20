From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Thu, 20 Jul 2017 10:09:53 +0000
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: Fix an error handling path in 'mock_gem_device()'
Message-Id: <60bf1e8d-f74c-b1b8-96fa-67a1b82c0112@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170719223503.30580-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170719223503.30580-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, daniel.vetter@intel.com, jani.nikula@linux.intel.com, airlied@linux.ie, chris@chris-wilson.co.uk, tvrtko.ursulin@intel.com
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org


On 19/07/2017 23:35, Christophe JAILLET wrote:
> Goto the right label in case of error, otherwise there is a leak.
> This has been introduced by c5cf9a9147ff. In this patch a goto has not been
> updated.
> 
> Fixes: c5cf9a9147ff ("drm/i915: Create a kmem_cache to allocate struct i915_priolist from")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/gpu/drm/i915/selftests/mock_gem_device.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index 627e2aa09766..8cdec455cf7d 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -206,7 +206,7 @@ struct drm_i915_private *mock_gem_device(void)
>   	mkwrite_device_info(i915)->ring_mask = BIT(0);
>   	i915->engine[RCS] = mock_engine(i915, "mock");
>   	if (!i915->engine[RCS])
> -		goto err_dependencies;
> +		goto err_priorities;
>   
>   	i915->kernel_context = mock_context(i915, NULL);
>   	if (!i915->kernel_context)

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
