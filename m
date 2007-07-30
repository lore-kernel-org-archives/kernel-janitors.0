From: Greg Ungerer <gerg@snapgear.com>
Date: Mon, 30 Jul 2007 00:40:23 +0000
Subject: Re: [PATCH 09/68] 0 -> NULL, for arch/m68knommu
Message-Id: <46AD3377.6020909@snapgear.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707270944.LAA17230@ifs.emn.fr>
In-Reply-To: <200707270944.LAA17230@ifs.emn.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yoann Padioleau <padator@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

Hi Yoann,

Yoann Padioleau wrote:
> When comparing a pointer, it's clearer to compare it to NULL than to 0.
>
> Signed-off-by: Yoann Padioleau <padator@wanadoo.fr>
> Cc: gerg@uclinux.org

Acked-by: Greg Ungerer <gerg@uclinux.org>


> Cc: akpm@linux-foundation.org
> ---
> 
>  comempci.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/m68knommu/kernel/comempci.c b/arch/m68knommu/kernel/comempci.c
> index 6ee00ef..528517e 100644
> --- a/arch/m68knommu/kernel/comempci.c
> +++ b/arch/m68knommu/kernel/comempci.c
> @@ -736,7 +736,7 @@ #endif
>  
>  	/* Find a free spot to put this handler */
>  	for (i = 0; (i < COMEM_MAXPCI); i++) {
> -		if (pci_irqlist[i].handler = 0) {
> +		if (pci_irqlist[i].handler = NULL) {
>  			pci_irqlist[i].handler = handler;
>  			pci_irqlist[i].device = device;
>  			pci_irqlist[i].dev_id = dev_id;
> 
> 

-- 
------------------------------------------------------------------------
Greg Ungerer  --  Chief Software Dude       EMAIL:     gerg@snapgear.com
Secure Computing Corporation                PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
