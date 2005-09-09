From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 09 Sep 2005 07:58:22 +0000
Subject: Re: [KJ] [PATCH] printk : arch/alpha/kernel/core_marvel.c
Message-Id: <20050909075822.GB31634@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56655041350066471=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050908070849.GB26072@rhum.iomeda.fr>
In-Reply-To: <20050908070849.GB26072@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============56655041350066471==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 08, 2005 at 10:49:11AM +0200, Christophe Lucas wrote:
> printk() calls should include appropriate KERN_* constant.

> --- linux-2.6.13.orig/arch/alpha/kernel/core_marvel.c
> +++ linux-2.6.13/arch/alpha/kernel/core_marvel.c
> @@ -759,7 +759,7 @@ marvel_ioremap(unsigned long addr, unsig
>  		    baddr += PAGE_SIZE, vaddr += PAGE_SIZE) {
>  			pfn = ptes[baddr >> PAGE_SHIFT];
>  			if (!(pfn & 1)) {
> -				printk("ioremap failed... pte not valid...\n");
> +				printk(KERN_WARNING "ioremap failed... pte not valid...\n");
>  				vfree(area->addr);
>  				return NULL;
>  			}
> @@ -768,7 +768,7 @@ marvel_ioremap(unsigned long addr, unsig
>  			if (__alpha_remap_area_pages(vaddr,
>  						     pfn << PAGE_SHIFT, 
>  						     PAGE_SIZE, 0)) {
> -				printk("FAILED to map...\n");
> +				printk(KERN_WARNING "FAILED to map...\n");
>  				vfree(area->addr);
>  				return NULL;
>  			}
> @@ -1053,13 +1053,13 @@ marvel_agp_translate(alpha_agp_info *agp
>  
>  	if (addr < agp->aperture.bus_base ||
>  	    addr >= agp->aperture.bus_base + agp->aperture.size) {
> -		printk("%s: addr out of range\n", __FUNCTION__);
> +		printk(KERN_WARNING "%s: addr out of range\n", __FUNCTION__);
>  		return -EINVAL;
>  	}
>  
>  	pte = aper->arena->ptes[baddr >> PAGE_SHIFT];
>  	if (!(pte & 1)) {
> -		printk("%s: pte not valid\n", __FUNCTION__);
> +		printk(KERN_WARNING "%s: pte not valid\n", __FUNCTION__);
>  		return -EINVAL;
>  	} 
>  	return (pte >> 1) << PAGE_SHIFT;

Guess, these deserve KERN_ERR too.


--===============56655041350066471==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56655041350066471==--
