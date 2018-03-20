From: Neil Armstrong <narmstrong@baylibre.com>
Date: Tue, 20 Mar 2018 15:04:17 +0000
Subject: Re: [PATCH -next] drm/meson: Fix potential NULL dereference in meson_drv_bind_master()
Message-Id: <4cad8099-dbb8-d12c-9ce8-b64688222bd7@baylibre.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1521555630-29284-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1521555630-29284-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, David Airlie <airlied@linux.ie>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

On 20/03/2018 15:20, Wei Yongjun wrote:
> platform_get_resource_byname() may fail and return NULL, so we should
> better check it's return value to avoid a NULL pointer dereference
> a bit later in the code.
> 
> This is detected by Coccinelle semantic patch.
> 
> @@
> expression pdev, res, n, t, e, e1, e2;
> @@
> 
> res = platform_get_resource_byname(pdev, t, n);
> + if (!res)
> +   return -EINVAL;
> ... when != res = NULL
> e = devm_ioremap(e1, res->start, e2);
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpu/drm/meson/meson_drv.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 3baceb7..32b1a6c 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -197,6 +197,8 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  	priv->io_base = regs;
>  
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hhi");
> +	if (!res)
> +		return -EINVAL;
>  	/* Simply ioremap since it may be a shared register zone */
>  	regs = devm_ioremap(dev, res->start, resource_size(res));
>  	if (!regs) {
> @@ -213,6 +215,8 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  	}
>  
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dmc");
> +	if (!res)
> +		return -EINVAL;
>  	/* Simply ioremap since it may be a shared register zone */
>  	regs = devm_ioremap(dev, res->start, resource_size(res));
>  	if (!regs) {
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
Thanks,

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
