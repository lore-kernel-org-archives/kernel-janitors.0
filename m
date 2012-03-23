From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
Date: Fri, 23 Mar 2012 16:29:57 +0000
Subject: Re: [patch] xHCI: use gfp flags from caller instead of GFP_ATOMIC
Message-Id: <20120323162957.GC5207@xanatos>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120323120900.GA20936@elgon.mountain>
In-Reply-To: <20120323120900.GA20936@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Mar 23, 2012 at 03:09:00PM +0300, Dan Carpenter wrote:
> We're not holding a lock here so we can use the gfp flags the caller
> specifies instead of GFP_ATOMIC.  The callers use GFP_ATOMIC so this
> change doesn't affect how the kernel runs, but it's a cleanup.

Nak.  We are holding a lock in all the xhci_queue* functions, so we
need GFP_ATOMIC.  It's locked in a parent function, xhci_urb_enqueue().

Sarah Sharp

> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 6bd9d53..8715cc6 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -2734,7 +2734,7 @@ int xhci_queue_intr_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>  				urb->dev->speed = USB_SPEED_FULL)
>  			urb->interval /= 8;
>  	}
> -	return xhci_queue_bulk_tx(xhci, GFP_ATOMIC, urb, slot_id, ep_index);
> +	return xhci_queue_bulk_tx(xhci, mem_flags, urb, slot_id, ep_index);
>  }
>  
>  /*
> @@ -3514,7 +3514,7 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
>  	}
>  	ep_ring->num_trbs_free_temp = ep_ring->num_trbs_free;
>  
> -	return xhci_queue_isoc_tx(xhci, GFP_ATOMIC, urb, slot_id, ep_index);
> +	return xhci_queue_isoc_tx(xhci, mem_flags, urb, slot_id, ep_index);
>  }
>  
>  /****		Command Ring Operations		****/
