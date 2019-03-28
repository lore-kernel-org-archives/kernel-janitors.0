From: Mukesh Ojha <mojha@codeaurora.org>
Date: Thu, 28 Mar 2019 19:26:30 +0000
Subject: Re: [PATCH] irqchip/irq-ls1x: Missing error code in ls1x_intc_of_init()
Message-Id: <a90ad2ff-acc1-0baf-d7e4-1292bb1c8464@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190328143854.GN32613@kadam>
In-Reply-To: <20190328143854.GN32613@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Marc Zyngier <marc.zyngier@arm.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


On 3/28/2019 8:08 PM, Dan Carpenter wrote:
> We forgot to set "err" on this error path.

What is "this" error path, please describe

like

"Currently, when irq_domain_add_linear() fails, error code does not get 
set due to which

it return zero which is wrong.Fix it by setting appropriate error code."

> Fixes: 9e543e22e204 ("irqchip: Add driver for Loongson-1 interrupt controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>


Other wise change looks good .
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

-Mukesh

> ---
>   drivers/irqchip/irq-ls1x.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/irqchip/irq-ls1x.c b/drivers/irqchip/irq-ls1x.c
> index 86b72fbd3b45..353111a10413 100644
> --- a/drivers/irqchip/irq-ls1x.c
> +++ b/drivers/irqchip/irq-ls1x.c
> @@ -130,6 +130,7 @@ static int __init ls1x_intc_of_init(struct device_node *node,
>   					     NULL);
>   	if (!priv->domain) {
>   		pr_err("ls1x-irq: cannot add IRQ domain\n");
> +		err = -ENOMEM;
>   		goto out_iounmap;
>   	}
>   
