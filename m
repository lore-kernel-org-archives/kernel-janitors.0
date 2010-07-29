From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 29 Jul 2010 12:02:13 +0000
Subject: Re: [PATCH 06/10 v2] ALSA: msnd: check request_region() return value
Message-Id: <s5hocdqsdh6.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280400325-9405-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280400325-9405-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

At Thu, 29 Jul 2010 14:45:24 +0400,
Kulikov Vasiliy wrote:
> 
> request_region() may fail, if so return -EBUSY.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Thanks, applied both patches now.


Takashi

> ---
>  sound/isa/msnd/msnd_pinnacle.c |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/sound/isa/msnd/msnd_pinnacle.c b/sound/isa/msnd/msnd_pinnacle.c
> index 60b6abd..ed42f8e 100644
> --- a/sound/isa/msnd/msnd_pinnacle.c
> +++ b/sound/isa/msnd/msnd_pinnacle.c
> @@ -549,7 +549,10 @@ static int __devinit snd_msnd_attach(struct snd_card *card)
>  		printk(KERN_ERR LOGNAME ": Couldn't grab IRQ %d\n", chip->irq);
>  		return err;
>  	}
> -	request_region(chip->io, DSP_NUMIO, card->shortname);
> +	if (request_region(chip->io, DSP_NUMIO, card->shortname) = NULL) {
> +		free_irq(chip->irq, chip);
> +		return -EBUSY;
> +	}
>  
>  	if (!request_mem_region(chip->base, BUFFSIZE, card->shortname)) {
>  		printk(KERN_ERR LOGNAME
> -- 
> 1.7.0.4
> 
