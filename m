From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Sun, 02 Jul 2006 15:50:38 +0000
Subject: Re: [KJ] [Kj] [PATCH] drivers/atm/idt77252.c: Fix KERN_* in printk
Message-Id: <20060702085038.5c54177f.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44A7EED4.10905@chello.nl>
In-Reply-To: <44A7EED4.10905@chello.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 02 Jul 2006 18:05:40 +0200 Richard wrote:

> This is my first patch. If there's anything wrong with it I would like to hear it. There are far more printk statements to be fixed, but I would like to see if this patch survives.
> I also used KERN_INFO and KERN_ERR on an intuitive level. Any recommendations on this are welcome.
> 
> Signed-off-by: Richard van Berkum

Looks OK to me except for one change.  Please explain this one:

>  	TXPRINTK("%s: Sending %d bytes of data.\n",
>  		 card->name, skb->len);
>  
> -	tbd = &IDT77252_PRV_TBD(skb);
> +	tbd = &DT77252_PRV_TBD(skb);
>  	vcc = ATM_SKB(skb)->vcc;
>  
>  	IDT77252_PRV_PADDR(skb) = pci_map_single(card->pcidev, skb->data,

Does it build cleanly with this change?

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
