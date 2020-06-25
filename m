From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Date: Thu, 25 Jun 2020 23:10:29 +0000
Subject: Re: [PATCH] scsi: cumana_2: Fix different dev_id between 'request_irq()' and 'free_irq()'
Message-Id: <20200625231029.GN1551@shell.armlinux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200530073555.577414-1-christophe.jaillet@wanadoo.fr>
 <20200625204730.943520-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200625204730.943520-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com, jejb@linux.ibm.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Thu, Jun 25, 2020 at 10:47:30PM +0200, Christophe JAILLET wrote:
> The dev_id used in 'request_irq()' and 'free_irq()' should match.
> Use 'info' in both cases.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Russell King <rmk+kernel@armlinux.org.uk>

Thanks Christophe.

> ---
> V2: update free_irq instead of request_irq in order not to obviously break
>     code
> ---
>  drivers/scsi/arm/cumana_2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/arm/cumana_2.c b/drivers/scsi/arm/cumana_2.c
> index 65691c21f133..29294f0ef8a9 100644
> --- a/drivers/scsi/arm/cumana_2.c
> +++ b/drivers/scsi/arm/cumana_2.c
> @@ -450,7 +450,7 @@ static int cumanascsi2_probe(struct expansion_card *ec,
>  
>  	if (info->info.scsi.dma != NO_DMA)
>  		free_dma(info->info.scsi.dma);
> -	free_irq(ec->irq, host);
> +	free_irq(ec->irq, info);
>  
>   out_release:
>  	fas216_release(host);
> -- 
> 2.25.1
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
