From: Thomas Dahlmann <dahlmann.thomas@arcor.de>
Date: Fri, 14 Aug 2009 19:32:05 +0000
Subject: Re: [PATCH 3/3] drivers/usb/gadget: Drop NULL test on list_entry
Message-Id: <4A870E11.10705@arcor.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907120943230.17416@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907120943230.17416@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-geode@lists.infradead.org, gregkh@suse.de, jirislaby@gmail.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Thanks!

Applied.

Julia Lawall schrieb:
> From: Julia Lawall <julia@diku.dk>
>
> list_entry, which is an alias for container_of, cannot return NULL, as
> there is no way to add a NULL value to a doubly linked list.
>
> A simplified version of the semantic match that findds this problem is as
> follows:
> (http://www.emn.fr/x-info/coccinelle/)
>
> // <smpl>
> @r@
> expression x,E;
> statement S1,S2;
> position p,p1;
> @@
>
> *x = list_entry@p(...)
> ... when != x = E
> *if@p1 (x = NULL) S1 else S2
> // </smpl>
>
> Signed-off-by: Julia Lawall <julia@diku.dk>
>
> ---
>  drivers/usb/gadget/amd5536udc.c     |   56 +++++++++-----------
>  1 files changed, 25 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/usb/gadget/amd5536udc.c b/drivers/usb/gadget/amd5536udc.c
> index 826f3ad..85f7aa9 100644
> --- a/drivers/usb/gadget/amd5536udc.c
> +++ b/drivers/usb/gadget/amd5536udc.c
> @@ -2379,40 +2379,34 @@ static irqreturn_t udc_data_in_isr(struct udc *dev, int ep_ix)
>  		if (!ep->cancel_transfer && !list_empty(&ep->queue)) {
>  			req = list_entry(ep->queue.next,
>  					struct udc_request, queue);
> -			if (req) {
> -				/*
> -				 * length bytes transfered
> -				 * check dma done of last desc. in PPBDU mode
> -				 */
> -				if (use_dma_ppb_du) {
> -					td = udc_get_last_dma_desc(req);
> -					if (td) {
> -						dma_done > -							AMD_GETBITS(td->status,
> -							UDC_DMA_IN_STS_BS);
> -						/* don't care DMA done */
> -						req->req.actual > -							req->req.length;
> -					}
> -				} else {
> -					/* assume all bytes transferred */
> +			/*
> +			 * length bytes transfered
> +			 * check dma done of last desc. in PPBDU mode
> +			 */
> +			if (use_dma_ppb_du) {
> +				td = udc_get_last_dma_desc(req);
> +				if (td) {
> +					dma_done > +						AMD_GETBITS(td->status,
> +						UDC_DMA_IN_STS_BS);
> +					/* don't care DMA done */
>  					req->req.actual = req->req.length;
>  				}
> +			} else {
> +				/* assume all bytes transferred */
> +				req->req.actual = req->req.length;
> +			}
>  
> -				if (req->req.actual = req->req.length) {
> -					/* complete req */
> -					complete_req(ep, req, 0);
> -					req->dma_going = 0;
> -					/* further request available ? */
> -					if (list_empty(&ep->queue)) {
> -						/* disable interrupt */
> -						tmp = readl(
> -							&dev->regs->ep_irqmsk);
> -						tmp |= AMD_BIT(ep->num);
> -						writel(tmp,
> -							&dev->regs->ep_irqmsk);
> -					}
> -
> +			if (req->req.actual = req->req.length) {
> +				/* complete req */
> +				complete_req(ep, req, 0);
> +				req->dma_going = 0;
> +				/* further request available ? */
> +				if (list_empty(&ep->queue)) {
> +					/* disable interrupt */
> +					tmp = readl(&dev->regs->ep_irqmsk);
> +					tmp |= AMD_BIT(ep->num);
> +					writel(tmp, &dev->regs->ep_irqmsk);
>  				}
>  			}
>  		}
>   

