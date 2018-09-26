From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Date: Wed, 26 Sep 2018 09:10:36 +0000
Subject: Re: [PATCH -next] drm/omap: remove set but not used variable 'frame_height'
Message-Id: <6825cc17-dc77-4aec-852d-28a1a06c2881@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536667253-5792-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536667253-5792-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, David Airlie <airlied@linux.ie>, "Andrew F. Davis" <afd@ti.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sebastian Reichel <sre@kernel.org>, Benoit Parrot <bparrot@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 11/09/18 15:00, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/gpu/drm/omapdrm/dss/dispc.c: In function 'dispc_ovl_setup_common':
> drivers/gpu/drm/omapdrm/dss/dispc.c:2627:19: warning:
>  variable 'frame_height' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/dispc.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
> index e61a959..7c23f23 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dispc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
> @@ -2624,7 +2624,7 @@ static int dispc_ovl_setup_common(struct dispc_device *dispc,
>  	unsigned int offset0, offset1;
>  	s32 row_inc;
>  	s32 pix_inc;
> -	u16 frame_width, frame_height;
> +	u16 frame_width;
>  	unsigned int field_offset = 0;
>  	u16 in_height = height;
>  	u16 in_width = width;
> @@ -2714,13 +2714,10 @@ static int dispc_ovl_setup_common(struct dispc_device *dispc,
>  	row_inc = 0;
>  	pix_inc = 0;
>  
> -	if (plane = OMAP_DSS_WB) {
> +	if (plane = OMAP_DSS_WB)
>  		frame_width = out_width;
> -		frame_height = out_height;
> -	} else {
> +	else
>  		frame_width = in_width;
> -		frame_height = height;
> -	}
>  
>  	calc_offset(screen_width, frame_width,
>  			fourcc, fieldmode, field_offset,
> 
> 
> 

Thanks, applied.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
