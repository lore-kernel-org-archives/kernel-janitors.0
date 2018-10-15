From: Andrzej Hajda <a.hajda@samsung.com>
Date: Mon, 15 Oct 2018 07:47:30 +0000
Subject: Re: [PATCH] drm/exynos: checking for NULL instead of IS_ERR()
Message-Id: <20181015074732eucas1p2b5da071e315bcfe1d9d97c9e885190f4~duKGtwV283138531385eucas1p2j@eucas1p2.samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181013102140.GB16086@mwanda>
 <CGME20181015074732eucas1p2b5da071e315bcfe1d9d97c9e885190f4@eucas1p2.samsung.com>
In-Reply-To: <20181013102140.GB16086@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Inki Dae <inki.dae@samsung.com>, Maciej Purski <m.purski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org

On 13.10.2018 12:21, Dan Carpenter wrote:
> The of_drm_find_panel() function returns error pointers and never NULL
> but we the driver assumes that ->panel is NULL when it's not present.
> 
> Fixes: 6afb7721e2a0 ("drm/exynos: move connector creation to attach callback")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for spotting it (and sorry for previous reply mistake).

Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

 --
Regards
Andrzej


> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 07af7758066d..32f256749789 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1527,7 +1527,9 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>  		}
>  
>  		dsi->panel = of_drm_find_panel(device->dev.of_node);
> -		if (dsi->panel) {
> +		if (IS_ERR(dsi->panel)) {
> +			dsi->panel = NULL;
> +		} else {
>  			drm_panel_attach(dsi->panel, &dsi->connector);
>  			dsi->connector.status = connector_status_connected;
>  		}
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
