From: Boris Brezillon <boris.brezillon@free-electrons.com>
Date: Sat, 20 Jan 2018 13:49:06 +0000
Subject: Re: [PATCH -next] mtd: onenand: omap2: Remove redundant dev_err call in omap2_onenand_probe()
Message-Id: <20180120144906.3d22a204@bbrezillon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516188333-144550-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516188333-144550-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 17 Jan 2018 11:25:33 +0000
Wei Yongjun <weiyongjun1@huawei.com> wrote:

> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.

Applied.

Thanks,

Boris

> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/mtd/onenand/omap2.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
> index a4a2159..87c34f6 100644
> --- a/drivers/mtd/onenand/omap2.c
> +++ b/drivers/mtd/onenand/omap2.c
> @@ -532,10 +532,8 @@ static int omap2_onenand_probe(struct platform_device *pdev)
>  	c->phys_base = res->start;
>  
>  	c->onenand.base = devm_ioremap_resource(dev, res);
> -	if (IS_ERR(c->onenand.base)) {
> -		dev_err(dev, "Cannot reserve memory region %pR\n", res);
> +	if (IS_ERR(c->onenand.base))
>  		return PTR_ERR(c->onenand.base);
> -	}
>  
>  	c->int_gpiod = devm_gpiod_get_optional(dev, "int", GPIOD_IN);
>  	if (IS_ERR(c->int_gpiod)) {
> 
> 
> 

