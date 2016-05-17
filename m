From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 17 May 2016 07:10:41 +0000
Subject: Re: [patch] drm/exynos/hdmi: add a missing tab
Message-Id: <20160517071041.GL27098@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160512195457.GA19095@mwanda>
In-Reply-To: <20160512195457.GA19095@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>

On Thu, May 12, 2016 at 10:54:57PM +0300, Dan Carpenter wrote:
> Smatch warns that the if statement isn't indented.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to drm-misc, thanks.
-Daniel

> 
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 0f87acb..748e62f 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -1612,7 +1612,7 @@ static int hdmi_clk_init(struct hdmi_context *hdata)
>  
>  	clks = devm_kzalloc(dev, sizeof(*clks) * count, GFP_KERNEL);
>  	if (!clks)
> -	return -ENOMEM;
> +		return -ENOMEM;
>  
>  	hdata->clk_gates = clks;
>  	hdata->clk_muxes = clks + drv_data->clk_gates.count;
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
