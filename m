From: Sergei Shtylyov <sshtylyov@mvista.com>
Date: Fri, 07 Sep 2012 10:46:20 +0000
Subject: Re: [PATCH] USB: XHCI: xhci-ring: Remove unused dma address calculation in inc_enq and inc_deq funct
Message-Id: <5049D07C.8010403@mvista.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1336922942.3945.12.camel@cst-girish-laptop> <1346946453.5012.1.camel@cst-girish-laptop>
In-Reply-To: <1346946453.5012.1.camel@cst-girish-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Girish Verma <girish@circuitsutra.com>
Cc: kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, sarah.a.sharp@linux.intel.com, gregkh@linuxfoundation.org

Hello.

On 06-09-2012 19:47, Girish Verma wrote:

> Resending patch with latest kernel code:

    That comment should have been put after the --- tear line.

> In xhci-ring.c, function inc_enq and inc_deq calculate the dma address
> of trb but never used.



> Signed-off-by: Girish Verma <girish@circuitsutra.com>
> ---
>   drivers/usb/host/xhci-ring.c |    4 ----
>   1 files changed, 0 insertions(+), 4 deletions(-)

> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 643c2f3..5c5c47b 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -145,7 +145,6 @@ static void next_trb(struct xhci_hcd *xhci,
>    */
>   static void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring)
>   {
> -	unsigned long long addr;
>
>   	ring->deq_updates++;
>
> @@ -176,7 +175,6 @@ static void inc_deq(struct xhci_hcd *xhci, struct
> xhci_ring *ring)
>   		}
>   	} while (last_trb(xhci, ring, ring->deq_seg, ring->dequeue));
>
> -	addr = (unsigned long long) xhci_trb_virt_to_dma(ring->deq_seg,
> ring->dequeue);
>   }
>
>   /*
> @@ -201,7 +199,6 @@ static void inc_enq(struct xhci_hcd *xhci, struct
> xhci_ring *ring,
>   {
>   	u32 chain;
>   	union xhci_trb *next;
> -	unsigned long long addr;
>
>   	chain = le32_to_cpu(ring->enqueue->generic.field[3]) & TRB_CHAIN;
>   	/* If this is not event ring, there is one less usable TRB */
> @@ -253,7 +250,6 @@ static void inc_enq(struct xhci_hcd *xhci, struct
> xhci_ring *ring,
>   		ring->enqueue = ring->enq_seg->trbs;
>   		next = ring->enqueue;
>   	}
> -	addr = (unsigned long long) xhci_trb_virt_to_dma(ring->enq_seg,
> ring->enqueue);

    The patch is line wrapped. Should be easy to fix by hand when applying 
though...

WBR, Sergei

