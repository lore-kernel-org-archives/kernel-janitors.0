From: Inki Dae <inki.dae@samsung.com>
Date: Fri, 25 Mar 2016 08:51:20 +0000
Subject: Re: [patch 2/2] drm/exynos: mic: remove some dead code
Message-Id: <56F4FC08.6090009@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160317103912.GB3100@mwanda>
In-Reply-To: <20160317103912.GB3100@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>

Hi Dan,

2016년 03월 17일 19:39에 Dan Carpenter 이(가) 쓴 글:
> We know "ret" is zero and the test makes static checkers complain so
> let's delete this printk.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> index 890c9b1..12db353 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> @@ -130,8 +130,6 @@ static void mic_set_path(struct exynos_mic *mic, bool enable)
>  		val &= ~(MIC0_RGB_MUX | MIC0_I80_MUX | MIC0_ON_MUX);
>  
>  	regmap_write(mic->sysreg, DSD_CFG_MUX, val);
> -	if (ret)
> -		DRM_ERROR("mic: Failed to read system register\n");

I think we missed to keep return value from regmap_write function,
	ret = regmap_write(mic->sysreg, ....);
	if (ret)
		...

Thanks,
Inki Dae

>  }
>  
>  static int mic_sw_reset(struct exynos_mic *mic)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
