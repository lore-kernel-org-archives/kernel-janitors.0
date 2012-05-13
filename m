From: Sergei Shtylyov <sshtylyov@mvista.com>
Date: Sun, 13 May 2012 13:34:23 +0000
Subject: Re: [PATCH] USB: XHCI: xhci-ring: Remove unused dma address calculation in inc_enq and inc_deq funct
Message-Id: <4FAFB85F.1030604@mvista.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAOf1Mzv=+zSVCDgPcHhVvN6YCbhM8R2w6DDL80EbYTuA0EGpCw@mail.gmail.com>
In-Reply-To: <CAOf1Mzv=+zSVCDgPcHhVvN6YCbhM8R2w6DDL80EbYTuA0EGpCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Girish Verma <girish@circuitsutra.com>
Cc: kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, sarah.a.sharp@linux.intel.com, gregkh@linuxfoundation.org

Hello.

On 13-05-2012 5:06, Girish Verma wrote:

> Hi,

    Greeting shouldn't be a part of the changelog.

> in xhci-ring.c, function inc_enq and inc_deq calculate the dma address
> of trb but never used. This calculation may be used for debugging
> purpose, in that case this code should be part of debug flag.

> Signed-off-by: Girish Verma<girish@circuitsutra.com>
> ---
>   drivers/usb/host/xhci-ring.c |    4 ----
>   1 files changed, 0 insertions(+), 4 deletions(-)

> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 3d9422f..dcd67c1 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
[...]
> @@ -168,7 +167,6 @@ static void inc_deq(struct xhci_hcd *xhci, struct
> xhci_ring *ring)
>   		ring->dequeue = ring->deq_seg->trbs;
>   		next = ring->dequeue;
>   	}
> -	addr = (unsigned long long) xhci_trb_virt_to_dma(ring->deq_seg,
> ring->dequeue);

    Your patch is line-wrapped. Maybe the amintainer would be able to fix this 
tho...

WBR, Sergei
