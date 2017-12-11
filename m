From: Mihail Atanassov <Mihail.Atanassov@arm.com>
Date: Mon, 11 Dec 2017 10:10:55 +0000
Subject: Re: [PATCH] drm: mali-dp: Uninitialized variable in malidp_se_check_scaling()
Message-Id: <8645d90e-2bc4-8f31-458f-331ce32adf82@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171209114612.yrdmsak5rhn4kheq@mwanda>
In-Reply-To: <20171209114612.yrdmsak5rhn4kheq@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: Brian Starkey <brian.starkey@arm.com>, Mali DP Maintainers <malidp@foss.arm.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, nd@arm.com

On 09/12/17 11:46, Dan Carpenter wrote:

> We use "mc" without initializing it if scaling is not necessary.
> 
> Fixes: 28ce675b7474 ("drm: mali-dp: Add plane upscaling support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
> index 33c5ef96ced0..82f9eaa5ee33 100644
> --- a/drivers/gpu/drm/arm/malidp_planes.c
> +++ b/drivers/gpu/drm/arm/malidp_planes.c
> @@ -148,6 +148,8 @@ static int malidp_se_check_scaling(struct malidp_plane *mp,
>  	if (!crtc_state)
>  		return -EINVAL;
>  
> +	mc = to_malidp_crtc_state(crtc_state);
> +
>  	clip.x2 = crtc_state->adjusted_mode.hdisplay;
>  	clip.y2 = crtc_state->adjusted_mode.vdisplay;
>  	ret = drm_atomic_helper_check_plane_state(state, crtc_state, &clip,
> @@ -166,8 +168,6 @@ static int malidp_se_check_scaling(struct malidp_plane *mp,
>  	if (mp->layer->id & (DE_SMART | DE_GRAPHICS2))
>  		return -EINVAL;
>  
> -	mc = to_malidp_crtc_state(crtc_state);
> -
>  	mc->scaled_planes_mask |= mp->layer->id;
>  	/* Defer scaling requirements calculation to the crtc check. */
>  	return 0;



Reviewed-by: Mihail Atanassov <Mihail.Atanassov@arm.com>
