From: Colin Ian King <colin.king@canonical.com>
Date: Mon, 24 Feb 2020 17:38:02 +0000
Subject: NAK: [PATCH][next] drm/tidss: fix spelling mistake "bufer" -> "buffer"
Message-Id: <d903c16f-f6b4-fda4-911d-0613390f0854@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200224151530.360369-1-colin.king@canonical.com>
In-Reply-To: <20200224151530.360369-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 24/02/2020 15:15, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_dbg message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/tidss/tidss_dispc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index eeb160dc047b..d49f2d6d57df 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
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
Please ignore this, I've found another mistake. I'll send a V2 shortly.
