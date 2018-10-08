From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 08 Oct 2018 07:39:58 +0000
Subject: Re: [PATCH -next] media: imx-pxp: remove duplicated include from imx-pxp.c
Message-Id: <1538984398.11512.2.camel@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538811362-80425-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538811362-80425-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 2018-10-06 at 07:36 +0000, YueHaibing wrote:
> Remove duplicated include.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/media/platform/imx-pxp.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/imx-pxp.c b/drivers/media/platform/imx-pxp.c
> index b76cd0e..229c23a 100644
> --- a/drivers/media/platform/imx-pxp.c
> +++ b/drivers/media/platform/imx-pxp.c
> @@ -16,7 +16,6 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> -#include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/sched.h>

This reverts a41d203a1d34, which was a duplicate of already applied
b4fbf423cef9: https://patchwork.linuxtv.org/patch/52243/

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
