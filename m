From: Jyri Sarha <jsarha@ti.com>
Date: Thu, 27 Feb 2020 10:00:53 +0000
Subject: Re: [PATCH][next][V2] drm/tidss: fix spelling mistakes "bufer" and "requsted"
Message-Id: <61a9d7f0-ad42-b347-4a4c-0e5cd0deb11c@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200224174226.387874-1-colin.king@canonical.com>
In-Reply-To: <20200224174226.387874-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 24/02/2020 19:42, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are two spelling mistakes in warning and debug messages.
> Fix them.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Jyri Sarha <jsarha@ti.com>
Tested-by: Jyri Sarha <jsarha@ti.com>

I'll merge this to drm-misc-next tomorrow.

Thank you for the patch,
Jyri


> ---
> 
> V2: Add spelling mistake fix for "requsted"
> 
> ---
>  drivers/gpu/drm/tidss/tidss_dispc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index eeb160dc047b..b3dc83d2f668 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -1235,7 +1235,7 @@ int dispc_vp_set_clk_rate(struct dispc_device *dispc, u32 hw_videoport,
>  
>  	if (dispc_pclk_diff(rate, new_rate) > 5)
>  		dev_warn(dispc->dev,
> -			 "vp%d: Clock rate %lu differs over 5%% from requsted %lu\n",
> +			 "vp%d: Clock rate %lu differs over 5%% from requested %lu\n",
>  			 hw_videoport, new_rate, rate);
>  
>  	dev_dbg(dispc->dev, "vp%d: new rate %lu Hz (requested %lu Hz)\n",
> @@ -1699,7 +1699,7 @@ static int dispc_vid_calc_scaling(struct dispc_device *dispc,
>  
>  		if (sp->xinc > f->xinc_max) {
>  			dev_dbg(dispc->dev,
> -				"%s: Too wide input bufer %u > %u\n", __func__,
> +				"%s: Too wide input buffer %u > %u\n", __func__,
>  				state->src_w >> 16, in_width_max * f->xinc_max);
>  			return -EINVAL;
>  		}
> 


-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
