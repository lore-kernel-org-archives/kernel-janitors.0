From: Inki Dae <inki.dae@samsung.com>
Date: Mon, 18 May 2020 04:58:28 +0000
Subject: Re: [PATCH v2] drm/exynos: dsi: Remove bridge node reference in error handling path in probe functio
Message-Id: <4555b0a8-b919-b5c1-cacb-1e6aec8a1aa8@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20200516105750epcas1p2227417d4e2387a0f6aec4a96b1ba7ae4@epcas1p2.samsung.com>
 <20200516105736.269669-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200516105736.269669-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, daniel@ffwll.ch, kgene@kernel.org, krzk@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org



20. 5. 16. 오후 7:57에 Christophe JAILLET 이(가) 쓴 글:
> 'exynos_dsi_parse_dt()' takes a reference to 'dsi->in_bridge_node'.
> This must be released in the error handling path.

Picked it up.

Thanks,
Inki Dae

> 
> In order to do that, add an error handling path and move the
> 'exynos_dsi_parse_dt()' call from the beginning to the end of the probe
> function to ease the error handling path.
> This function only sets some variables which are used only in the
> 'transfer' function.
> 
> The call chain is:
>    .transfer
>     --> exynos_dsi_host_transfer
>       --> exynos_dsi_init
>         --> exynos_dsi_enable_clock  (use burst_clk_rate and esc_clk_rate)
>           --> exynos_dsi_set_pll     (use pll_clk_rate)
> 
> While at it, also handle cases where 'component_add()' fails.
> 
> This patch is similar to commit 70505c2ef94b ("drm/exynos: dsi: Remove bridge node reference in removal")
> which fixed the issue in the remove function.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> A Fixes tag could be required, but I've not been able to figure out which
> one to use.
> 
> v2: move around 'exynos_dsi_parse_dt' instead of adding many gotos
>     handle component_add failures
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 902938d2568f..a9d24402fabf 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1759,10 +1759,6 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>  	dsi->dev = dev;
>  	dsi->driver_data = of_device_get_match_data(dev);
>  
> -	ret = exynos_dsi_parse_dt(dsi);
> -	if (ret)
> -		return ret;
> -
>  	dsi->supplies[0].supply = "vddcore";
>  	dsi->supplies[1].supply = "vddio";
>  	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(dsi->supplies),
> @@ -1823,11 +1819,25 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	ret = exynos_dsi_parse_dt(dsi);
> +	if (ret)
> +		return ret;
> +
>  	platform_set_drvdata(pdev, &dsi->encoder);
>  
>  	pm_runtime_enable(dev);
>  
> -	return component_add(dev, &exynos_dsi_component_ops);
> +	ret = component_add(dev, &exynos_dsi_component_ops);
> +	if (ret)
> +		goto err_disable_runtime;
> +
> +	return 0;
> +
> +err_disable_runtime:
> +	pm_runtime_disable(dev);
> +	of_node_put(dsi->in_bridge_node);
> +
> +	return ret;
>  }
>  
>  static int exynos_dsi_remove(struct platform_device *pdev)
> 
