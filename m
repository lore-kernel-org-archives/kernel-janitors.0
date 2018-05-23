From: Inki Dae <inki.dae@samsung.com>
Date: Wed, 23 May 2018 00:33:18 +0000
Subject: Re: [PATCH] drm/exynos: fimc: signedness bug in fimc_setup_clocks()
Message-Id: <5B04B6CE.2010004@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20180518080527epcas1p293dfaa13795c92f9239e8c9bd95af9ad@epcas1p2.samsung.com>
 <20180518080445.GB28335@mwanda>
In-Reply-To: <20180518080445.GB28335@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org



2018년 05월 18일 17:04에 Dan Carpenter 이(가) 쓴 글:
> "id" needs to be signed for the error handling to work.

Applied to exynos-drm-fixes-v4.18-rc1.

Thanks,
Inki Dae

> 
> Fixes: 7a2d5c77c558 ("drm/exynos: fimc: Convert driver to IPP v2 core API")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> index 4dfbfc7f3b84..5ce84025d1cb 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> @@ -1200,7 +1200,7 @@ static int fimc_setup_clocks(struct fimc_context *ctx)
>  
>  int exynos_drm_check_fimc_device(struct device *dev)
>  {
> -	unsigned int id = of_alias_get_id(dev->of_node, "fimc");
> +	int id = of_alias_get_id(dev->of_node, "fimc");
>  
>  	if (id >= 0 && (BIT(id) & fimc_mask))
>  		return 0;
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 
