From: Heiko Stuebner <heiko@sntech.de>
Date: Wed, 20 Jan 2016 23:14:25 +0000
Subject: Re: [patch] drm: rockchip: signedness bug in dw_mipi_dsi_get_lane_bps()
Message-Id: <181674264.ynnWZU1Yz8@phil>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160120095352.GA19898@mwanda>
In-Reply-To: <20160120095352.GA19898@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Chris Zhong <zyw@rock-chips.com>, linux-arm-kernel@lists.infradead.org

Hi Dan,

Am Mittwoch, 20. Januar 2016, 12:53:52 schrieb Dan Carpenter:
> "bpp" needs to be signed for the error handling to work.
> 
> Fixes: 84e05408fcfe ('drm: rockchip: Support Synopsys DW MIPI DSI')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

There's also "drm/rockchip/dsi: fix handling mipi_dsi_pixel_format_to_bpp 
result" from Andrzej Hajda from january the 14th doing the same change.


Heiko

> 
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi.c
> b/drivers/gpu/drm/rockchip/dw-mipi-dsi.c index 7bfe243..c35e5af 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi.c
> @@ -461,7 +461,8 @@ static int dw_mipi_dsi_phy_init(struct dw_mipi_dsi
> *dsi)
> 
>  static int dw_mipi_dsi_get_lane_bps(struct dw_mipi_dsi *dsi)
>  {
> -	unsigned int bpp, i, pre;
> +	int bpp;
> +	unsigned int i, pre;
>  	unsigned long mpclk, pllref, tmp;
>  	unsigned int m = 1, n = 1, target_mbps = 1000;
>  	unsigned int max_mbps = dptdin_map[ARRAY_SIZE(dptdin_map) - 
1].max_mbps;

