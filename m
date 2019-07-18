From: Oleksij Rempel <o.rempel@pengutronix.de>
Date: Thu, 18 Jul 2019 07:41:13 +0000
Subject: Re: [PATCH] net: ethernet: fix error return code in ag71xx_probe()
Message-Id: <ec4fb148-7260-a89d-eaa2-b5bb7c01c530@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190717115215.22965-1-weiyongjun1@huawei.com>
In-Reply-To: <20190717115215.22965-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Jay Cliburn <jcliburn@gmail.com>, Chris Snook <chris.snook@gmail.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org



On 17.07.19 13:52, Wei Yongjun wrote:
> Fix to return error code -ENOMEM from the dmam_alloc_coherent() error
> handling case instead of 0, as done elsewhere in this function.
> 
> Fixes: d51b6ce441d3 ("net: ethernet: add ag71xx driver")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>

> ---
>   drivers/net/ethernet/atheros/ag71xx.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/atheros/ag71xx.c b/drivers/net/ethernet/atheros/ag71xx.c
> index 72a57c6cd254..446d62e93439 100644
> --- a/drivers/net/ethernet/atheros/ag71xx.c
> +++ b/drivers/net/ethernet/atheros/ag71xx.c
> @@ -1724,8 +1724,10 @@ static int ag71xx_probe(struct platform_device *pdev)
>   	ag->stop_desc = dmam_alloc_coherent(&pdev->dev,
>   					    sizeof(struct ag71xx_desc),
>   					    &ag->stop_desc_dma, GFP_KERNEL);
> -	if (!ag->stop_desc)
> +	if (!ag->stop_desc) {
> +		err = -ENOMEM;
>   		goto err_free;
> +	}
>   
>   	ag->stop_desc->data = 0;
>   	ag->stop_desc->ctrl = 0;
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
