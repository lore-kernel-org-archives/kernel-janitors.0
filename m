From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
Date: Thu, 17 Mar 2011 20:55:55 +0000
Subject: Re: Potential issue in xhci-ring handle_tx_event()
Message-Id: <20110317205555.GB5399@xanatos>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Thu, Mar 17, 2011 at 10:47:46PM +0300, Dan Carpenter wrote:
> Btw, xhci-ring.c causes some valid looking gcc warnings:
> 
> C [M]  drivers/usb/host/xhci-ring.o
> drivers/usb/host/xhci-ring.c: In function ‘handle_port_status’:
> drivers/usb/host/xhci-ring.c:1229: warning: ‘hcd’ may be used uninitialized in this function
> drivers/usb/host/xhci-ring.c: In function ‘handle_tx_event’:
> drivers/usb/host/xhci-ring.c:1895: warning: ‘event_trb’ may be used uninitialized in this function

Oh, actually, looking through my mail, Dmitry also noticed the event_trb
issue last week and started on a patch to fix it (see below).

Dmitry, can you please send a proper patch?

Thanks,

Sarah Sharp

On Wed, Feb 23, 2011 at 08:48:02PM -0800, Dmitry Torokhov wrote:
> Hi Andiry, Sarah,
> 
> I was compiling xhci and got a warning that event_trb might be used
> uninitialized in handle_tx_event(). Looking at the implementation the
> logic is quite convoluted but appears that if the following condition is
> true:
> 
> 	!event_seg && ep->skip && usb_endpoint_xfer_isoc(...)
> 
> we indeed will end up calling process_*_td(..., event_trb, ...).
> 
> I think something like the following is needed...
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 3e8211c..85ae5ef 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -1918,22 +1918,26 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>  		}
>  
>  		td = list_entry(ep_ring->td_list.next, struct xhci_td, td_list);
> +
>  		/* Is this a TRB in the currently executing TD? */
>  		event_seg = trb_in_td(ep_ring->deq_seg, ep_ring->dequeue,
>  				td->last_trb, event_dma);
> -		if (event_seg && ep->skip) {
> -			xhci_dbg(xhci, "Found td. Clear skip flag.\n");
> -			ep->skip = false;
> -		}
> -		if (!event_seg &&
> -		   (!ep->skip || !usb_endpoint_xfer_isoc(&td->urb->ep->desc))) {
> +		if (!event_seg) {
> +			if (ep->skip &&
> +			    usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
> +				ret = 0;
> +				goto cleanup;
> +			}
>  			/* HC is busted, give up! */
> -			xhci_err(xhci, "ERROR Transfer event TRB DMA ptr not "
> -					"part of current TD\n");
> +			xhci_err(xhci,
> +				"ERROR Transfer event TRB DMA ptr not part of current TD\n");
>  			return -ESHUTDOWN;
> -		}
> +		} else {
> +			if (ep->skip) {
> +				xhci_dbg(xhci, "Found td. Clear skip flag.\n");
> +				ep->skip = false;
> +			}
>  
> -		if (event_seg) {
>  			event_trb = &event_seg->trbs[(event_dma -
>  					 event_seg->dma) / sizeof(*event_trb)];
>  			/*
> 
> Thanks.
> 
> -- 
> Dmitry
> 

