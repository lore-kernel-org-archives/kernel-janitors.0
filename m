From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Dec 2019 06:35:28 +0000
Subject: Re: [PATCH -next] rtc: mt6397: drop free_irq of devm_xx allocated irq
Message-Id: <20191204063444.GF1765@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191204020209.10363-1-maowenan@huawei.com>
In-Reply-To: <20191204020209.10363-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, alexandre.belloni@bootlin.com, sean.wang@mediatek.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org

On Wed, Dec 04, 2019 at 10:02:09AM +0800, Mao Wenan wrote:
> rtc->irq is requested by devm_request_threaded_irq,
> and request_threaded_irq. IRQs requested with this
> function will be automatically freed on driver detach.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  drivers/rtc/rtc-mt6397.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> index 5249fc99fd5f..d6a10111137a 100644
> --- a/drivers/rtc/rtc-mt6397.c
> +++ b/drivers/rtc/rtc-mt6397.c
> @@ -293,7 +293,6 @@ static int mtk_rtc_probe(struct platform_device *pdev)
>  	return 0;
>  
>  out_free_irq:
> -	free_irq(rtc->irq, rtc);
>  	return ret;

Please get rid of the error label as well.

regards,
dan carpenter
