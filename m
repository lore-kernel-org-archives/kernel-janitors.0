From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Thu, 21 Feb 2019 23:30:55 +0000
Subject: Re: [PATCH -next] drm/bridge: cdns: Remove set but not used variable 'bpp'
Message-Id: <20190221233055.GI3485@pendragon.ideasonboard.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190216073459.194792-1-yuehaibing@huawei.com>
In-Reply-To: <20190216073459.194792-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

Hi YueHaibing,

Thank you for the patch.

On Sat, Feb 16, 2019 at 07:34:59AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/gpu/drm/bridge/cdns-dsi.c: In function 'cdns_dsi_bridge_enable':
> drivers/gpu/drm/bridge/cdns-dsi.c:986:6: warning:
>  variable 'bpp' set but not used [-Wunused-but-set-variable]
> 
> It never used since introduction.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/cdns-dsi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
> index 6166dca6be81..07ee1685fdfe 100644
> --- a/drivers/gpu/drm/bridge/cdns-dsi.c
> +++ b/drivers/gpu/drm/bridge/cdns-dsi.c
> @@ -785,13 +785,12 @@ static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
>  	unsigned long tx_byte_period;
>  	struct cdns_dsi_cfg dsi_cfg;
>  	u32 tmp, reg_wakeup, div;
> -	int bpp, nlanes;
> +	int nlanes;
>  
>  	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0))
>  		return;
>  
>  	mode = &bridge->encoder->crtc->state->adjusted_mode;
> -	bpp = mipi_dsi_pixel_format_to_bpp(output->dev->format);
>  	nlanes = output->dev->lanes;
>  
>  	WARN_ON_ONCE(cdns_dsi_check_conf(dsi, mode, &dsi_cfg, false));

-- 
Regards,

Laurent Pinchart
