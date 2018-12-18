From: Aisheng Dong <aisheng.dong@nxp.com>
Date: Tue, 18 Dec 2018 14:12:51 +0000
Subject: RE: [PATCH -next] clk: imx: fix potential NULL dereference in imx8qxp_lpcg_clk_probe()
Message-Id: <AM0PR04MB421133F1BA37512DC60057D680BD0@AM0PR04MB4211.eurprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545115389-173136-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1545115389-173136-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

> -----Original Message-----
> From: Wei Yongjun [mailto:weiyongjun1@huawei.com]
> Sent: Tuesday, December 18, 2018 2:43 PM
[...]
> platform_get_resource() may fail and return NULL, so we should better check
> it's return value to avoid a NULL pointer dereference a bit later in the code.
> 
> This is detected by Coccinelle semantic patch.
> 
> @@
> expression pdev, res, n, t, e, e1, e2;
> @@
> 
> res = platform_get_resource(pdev, t, n);
> + if (!res)
> +   return -EINVAL;
> ... when != res == NULL
> e = devm_ioremap(e1, res->start, e2);
> 
> Fixes: 1e3121bfe51a ("clk: imx: add imx8qxp lpcg driver")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Thanks for reporting this.

Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>

Regards
Dong Aisheng

> ---
>  drivers/clk/imx/clk-imx8qxp-lpcg.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> index dcae1dd..8f241a4 100644
> --- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> @@ -169,6 +169,8 @@ static int imx8qxp_lpcg_clk_probe(struct
> platform_device *pdev)
>  		return -ENODEV;
> 
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -EINVAL;
>  	base = devm_ioremap(dev, res->start, resource_size(res));
>  	if (!base)
>  		return -ENOMEM;
> 
> 
