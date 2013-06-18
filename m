From: "H. Peter Anvin" <hpa@zytor.com>
Date: Tue, 18 Jun 2013 20:36:54 +0000
Subject: Re: [patch] x86/PCI: MMCONFIG: shift wrapping in mcfg_ioremap()
Message-Id: <51C0C4E6.7020204@zytor.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130618074024.GE12329@elgon.mountain>
In-Reply-To: <20130618074024.GE12329@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 06/18/2013 02:40 AM, Dan Carpenter wrote:
> This is a static checker fix.  "size" is a u64 here, but "num_buses" is
> only 32 bits so we would hit shift wrapping bugs trying to use larger
> sizes.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/arch/x86/pci/mmconfig_64.c b/arch/x86/pci/mmconfig_64.c
> index bea5249..430ed2b 100644
> --- a/arch/x86/pci/mmconfig_64.c
> +++ b/arch/x86/pci/mmconfig_64.c
> @@ -98,8 +98,7 @@ const struct pci_raw_ops pci_mmcfg = {
>  static void __iomem *mcfg_ioremap(struct pci_mmcfg_region *cfg)
>  {
>  	void __iomem *addr;
> -	u64 start, size;
> -	int num_buses;
> +	u64 start, size, num_buses;
>  
>  	start = cfg->address + PCI_MMCFG_BUS_OFFSET(cfg->start_bus);
>  	num_buses = cfg->end_bus - cfg->start_bus + 1;
> 

This seems crazy.  PCI is limited to 256 busses per domain, so I suspect
this is a non-issue.

	-hpa

