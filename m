From: Kishon Vijay Abraham I <kishon@ti.com>
Date: Mon, 18 Jul 2016 06:41:21 +0000
Subject: Re: [PATCH] PCI: dra7xx: Fix return value in case of error
Message-Id: <578C7741.2010903@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1468531107-3639-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1468531107-3639-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, bhelgaas@google.com
Cc: linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On Friday 15 July 2016 02:48 AM, Christophe JAILLET wrote:
> In function 'dra7xx_pcie_init_irq_domain', the pattern used to check and
> return error is:
> 
>    if (!var) {
>       dev_err(...);
>       return PTR_ERR(var);
>    }
> 
> So the returned value in case of error is always 0, which means 'success'.
> Change it to return -ENODEV instead.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Kishon Vijay Abraham I <kishon@ti.com>
> ---
>  drivers/pci/host/pci-dra7xx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/host/pci-dra7xx.c b/drivers/pci/host/pci-dra7xx.c
> index f441130..81b3949 100644
> --- a/drivers/pci/host/pci-dra7xx.c
> +++ b/drivers/pci/host/pci-dra7xx.c
> @@ -181,14 +181,14 @@ static int dra7xx_pcie_init_irq_domain(struct pcie_port *pp)
>  
>  	if (!pcie_intc_node) {
>  		dev_err(dev, "No PCIe Intc node found\n");
> -		return PTR_ERR(pcie_intc_node);
> +		return -ENODEV;
>  	}
>  
>  	pp->irq_domain = irq_domain_add_linear(pcie_intc_node, 4,
>  					       &intx_domain_ops, pp);
>  	if (!pp->irq_domain) {
>  		dev_err(dev, "Failed to get a INTx IRQ domain\n");
> -		return PTR_ERR(pp->irq_domain);
> +		return -ENODEV;
>  	}
>  
>  	return 0;
> 
