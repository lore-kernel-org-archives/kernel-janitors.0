From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Date: Wed, 04 Aug 2010 05:11:46 +0000
Subject: Re: [PATCH] staging/rt2860: fix bad dma_addr_t conversion
Message-Id: <20100804141100U.fujita.tomonori@lab.ntt.co.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280897119.4986.16.camel@lenovo>
In-Reply-To: <1280897119.4986.16.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: martinez.javier@gmail.com
Cc: gregkh@suse.de, bzolnier@gmail.com, ben@decadent.org.uk, revent82@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 04 Aug 2010 00:45:19 -0400
Javier Martinez Canillas <martinez.javier@gmail.com> wrote:

> DMA addresses are not pointers and shouldn't be assigned to NULL.
> This patch was generated against today linux-next.
> 
> Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
> ---
>  drivers/staging/rt2860/rt_pci_rbus.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/staging/rt2860/rt_pci_rbus.c b/drivers/staging/rt2860/rt_pci_rbus.c
> index 3004be6..244c754 100644
> --- a/drivers/staging/rt2860/rt_pci_rbus.c
> +++ b/drivers/staging/rt2860/rt_pci_rbus.c
> @@ -218,7 +218,7 @@ void *RTMP_AllocateRxPacketBuffer(struct rt_rtmp_adapter *pAd,
>  				   PCI_DMA_FROMDEVICE);
>  	} else {
>  		*VirtualAddress = (void *)NULL;
> -		*PhysicalAddress = (dma_addr_t)NULL;
> +		*PhysicalAddress = 0;
>  	}

This doesn't look correct since zero is a valid DMA address on some
architectures.

I recommend removing the else part completely. If you need to mark a
rx buffer invalid, adding a flag to the rx descriptor structure of a
driver is a popular way (see other network drivers, e.g. bnx2).
