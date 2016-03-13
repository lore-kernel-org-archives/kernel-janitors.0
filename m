From: "Kim, Milo" <milo.kim@ti.com>
Date: Sun, 13 Mar 2016 23:08:44 +0000
Subject: Re: [patch] mfd: lp8788-irq: uninitialized variable in irq handler
Message-Id: <56E5F2FC.5070801@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160311081139.GC31887@mwanda>
In-Reply-To: <20160311081139.GC31887@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 3/11/2016 5:11 PM, Dan Carpenter wrote:
> Instead to being true/false, the "handled" is true/uninitialized.
> Presumably this doesn't cause that many problems in real life because
> normally we handle the IRQ.
>
> Fixes: eea6b7cc53aa ('mfd: Add lp8788 mfd driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Milo Kim <milo.kim@ti.com>

Thanks for catching this!

>
> diff --git a/drivers/mfd/lp8788-irq.c b/drivers/mfd/lp8788-irq.c
> index c7a9825..792d51b 100644
> --- a/drivers/mfd/lp8788-irq.c
> +++ b/drivers/mfd/lp8788-irq.c
> @@ -112,7 +112,7 @@ static irqreturn_t lp8788_irq_handler(int irq, void *ptr)
>   	struct lp8788_irq_data *irqd = ptr;
>   	struct lp8788 *lp = irqd->lp;
>   	u8 status[NUM_REGS], addr, mask;
> -	bool handled;
> +	bool handled = false;
>   	int i;
>
>   	if (lp8788_read_multi_bytes(lp, LP8788_INT_1, status, NUM_REGS))
>
