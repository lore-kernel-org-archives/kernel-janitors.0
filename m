From: Domen Puncer <domen@coderock.org>
Date: Mon, 04 Sep 2006 22:04:53 +0000
Subject: Re: [KJ] [PATCH] oss/btaudio.c: Check ioremap return value and free
Message-Id: <20060904220453.GD26935@nd47.coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1157300808.6767.10.camel@localhost.localdomain>
In-Reply-To: <1157300808.6767.10.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 03/09/06 19:26 +0300, ville palo wrote:
> 
> Check return value of the ioremap() and balance ioremap()
> with iounmap().
> 
> Signed-off-by: Ville Palo <ville.palo@vi64pa.net>
> 
> diff --git a/sound/oss/btaudio.c b/sound/oss/btaudio.c
> index 324a81f..9b1837f 100644
> --- a/sound/oss/btaudio.c
> +++ b/sound/oss/btaudio.c
> @@ -927,6 +927,10 @@ static int __devinit btaudio_probe(struc
>  	bta->mem  = pci_resource_start(pci_dev,0);
>  	bta->mmio = ioremap(pci_resource_start(pci_dev,0),
>  			    pci_resource_len(pci_dev,0));
> +	if (!bta->mmio) {
> +		rc = -EIO;
> +		goto fail1;
> +	}
>  
>  	bta->source     = 1;
>  	bta->bits       = 8;
> @@ -1019,6 +1023,7 @@ static int __devinit btaudio_probe(struc
>  		unregister_sound_dsp(bta->dsp_digital);
>   fail2:
>          free_irq(bta->irq,bta);	
> +	iounmap(bta->mmio);

Why here?
This won't work if ie. request_irq fails.


	Domen

>   fail1:
>  	kfree(bta);
>   fail0:
> @@ -1047,6 +1052,8 @@ static void __devexit btaudio_remove(str
>  	}
>  
>  	/* free resources */
> +	if (bta->mmio)
> +		iounmap(bta->mmio);
>  	free_buffer(bta);
>          free_irq(bta->irq,bta);
>  	release_mem_region(pci_resource_start(pci_dev,0),
> 
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
