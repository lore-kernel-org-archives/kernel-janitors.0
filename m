From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Date: Fri, 23 Feb 2018 14:06:43 +0000
Subject: Re: [PATCH] PCI: rcar-gen2: remove duplicated bit-wise or of RCAR_PCI_INT_SIGRETABORT
Message-Id: <20180223140643.GA24211@e107981-ln.cambridge.arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180223122949.24291-1-colin.king@canonical.com>
In-Reply-To: <20180223122949.24291-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Simon Horman <horms@verge.net.au>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Feb 23, 2018 at 12:29:49PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Bit pattern RCAR_PCI_INT_SIGRETABORT is being bit-wise or'd twice;
> remove the redundant 2nd RCAR_PCI_INT_SIGRETABORT.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/pci/host/pci-rcar-gen2.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pci/host/pci-rcar-gen2.c b/drivers/pci/host/pci-rcar-gen2.c

Applied to pci/rcar for v4.17, thanks !

Lorenzo

> index a28370bb2b2a..dd4f1a6b57c5 100644
> --- a/drivers/pci/host/pci-rcar-gen2.c
> +++ b/drivers/pci/host/pci-rcar-gen2.c
> @@ -52,7 +52,6 @@
>  #define RCAR_PCI_INT_B			(1 << 17)
>  #define RCAR_PCI_INT_PME		(1 << 19)
>  #define RCAR_PCI_INT_ALLERRORS (RCAR_PCI_INT_SIGTABORT		| \
> -				RCAR_PCI_INT_SIGRETABORT	| \
>  				RCAR_PCI_INT_SIGRETABORT	| \
>  				RCAR_PCI_INT_REMABORT		| \
>  				RCAR_PCI_INT_PERR		| \
> -- 
> 2.15.1
> 
