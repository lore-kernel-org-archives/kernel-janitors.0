From: Martin Kaiser <martin@kaiser.cx>
Date: Tue, 23 Jan 2018 09:09:34 +0000
Subject: Re: [PATCH -next] hwrng: make symbol imx_rngc_pm_ops static
Message-Id: <20180123090934.GA29930@botnar.kaiser.cx>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516673336-170194-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516673336-170194-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

Thus wrote Wei Yongjun (weiyongjun1@huawei.com):

> Fixes the following sparse warnings:

> drivers/char/hw_random/imx-rngc.c:303:1: warning:
>  symbol 'imx_rngc_pm_ops' was not declared. Should it be static?

> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/char/hw_random/imx-rngc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
> index eca8724..250123b 100644
> --- a/drivers/char/hw_random/imx-rngc.c
> +++ b/drivers/char/hw_random/imx-rngc.c
> @@ -300,7 +300,7 @@ static int __maybe_unused imx_rngc_resume(struct device *dev)
>  	return 0;
>  }

> -SIMPLE_DEV_PM_OPS(imx_rngc_pm_ops, imx_rngc_suspend, imx_rngc_resume);
> +static SIMPLE_DEV_PM_OPS(imx_rngc_pm_ops, imx_rngc_suspend, imx_rngc_resume);

>  static const struct of_device_id imx_rngc_dt_ids[] = {
>  	{ .compatible = "fsl,imx25-rngb", .data = NULL, },


You're right. The vast majority of other drivers uses a
static SIMPLE_DEV_PM_OPS(), so should we.

Reviewed-by: Martin Kaiser <martin@kaiser.cx>
