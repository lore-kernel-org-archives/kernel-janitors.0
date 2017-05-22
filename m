From: CK Hu <ck.hu@mediatek.com>
Date: Mon, 22 May 2017 06:00:00 +0000
Subject: Re: [PATCH v2] drm/mediatek: fix a timeout loop
Message-Id: <1495432800.20811.11.camel@mtksdaap41>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170421105143.jbzvbsremnu6ltgp@mwanda>
In-Reply-To: <20170421105143.jbzvbsremnu6ltgp@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: shaoming chen <shaoming.chen@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org

Hi, Dan:

Sorry for the late reply. I've applied this patch to my branch
mediatek-drm-fixes-4.12-rc1.

Regards,
CK

On Fri, 2017-04-21 at 13:51 +0300, Dan Carpenter wrote:
> This code causes a static checker warning because it treats "i = 0" as
> a timeout but, because it's a post-op, the loop actually ends with "i"
> set to -1.  Philipp Zabel points out that it would be cleaner to use
> readl_poll_timeout() instead.
> 
> Fixes: 21898816831f ("drm/mediatek: add dsi transfer function")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Use readl_poll_timeout().  Please review this carefully because I've
> never used readl_poll_timeout() and could easily mess up.
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 808b995a990f..b5cc6e12334c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -19,6 +19,7 @@
>  #include <drm/drm_of.h>
>  #include <linux/clk.h>
>  #include <linux/component.h>
> +#include <linux/iopoll.h>
>  #include <linux/irq.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
> @@ -900,16 +901,12 @@ static int mtk_dsi_host_detach(struct mipi_dsi_host *host,
>  
>  static void mtk_dsi_wait_for_idle(struct mtk_dsi *dsi)
>  {
> -	u32 timeout_ms = 500000; /* total 1s ~ 2s timeout */
> -
> -	while (timeout_ms--) {
> -		if (!(readl(dsi->regs + DSI_INTSTA) & DSI_BUSY))
> -			break;
> -
> -		usleep_range(2, 4);
> -	}
> +	int ret;
> +	u32 val;
>  
> -	if (timeout_ms = 0) {
> +	ret = readl_poll_timeout(dsi->regs + DSI_INTSTA, val, !(val & DSI_BUSY),
> +				 4, 2000000);
> +	if (ret) {
>  		DRM_WARN("polling dsi wait not busy timeout!\n");
>  
>  		mtk_dsi_enable(dsi);


