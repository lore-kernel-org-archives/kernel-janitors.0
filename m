From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Thu, 20 Apr 2017 11:05:05 +0000
Subject: Re: [PATCH] drm/mediatek: fix a loop timeout
Message-Id: <1492686305.2158.51.camel@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170420102423.5yqe6uwohaeleyyl@mwanda>
In-Reply-To: <20170420102423.5yqe6uwohaeleyyl@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, shaoming chen <shaoming.chen@mediatek.com>

Hi Dan,

On Thu, 2017-04-20 at 13:24 +0300, Dan Carpenter wrote:
> We expected to end with "timeout_ms" set to zero, but it's a post-op so
> the current code ends with -1.  Let's fix this by changing it to a
> pre-op.
> 
> Fixes: 21898816831f ("drm/mediatek: add dsi transfer function")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Indeed without this patch the timeout error path is only ever chosen if
the busy bit happened to flip exactly in the last iteration of the loop.

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 808b995a990f..3a0b6d1057a2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -902,7 +902,7 @@ static void mtk_dsi_wait_for_idle(struct mtk_dsi *dsi)
>  {
>  	u32 timeout_ms = 500000; /* total 1s ~ 2s timeout */
>  
> -	while (timeout_ms--) {
> +	while (--timeout_ms) {
>  		if (!(readl(dsi->regs + DSI_INTSTA) & DSI_BUSY))
>  			break;
>  
> 

Instead of just calling usleep_range(2, 4) up to 500000 times in this
open coded loop, this should be replaced with a single call to
readl_poll_timeout() though.

regards
Philipp

