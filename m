From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 17 Dec 2018 12:43:24 +0000
Subject: Re: [PATCH -next] irqchip: irq-rda-intc: Fix return value check in rda8810_intc_init()
Message-Id: <20181217123123.GA26530@mani>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545047898-153890-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1545047898-153890-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Dec 17, 2018 at 11:58:18AM +0000, Wei Yongjun wrote:
> In case of error, the function of_io_request_and_map() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().
> 
> Fixes: d852e62ad689 ("irqchip: Add RDA8810PL interrupt driver")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/irqchip/irq-rda-intc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-rda-intc.c b/drivers/irqchip/irq-rda-intc.c
> index 1176291..9601683 100644
> --- a/drivers/irqchip/irq-rda-intc.c
> +++ b/drivers/irqchip/irq-rda-intc.c
> @@ -85,8 +85,8 @@ static int __init rda8810_intc_init(struct device_node *node,
>  				    struct device_node *parent)
>  {
>  	rda_intc_base = of_io_request_and_map(node, 0, "rda-intc");
> -	if (!rda_intc_base)
> -		return -ENXIO;
> +	if (IS_ERR(rda_intc_base))
> +		return PTR_ERR(rda_intc_base);
>  
>  	/* Mask all interrupt sources */
>  	writel_relaxed(RDA_IRQ_MASK_ALL, rda_intc_base + RDA_INTC_MASK_CLR);
> 
> 
> 
