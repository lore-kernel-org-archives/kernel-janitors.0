From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 01 Aug 2007 10:38:16 +0000
Subject: Re: [PATCH 2/3] sound/pci ioremap/iounmap balancing
Message-Id: <s5hps27tu93.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070801060256.F0BA2DA820@mailserver8.hushmail.com>
In-Reply-To: <20070801060256.F0BA2DA820@mailserver8.hushmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: postfail@hushmail.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org

At Wed, 01 Aug 2007 02:02:56 -0400,
Scott Thompson wrote:
> 
> ioremap / iounmap balancing in sound/pci tree
> 
> Signed-off-by: Scott Thompson <postfail <at> hushmail.com>
> ---
> diff --git a/sound/pci/mixart/mixart.c b/sound/pci/mixart/mixart.c
> index ac007ce..871b09f 100644
> --- a/sound/pci/mixart/mixart.c
> +++ b/sound/pci/mixart/mixart.c
> @@ -1319,6 +1319,13 @@ static int __devinit snd_mixart_probe(struct 
> pci_dev *pci,
>  						   pci_resource_len(pci, i));
>  	}
>  
> +	if (!mgr->mem[0].virt || !mgr->mem[1].virt){
> +		printk(KERN_ERR "unable to remap resource 0x%lx and/or 0x%lx\n",
> +			mgr->mem[0].phys, mgr->mem[1].phys);
> +		snd_mixart_free(mgr);
> +		return -EBUSY;
> +	}
> +
>  	if (request_irq(pci->irq, snd_mixart_interrupt, IRQF_SHARED,
>  			CARD_NAME, mgr)) {
>  		snd_printk(KERN_ERR "unable to grab IRQ %d\n", pci->irq);

This would be rater a lacking check of returned errors.

The other changes look incorrect.  All these drivers use
card->private_free callback to release the resources even for the
error exit.  Thus, you don't need iounmap in each place.


thanks,

Takashi
