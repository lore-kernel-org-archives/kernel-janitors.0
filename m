From: walter harms <wharms@bfs.de>
Date: Tue, 24 Oct 2006 16:36:35 +0000
Subject: Re: [KJ] [Patch] kmemdup() cleanup in drivers/pci/
Message-Id: <453E4113.30203@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1161634468.419.1.camel@alice>
In-Reply-To: <1161634468.419.1.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi eric,
to add some cream you may like to use (i did not check the types):
ret = kmemdup(des, sizeof(*des), GFP_KERNEL);
that make it independet of the type.

re,
 wh


Eric Sesterhenn wrote:
> hi,
> 
> replace open coded kmemdup() to save some screen space,
> and allow inlining/not inlining to be triggered by gcc.
> 
> Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>
> 
> --- linux-2.6.19-rc2-git7/drivers/pci/hotplug/acpiphp_ibm.c.orig	2006-10-23 21:30:51.000000000 +0200
> +++ linux-2.6.19-rc2-git7/drivers/pci/hotplug/acpiphp_ibm.c	2006-10-23 21:31:31.000000000 +0200
> @@ -160,10 +160,8 @@ static union apci_descriptor *ibm_slot_f
>  		ret = des;
>  
>  ibm_slot_done:
> -	if (ret) {
> -		ret = kmalloc(sizeof(union apci_descriptor), GFP_KERNEL);
> -		memcpy(ret, des, sizeof(union apci_descriptor));
> -	}
> +	if (ret)
> +		ret = kmemdup(des, sizeof(union apci_descriptor), GFP_KERNEL);
>  	kfree(table);
>  	return ret;
>  }
> 
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
> 
> 
> 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
