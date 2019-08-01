From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Date: Thu, 01 Aug 2019 11:31:35 +0000
Subject: Re: [PATCH] powerpc/xive: Add some error handling code to 'xive_spapr_init()'
Message-Id: <bb72af16-d775-de39-498b-5e64976d93de@kaod.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190801110956.8517-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190801110956.8517-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, allison@lohutok.net, tglx@linutronix.de, groug@kaod.org
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On 01/08/2019 13:09, Christophe JAILLET wrote:
> 'xive_irq_bitmap_add()' can return -ENOMEM.
> In this case, we should free the memory already allocated and return
> 'false' to the caller.
> 
> Also add an error path which undoes the 'tima = ioremap(...)'
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> NOT compile tested (I don't have a cross compiler and won't install one).

All distros have a packaged powerpc cross compiler. 

Then, you need to compile a kernel for a pseries machine and run a pseries
machine with it under QEMU. You can use a simple ppc initrd, a net install 
one for example.

You could also hack the device tree in QEMU to torture the XIVE sPAPR driver.
Nothing too complex, all is here : 

https://git.qemu.org/?p=qemu.git;a=blob;f=hw/intc/spapr_xive.c;h	7f88d4608d8ba160526756a3a224e5176b6e0f;hb=HEAD#l1427


> So if some correction or improvement are needed, feel free to propose and
> commit it directly.

Yes there is I think. I would move at the end all the code that needs a 
rollback.

Thanks for taking a look, I might do that one day.

Cheers,
C.  


> ---
>  arch/powerpc/sysdev/xive/spapr.c | 36 +++++++++++++++++++++++++-------
>  1 file changed, 28 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
> index 52198131c75e..b3ae0b76c433 100644
> --- a/arch/powerpc/sysdev/xive/spapr.c
> +++ b/arch/powerpc/sysdev/xive/spapr.c
> @@ -64,6 +64,17 @@ static int xive_irq_bitmap_add(int base, int count)
>  	return 0;
>  }
>  
> +static void xive_irq_bitmap_remove_all(void)
> +{
> +	struct xive_irq_bitmap *xibm, *tmp;
> +
> +	list_for_each_entry_safe(xibm, tmp, &xive_irq_bitmaps, list) {
> +		list_del(&xibm->list);
> +		kfree(xibm->bitmap);
> +		kfree(xibm);
> +	}
> +}
> +
>  static int __xive_irq_bitmap_alloc(struct xive_irq_bitmap *xibm)
>  {
>  	int irq;
> @@ -723,7 +734,7 @@ bool __init xive_spapr_init(void)
>  	u32 val;
>  	u32 len;
>  	const __be32 *reg;
> -	int i;
> +	int i, err;
>  
>  	if (xive_spapr_disabled())
>  		return false;
> @@ -748,23 +759,26 @@ bool __init xive_spapr_init(void)
>  	}
>  
>  	if (!xive_get_max_prio(&max_prio))
> -		return false;
> +		goto err_unmap;
>  
>  	/* Feed the IRQ number allocator with the ranges given in the DT */
>  	reg = of_get_property(np, "ibm,xive-lisn-ranges", &len);
>  	if (!reg) {
>  		pr_err("Failed to read 'ibm,xive-lisn-ranges' property\n");
> -		return false;
> +		goto err_unmap;
>  	}
>  
>  	if (len % (2 * sizeof(u32)) != 0) {
>  		pr_err("invalid 'ibm,xive-lisn-ranges' property\n");
> -		return false;
> +		goto err_unmap;
>  	}
>  
> -	for (i = 0; i < len / (2 * sizeof(u32)); i++, reg += 2)
> -		xive_irq_bitmap_add(be32_to_cpu(reg[0]),
> -				    be32_to_cpu(reg[1]));
> +	for (i = 0; i < len / (2 * sizeof(u32)); i++, reg += 2) {
> +		err = xive_irq_bitmap_add(be32_to_cpu(reg[0]),
> +					  be32_to_cpu(reg[1]));
> +		if (err < 0)
> +			goto err_mem_free;
> +	}
>  
>  	/* Iterate the EQ sizes and pick one */
>  	of_property_for_each_u32(np, "ibm,xive-eq-sizes", prop, reg, val) {
> @@ -775,8 +789,14 @@ bool __init xive_spapr_init(void)
>  
>  	/* Initialize XIVE core with our backend */
>  	if (!xive_core_init(&xive_spapr_ops, tima, TM_QW1_OS, max_prio))
> -		return false;
> +		goto err_mem_free;
>  
>  	pr_info("Using %dkB queues\n", 1 << (xive_queue_shift - 10));
>  	return true;
> +
> +err_mem_free:
> +	xive_irq_bitmap_remove_all();
> +err_unmap:
> +	iounmap(tima);
> +	return false;
>  }
> 
