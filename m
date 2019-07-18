From: Oleksij Rempel <o.rempel@pengutronix.de>
Date: Thu, 18 Jul 2019 07:39:10 +0000
Subject: Re: [PATCH] net: ag71xx: fix return value check in ag71xx_probe()
Message-Id: <4b2983b7-7e5a-2796-1205-6039281dcdd0@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190717115225.23047-1-weiyongjun1@huawei.com>
In-Reply-To: <20190717115225.23047-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Jay Cliburn <jcliburn@gmail.com>, Chris Snook <chris.snook@gmail.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org



On 17.07.19 13:52, Wei Yongjun wrote:
> In case of error, the function of_get_mac_address() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().
> 
> Fixes: d51b6ce441d3 ("net: ethernet: add ag71xx driver")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>

> ---
>   drivers/net/ethernet/atheros/ag71xx.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/atheros/ag71xx.c b/drivers/net/ethernet/atheros/ag71xx.c
> index 72a57c6cd254..3088a43e6436 100644
> --- a/drivers/net/ethernet/atheros/ag71xx.c
> +++ b/drivers/net/ethernet/atheros/ag71xx.c
> @@ -1732,9 +1732,9 @@ static int ag71xx_probe(struct platform_device *pdev)
>   	ag->stop_desc->next = (u32)ag->stop_desc_dma;
>   
>   	mac_addr = of_get_mac_address(np);
> -	if (mac_addr)
> +	if (!IS_ERR(mac_addr))
>   		memcpy(ndev->dev_addr, mac_addr, ETH_ALEN);
> -	if (!mac_addr || !is_valid_ether_addr(ndev->dev_addr)) {
> +	if (IS_ERR(mac_addr) || !is_valid_ether_addr(ndev->dev_addr)) {
>   		netif_err(ag, probe, ndev, "invalid MAC address, using random address\n");
>   		eth_random_addr(ndev->dev_addr);
>   	}
> 
> 
> 
> 

Kind regards,
Oleksij Rempel

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
