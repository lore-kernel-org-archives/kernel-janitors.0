From: Inki Dae <inki.dae@samsung.com>
Date: Mon, 20 Feb 2017 07:11:13 +0000
Subject: Re: [patch] drm/exynos/decon5433: & vs | typo
Message-Id: <58AA9691.90602@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20170214074945epcas4p108ec7d0fd8042271ba25b4738e2dc8bc@epcas4p1.samsung.com>
 <20170214074620.GA9710@mwanda>
In-Reply-To: <20170214074620.GA9710@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org

Merged.

Thanks,
Inki Dae

2017년 02월 14일 16:46에 Dan Carpenter 이(가) 쓴 글:
> "&" was obviously intended instead of "|".  The original condition is
> always true.
> 
> Fixes: b93c2e8b5d9d ("drm/exynos/decon5433: configure sysreg in case of hardware trigger")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> index 0fd6f7a18364..cca32a4fdab3 100644
> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> @@ -678,7 +678,7 @@ static int exynos5433_decon_probe(struct platform_device *pdev)
>  		ctx->out_type |= IFTYPE_I80;
>  	}
>  
> -	if (ctx->out_type | I80_HW_TRG) {
> +	if (ctx->out_type & I80_HW_TRG) {
>  		ctx->sysreg = syscon_regmap_lookup_by_phandle(dev->of_node,
>  							"samsung,disp-sysreg");
>  		if (IS_ERR(ctx->sysreg)) {
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
