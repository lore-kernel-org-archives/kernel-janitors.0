From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 10 Apr 2012 06:43:12 +0000
Subject: Re: [PATCH] sound/isa/sscape.c: add missing resource-release code
Message-Id: <s5hobr0ulxb.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1333959395-18960-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1333959395-18960-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

At Mon,  9 Apr 2012 10:16:35 +0200,
Julia Lawall wrote:
> 
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> At the point of this error-handling code, both regions and the dma have
> been allocated, so free it as done in previous and subsequent
> error-handling code.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied now.  Thanks.


Takashi

> 
> ---
>  sound/isa/sscape.c |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/isa/sscape.c b/sound/isa/sscape.c
> index b4a6aa9..131dd98 100644
> --- a/sound/isa/sscape.c
> +++ b/sound/isa/sscape.c
> @@ -1019,13 +1019,15 @@ static int __devinit create_sscape(int dev, struct snd_card *card)
>  	irq_cfg = get_irq_config(sscape->type, irq[dev]);
>  	if (irq_cfg = INVALID_IRQ) {
>  		snd_printk(KERN_ERR "sscape: Invalid IRQ %d\n", irq[dev]);
> -		return -ENXIO;
> +		err = -ENXIO;
> +		goto _release_dma;
>  	}
>  
>  	mpu_irq_cfg = get_irq_config(sscape->type, mpu_irq[dev]);
>  	if (mpu_irq_cfg = INVALID_IRQ) {
>  		snd_printk(KERN_ERR "sscape: Invalid IRQ %d\n", mpu_irq[dev]);
> -		return -ENXIO;
> +		err = -ENXIO;
> +		goto _release_dma;
>  	}
>  
>  	/*
> 
