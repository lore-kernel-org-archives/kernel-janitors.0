From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Date: Thu, 24 Jan 2019 02:03:30 +0000
Subject: Re: drm/komeda: Off by one in komeda_fb_get_pixel_addr()
Message-Id: <20190124020316.GA26717@james-ThinkStation-P300>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190123093755.GA26018@kadam>
In-Reply-To: <20190123093755.GA26018@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, nd <nd@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>

On Wed, Jan 23, 2019 at 12:37:55PM +0300, Dan Carpenter wrote:
> The > should be >= to avoid an off by one bug.
> 
> Fixes: c46c24bb6b11 ("drm/komeda: Add komeda_framebuffer")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> 
> I'm 98% sure this is correct, but please review it carefully because I'm
> not 100% positive.

Hi Dan:

Thank you, this is a typo and your fix is correct.

Reviewed-by: James Qian Wang (Arm Technology China) <james.qian.wang@arm.com>

Best Regards
James.

> 
>  drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
> index 4ddd5314ca23..23ee74d42239 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
> @@ -144,7 +144,7 @@ komeda_fb_get_pixel_addr(struct komeda_fb *kfb, int x, int y, int plane)
>  	const struct drm_gem_cma_object *obj;
>  	u32 plane_x, plane_y, cpp, pitch, offset;
>  
> -	if (plane > fb->format->num_planes) {
> +	if (plane >= fb->format->num_planes) {
>  		DRM_DEBUG_KMS("Out of max plane num.\n");
>  		return -EINVAL;
>  	}
