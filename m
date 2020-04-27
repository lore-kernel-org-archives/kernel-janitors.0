From: David Lechner <david@lechnology.com>
Date: Mon, 27 Apr 2020 15:16:47 +0000
Subject: Re: [PATCH net-next] drivers: net: davinci_mdio: fix potential NULL dereference in davinci_mdio_prob
Message-Id: <d2c55de2-01f0-b123-dee6-5fc74b8b67da@lechnology.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427094032.181184-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427094032.181184-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Andrew Lunn <andrew@lunn.ch>
Cc: linux-omap@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 4/27/20 4:40 AM, Wei Yongjun wrote:
> platform_get_resource() may fail and return NULL, so we should
> better check it's return value to avoid a NULL pointer dereference
> a bit later in the code.
> 
> This is detected by Coccinelle semantic patch.
> 
> @@
> expression pdev, res, n, t, e, e1, e2;
> @@
> 
> res = \(platform_get_resource\|platform_get_resource_byname\)(pdev, t, n);
> + if (!res)
> +   return -EINVAL;
> ... when != res = NULL
> e = devm_ioremap(e1, res->start, e2);
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>   drivers/net/ethernet/ti/davinci_mdio.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ethernet/ti/davinci_mdio.c b/drivers/net/ethernet/ti/davinci_mdio.c
> index 38b7f6d35759..702fdc393da0 100644
> --- a/drivers/net/ethernet/ti/davinci_mdio.c
> +++ b/drivers/net/ethernet/ti/davinci_mdio.c
> @@ -397,6 +397,8 @@ static int davinci_mdio_probe(struct platform_device *pdev)
>   	data->dev = dev;
>   
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -EINVAL;
>   	data->regs = devm_ioremap(dev, res->start, resource_size(res));
>   	if (!data->regs)
>   		return -ENOMEM;
> 

Could we use devm_platform_ioremap_resource() instead?
