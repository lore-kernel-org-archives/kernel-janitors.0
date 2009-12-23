From: "Sosnowski, Maciej" <maciej.sosnowski@intel.com>
Date: Wed, 23 Dec 2009 15:08:11 +0000
Subject: RE: [PATCH 2/2] drivers/dma: drop unnecesary memset
Message-Id: <129600E5E5FB004392DDC3FB599660D7CB370DD6@irsmsx504.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0912190830110.30546@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0912190830110.30546@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: "Williams, Dan J" <dan.j.williams@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> memset of 0 is not needed after kzalloc
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression x;
> statement S;
> @@
> 
> x = kzalloc(...);
> if (x = NULL) S
> ... when != x
> -memset(x,0,...);// </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
>  drivers/dma/dw_dmac.c |    2 --
>  1 file changed, 2 deletions(-)
> 
> diff -u -p a/drivers/dma/dw_dmac.c b/drivers/dma/dw_dmac.c
> --- a/drivers/dma/dw_dmac.c
> +++ b/drivers/dma/dw_dmac.c
> @@ -1270,8 +1270,6 @@ static int __init dw_probe(struct platfo
>  		goto err_kfree;
>  	}
> 
> -	memset(dw, 0, sizeof *dw);
> -
>  	dw->regs = ioremap(io->start, DW_REGLEN);
>  	if (!dw->regs) {
>  		err = -ENOMEM;

Acked-by: Maciej Sosnowski <maciej.sosnowski@intel.com>