From: Inki Dae <inki.dae@samsung.com>
Date: Wed, 22 Apr 2020 03:38:24 +0000
Subject: Re: [PATCH] drm/exynos: Delete an error message in three functions
Message-Id: <a088b8e7-869b-8f8f-b9a1-9b68de7b714c@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20200405121842epcas1p4c947a40c70881e72c38d6c9cc75c60d5@epcas1p4.samsung.com>
 <57b725ed-f705-b5e1-0da6-3d16801c7c85@web.de>
In-Reply-To: <57b725ed-f705-b5e1-0da6-3d16801c7c85@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Joonyoung Shim <jy0922.shim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Tang Bin <tangbin@cmss.chinamobile.com>

Hi Markus Elfring,

20. 4. 5. 오후 9:18에 Markus Elfring 이(가) 쓴 글:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 5 Apr 2020 14:10:09 +0200
> 
> The function “platform_get_irq” can log an error already.
> Thus omit redundant messages for the exception handling in the
> calling functions.
> 
> This issue was detected by using the Coccinelle software.

Picked it up.

Thanks,
Inki Dae.

> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c     | 4 +---
>  drivers/gpu/drm/exynos/exynos_drm_rotator.c | 4 +---
>  drivers/gpu/drm/exynos/exynos_drm_scaler.c  | 4 +---
>  3 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index e080aa92338c..a00c6dd16c8a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1813,10 +1813,8 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>  	}
> 
>  	dsi->irq = platform_get_irq(pdev, 0);
> -	if (dsi->irq < 0) {
> -		dev_err(dev, "failed to request dsi irq resource\n");
> +	if (dsi->irq < 0)
>  		return dsi->irq;
> -	}
> 
>  	irq_set_status_flags(dsi->irq, IRQ_NOAUTOEN);
>  	ret = devm_request_threaded_irq(dev, dsi->irq, NULL,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> index dafa87b82052..2d94afba031e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> @@ -293,10 +293,8 @@ static int rotator_probe(struct platform_device *pdev)
>  		return PTR_ERR(rot->regs);
> 
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(dev, "failed to get irq\n");
> +	if (irq < 0)
>  		return irq;
> -	}
> 
>  	ret = devm_request_irq(dev, irq, rotator_irq_handler, 0, dev_name(dev),
>  			       rot);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> index 93c43c8d914e..ce1857138f89 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> @@ -502,10 +502,8 @@ static int scaler_probe(struct platform_device *pdev)
>  		return PTR_ERR(scaler->regs);
> 
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(dev, "failed to get irq\n");
> +	if (irq < 0)
>  		return irq;
> -	}
> 
>  	ret = devm_request_threaded_irq(dev, irq, NULL,	scaler_irq_handler,
>  					IRQF_ONESHOT, "drm_scaler", scaler);
> --
> 2.26.0
> 
> 
> 
