From: "Ju, Seokmann" <sju@lsil.com>
Date: Tue, 22 Mar 2005 13:13:01 +0000
Subject: [KJ] RE: [UPDATE PATCH 15/19] drivers/scsi/megaraid: Use the
Message-Id: <0E3FA95632D6D047BA649F95DAB60E570366277D@exa-atlanta>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Tobias Klauser' <tklauser@nuerscht.ch>, kernel-janitors@lists.osdl.org
Cc: linux-scsi@vger.kernel.org

On Sunday, March 20, 2005 8:14 AM, Tobias wrote:
> The previous patch did not compile cleanly on all architectures so
> here's a fixed one.
> 
> Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h when calling
> pci_set_dma_mask() or pci_set_consistent_dma_mask()
> This patch includes dma-mapping.h explicitly because it caused errors
> on some architectures otherwise.
> See http://marc.theaimsgroup.com/?t8001993000001&r=1&w=2 
> for details
Thank you for the patch. 
However, exact same change is already included on the patch which I'm
submitting.
For the above reason, I'm rejecting the patch.

Thank you for the correction, again.

> -----Original Message-----
> From: Tobias Klauser [mailto:tklauser@nuerscht.ch] 
> Sent: Sunday, March 20, 2005 8:14 AM
> To: kernel-janitors@lists.osdl.org
> Cc: linux-scsi@vger.kernel.org
> Subject: [UPDATE PATCH 15/19] drivers/scsi/megaraid: Use the 
> DMA_{64, 32}BIT_MASK constants
> 
> The previous patch did not compile cleanly on all architectures so
> here's a fixed one.
> 
> Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h when calling
> pci_set_dma_mask() or pci_set_consistent_dma_mask()
> This patch includes dma-mapping.h explicitly because it caused errors
> on some architectures otherwise.
> See http://marc.theaimsgroup.com/?t8001993000001&r=1&w=2 
> for details
> 
> Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>
> 
> --- linux-2.6.11.orig/drivers/scsi/megaraid.c	2005-03-02 
> 12:50:36.000000000 +0100
> +++ linux-2.6.11/drivers/scsi/megaraid.c	2005-03-20 
> 13:27:54.000000000 +0100
> @@ -43,6 +43,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/pci.h>
>  #include <linux/init.h>
> +#include <linux/dma-mapping.h>
>  #include <scsi/scsicam.h>
>  
>  #include "scsi.h"
> @@ -2060,7 +2061,7 @@ make_local_pdev(adapter_t *adapter, stru
>  
>  	memcpy(*pdev, adapter->dev, sizeof(struct pci_dev));
>  
> -	if( pci_set_dma_mask(*pdev, 0xffffffff) != 0 ) {
> +	if( pci_set_dma_mask(*pdev, DMA_32BIT_MASK) != 0 ) {
>  		kfree(*pdev);
>  		return -1;
>  	}
> @@ -4854,10 +4855,10 @@ megaraid_probe_one(struct pci_dev *pdev,
>  
>  	/* Set the Mode of addressing to 64 bit if we can */
>  	if ((adapter->flag & BOARD_64BIT) && 
> (sizeof(dma_addr_t) = 8)) {
> -		pci_set_dma_mask(pdev, 0xffffffffffffffffULL);
> +		pci_set_dma_mask(pdev, DMA_64BIT_MASK);
>  		adapter->has_64bit_addr = 1;
>  	} else  {
> -		pci_set_dma_mask(pdev, 0xffffffff);
> +		pci_set_dma_mask(pdev, DMA_32BIT_MASK);
>  		adapter->has_64bit_addr = 0;
>  	}
>  		
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-scsi" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
