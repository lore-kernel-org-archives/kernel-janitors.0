From: Greg Ungerer <gerg@linux-m68k.org>
Date: Tue, 21 Apr 2020 07:12:34 +0000
Subject: Re: [PATCH] m68k/PCI: Fix a memory leak in an error handling path
Message-Id: <3a465332-532b-00f1-bca0-4ead5228ebd9@linux-m68k.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200418070751.25420-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200418070751.25420-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, geert@linux-m68k.org, bhelgaas@google.com, lorenzo.pieralisi@arm.com
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Christophe,

On 18/4/20 5:07 pm, Christophe JAILLET wrote:
> If 'ioremap' fails, we must free 'bridge', as done in other error handling
> path bellow.
> 
> Fixes: 19cc4c843f40 ("m68k/PCI: Replace pci_fixup_irqs() call with host bridge IRQ mapping hooks")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Looks good, thanks.
I will queue this in the for-next branch of the m68knommu tree.

Regards
Greg


> ---
>   arch/m68k/coldfire/pci.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/coldfire/pci.c b/arch/m68k/coldfire/pci.c
> index 62b0eb6cf69a..84eab0f5e00a 100644
> --- a/arch/m68k/coldfire/pci.c
> +++ b/arch/m68k/coldfire/pci.c
> @@ -216,8 +216,10 @@ static int __init mcf_pci_init(void)
>   
>   	/* Keep a virtual mapping to IO/config space active */
>   	iospace = (unsigned long) ioremap(PCI_IO_PA, PCI_IO_SIZE);
> -	if (iospace = 0)
> +	if (iospace = 0) {
> +		pci_free_host_bridge(bridge);
>   		return -ENODEV;
> +	}
>   	pr_info("Coldfire: PCI IO/config window mapped to 0x%x\n",
>   		(u32) iospace);
>   
> 
