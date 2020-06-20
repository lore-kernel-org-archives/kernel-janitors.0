From: Sam Ravnborg <sam@ravnborg.org>
Date: Sat, 20 Jun 2020 11:20:05 +0000
Subject: Re: [PATCH] drm/panel: otm8009a: Drop unnessary backlight_device_unregister()
Message-Id: <20200620112005.GA16901@ravnborg.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200618134650.44311-1-weiyongjun1@huawei.com>
In-Reply-To: <20200618134650.44311-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Philippe CORNU <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>, Thierry Reding <thierry.reding@gmail.com>

Hi Wei.

On Thu, Jun 18, 2020 at 01:46:50PM +0000, Wei Yongjun wrote:
> It's not necessary to unregister backlight device which
> registered with devm_backlight_device_register().
> 
> Fixes: 12a6cbd4f3f1 ("drm/panel: otm8009a: Use new backlight API")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Thanks, pushed to drm-misc-next.

	Sam

> ---
>  drivers/gpu/drm/panel/panel-orisetech-otm8009a.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> index 895ee3d1371e..d956522f32ee 100644
> --- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> +++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> @@ -479,7 +479,6 @@ static int otm8009a_probe(struct mipi_dsi_device *dsi)
>  	if (ret < 0) {
>  		dev_err(dev, "mipi_dsi_attach failed. Is host ready?\n");
>  		drm_panel_remove(&ctx->panel);
> -		backlight_device_unregister(ctx->bl_dev);
>  		return ret;
>  	}
> 
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
