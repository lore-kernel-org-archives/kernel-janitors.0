From: Greg Kurz <groug@kaod.org>
Date: Thu, 01 Aug 2019 09:41:32 +0000
Subject: Re: [PATCH 2/2] powerpc/xive: Add a check for memory allocation failure
Message-Id: <20190801114132.4c1db5be@bahia.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1564647619.git.christophe.jaillet@wanadoo.fr>
 <cc53462734dfeaf15b6bad0e626b483de18656b4.1564647619.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cc53462734dfeaf15b6bad0e626b483de18656b4.1564647619.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, paulus@samba.org, clg@kaod.org, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, allison@lohutok.net

On Thu,  1 Aug 2019 10:32:42 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> The result of this kzalloc is not checked. Add a check and corresponding
> error handling code.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

> Note that 'xive_irq_bitmap_add()' failures are not handled in
> 'xive_spapr_init()'
> I guess that it is not really an issue. This function is _init, so if a
> memory allocation occures here, it is likely that the system will
> already be in bad shape.

Hmm not sure... The allocation could also fail if the "ibm,xive-lisn-ranges"
property contains an insanely big range, eg. count = 1 << 31. The system isn't
necessarily in bad shape in this case, but XIVE is definitely unusable and
we should let a chance to the kernel to switch to XICS in this case.

I guess it is worth adding proper error handling in xive_spapr_init() as well.

> Anyway, the check added here would at least keep the data linked in
> 'xive_irq_bitmaps' usable.
> ---
>  arch/powerpc/sysdev/xive/spapr.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
> index b4f5eb9e0f82..52198131c75e 100644
> --- a/arch/powerpc/sysdev/xive/spapr.c
> +++ b/arch/powerpc/sysdev/xive/spapr.c
> @@ -53,6 +53,10 @@ static int xive_irq_bitmap_add(int base, int count)
>  	xibm->base = base;
>  	xibm->count = count;
>  	xibm->bitmap = kzalloc(xibm->count, GFP_KERNEL);
> +	if (!xibm->bitmap) {
> +		kfree(xibm);
> +		return -ENOMEM;
> +	}
>  	list_add(&xibm->list, &xive_irq_bitmaps);
>  
>  	pr_info("Using IRQ range [%x-%x]", xibm->base,
