From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Wed, 06 May 2020 17:24:16 +0000
Subject: Re: [PATCH -next] soc: mediatek: Missing platform_device_unregister() on error in mtk_mmsys_probe()
Message-Id: <923a48d8-eb9e-2729-a4be-dad63a6df28a@collabora.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200506141317.119537-1-weiyongjun1@huawei.com>
In-Reply-To: <20200506141317.119537-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Wei,

Thank you for your patch.

On 6/5/20 16:13, Wei Yongjun wrote:
> Add the missing platform_device_unregister() before return
> from mtk_mmsys_probe() in the error handling case.
> 
> Fixes: 667c769246b0 ("soc / drm: mediatek: Fix mediatek-drm device probing")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>  drivers/soc/mediatek/mtk-mmsys.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 05e322c9c301..05ce4cb464b0 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -312,8 +312,10 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>  
>  	drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
>  					    PLATFORM_DEVID_AUTO, NULL, 0);
> -	if (IS_ERR(drm))
> +	if (IS_ERR(drm)) {
> +		platform_device_unregister(clks);
>  		return PTR_ERR(drm);
> +	}
>  
>  	return 0;
>  }
> 
> 
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
