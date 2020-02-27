From: Jyri Sarha <jsarha@ti.com>
Date: Thu, 27 Feb 2020 10:01:26 +0000
Subject: Re: [PATCH -next] drm/tidss: Drop pointless static qualifier in dispc_find_csc()
Message-Id: <06fb1070-9c4c-c776-6379-fe27b0a7b220@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200227065057.92766-1-yuehaibing@huawei.com>
In-Reply-To: <20200227065057.92766-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

On 27/02/2020 08:50, YueHaibing wrote:
> There is no need to have the 'const struct dispc_csc_coef *coef'
> variable static since new value always be assigned before use it.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Jyri Sarha <jsarha@ti.com>
Tested-by: Jyri Sarha <jsarha@ti.com>

I'll merge this to drm-misc-next tomorrow.

Thank you for the patch,
Jyri


> ---
>  drivers/gpu/drm/tidss/tidss_dispc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index eeb160dc047b..e6cb176484a9 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -1510,7 +1510,7 @@ struct dispc_csc_coef *dispc_find_csc(enum drm_color_encoding encoding,
>  static void dispc_vid_csc_setup(struct dispc_device *dispc, u32 hw_plane,
>  				const struct drm_plane_state *state)
>  {
> -	static const struct dispc_csc_coef *coef;
> +	const struct dispc_csc_coef *coef;
>  
>  	coef = dispc_find_csc(state->color_encoding, state->color_range);
>  	if (!coef) {
> 
> 
> 
> 
> 


-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
