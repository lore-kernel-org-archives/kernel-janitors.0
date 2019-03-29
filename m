From: Mukesh Ojha <mojha@codeaurora.org>
Date: Fri, 29 Mar 2019 06:57:26 +0000
Subject: Re: [PATCH -next] drm/omap: Use PTR_ERR_OR_ZERO in hdmi4_core_init()
Message-Id: <f99b8eb0-b758-7781-8bd8-bb1c95ecb8fa@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190329014136.20318-1-yuehaibing@huawei.com>
In-Reply-To: <20190329014136.20318-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sean Paul <seanpaul@chromium.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Matteo Croce <mcroce@redhat.com>, Benoit Parrot <bparrot@ti.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


On 3/29/2019 7:11 AM, YueHaibing wrote:
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>


Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

-Mukesh

> ---
>   drivers/gpu/drm/omapdrm/dss/hdmi4_core.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c b/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
> index e384b95ad857..8287ade5ece0 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
> @@ -934,8 +934,5 @@ int hdmi4_core_init(struct platform_device *pdev, struct hdmi_core_data *core)
>   
>   	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
>   	core->base = devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(core->base))
> -		return PTR_ERR(core->base);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(core->base);
>   }



>
>
>
>
>
