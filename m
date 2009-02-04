From: Scott Wood <scottwood@freescale.com>
Date: Wed, 04 Feb 2009 22:13:41 +0000
Subject: Re: [PATCH] arch/powerpc: Eliminate double sizeof
Message-Id: <498A1315.5060200@freescale.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0902042236200.3091@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0902042236200.3091@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linuxppc-dev@ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Julia Lawall wrote:
> Signed-off-by: Julia Lawall <julia@diku.dk>
> ---
>  arch/powerpc/platforms/82xx/pq2ads-pci-pic.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff -u -p a/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c b/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c
> --- a/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c
> +++ b/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c
> @@ -186,7 +186,7 @@ out_unmap_regs:
>  	iounmap(priv->regs);
>  out_free_bootmem:
>  	free_bootmem((unsigned long)priv,
> -	             sizeof(sizeof(struct pq2ads_pci_pic)));
> +	             sizeof(struct pq2ads_pci_pic));
>  	of_node_put(np);
>  out_unmap_irq:
>  	irq_dispose_mapping(irq);

ACK

-Scott
