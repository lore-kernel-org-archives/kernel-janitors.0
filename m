From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Date: Thu, 26 Sep 2019 06:28:32 +0000
Subject: Re: [PATCH net] net: socionext: Fix a signedness bug in ave_probe()
Message-Id: <20190926152831.DDD6.4A936039@socionext.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925105750.GG3264@mwanda>
In-Reply-To: <20190925105750.GG3264@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

Thank you for pointing out.
I've confirmed that this error handling works well with your patch.

Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Thank you,

On Wed, 25 Sep 2019 13:57:50 +0300 <dan.carpenter@oracle.com> wrote:

> The "phy_mode" variable is an enum and in this context GCC treats it as
> an unsigned int so the error handling is never triggered.
> 
> Fixes: 4c270b55a5af ("net: ethernet: socionext: add AVE ethernet driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/socionext/sni_ave.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/socionext/sni_ave.c b/drivers/net/ethernet/socionext/sni_ave.c
> index 10d0c3e478ab..d047a53f34f2 100644
> --- a/drivers/net/ethernet/socionext/sni_ave.c
> +++ b/drivers/net/ethernet/socionext/sni_ave.c
> @@ -1566,7 +1566,7 @@ static int ave_probe(struct platform_device *pdev)
>  
>  	np = dev->of_node;
>  	phy_mode = of_get_phy_mode(np);
> -	if (phy_mode < 0) {
> +	if ((int)phy_mode < 0) {
>  		dev_err(dev, "phy-mode not found\n");
>  		return -EINVAL;
>  	}
> -- 
> 2.20.1

---
Best Regards,
Kunihiko Hayashi
