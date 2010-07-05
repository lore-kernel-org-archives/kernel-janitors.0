From: Martyn Welch <martyn.welch@ge.com>
Date: Mon, 05 Jul 2010 10:38:24 +0000
Subject: Re: [PATCH 21/25] vme_ca91cx42: remove casts from void*
Message-Id: <4C31B620.4060301@ge.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1277806577-31418-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1277806577-31418-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@suse.de>, Julia Lawall <julia@diku.dk>, linux-kernel@vger.kernel.org

Kulikov Vasiliy wrote:
> Remove unnesessary casts from void*.
>
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
>   
Seems ok, cheers,

Signed-off-by: Martyn Welch <martyn.welch@ge.com>


> ---
>  drivers/staging/vme/bridges/vme_ca91cx42.c |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/vme/bridges/vme_ca91cx42.c b/drivers/staging/vme/bridges/vme_ca91cx42.c
> index 0c82eb4..ce05ffa 100644
> --- a/drivers/staging/vme/bridges/vme_ca91cx42.c
> +++ b/drivers/staging/vme/bridges/vme_ca91cx42.c
> @@ -961,11 +961,11 @@ int ca91cx42_dma_list_add(struct vme_dma_list *list, struct vme_dma_attr *src,
>  
>  	if (dest->type = VME_DMA_VME) {
>  		entry->descriptor.dctl |= CA91CX42_DCTL_L2V;
> -		vme_attr = (struct vme_dma_vme *)dest->private;
> -		pci_attr = (struct vme_dma_pci *)src->private;
> +		vme_attr = dest->private;
> +		pci_attr = src->private;
>  	} else {
> -		vme_attr = (struct vme_dma_vme *)src->private;
> -		pci_attr = (struct vme_dma_pci *)dest->private;
> +		vme_attr = src->private;
> +		pci_attr = dest->private;
>  	}
>  
>  	/* Check we can do fullfill required attributes */
>   


-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189

