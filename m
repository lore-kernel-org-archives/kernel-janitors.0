From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 22 Nov 2014 20:49:29 +0000
Subject: Re: [patch] sound: oss: uart401: remove unneeded NULL check
Message-Id: <s5hy4r39d0m.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141122182901.GA6994@mwanda>
In-Reply-To: <20141122182901.GA6994@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Himangi Saraogi <himangi774@gmail.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

At Sat, 22 Nov 2014 21:29:01 +0300,
Dan Carpenter wrote:
> 
> "devc" can't be NULL here so there is no need to check.  Also I removed
> the "devc = NULL" assignment because devc is stored on stack so it's
> a no-op.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.


Takashi

> 
> diff --git a/sound/oss/uart401.c b/sound/oss/uart401.c
> index 279bc56..dae4d43 100644
> --- a/sound/oss/uart401.c
> +++ b/sound/oss/uart401.c
> @@ -412,13 +412,10 @@ void unload_uart401(struct address_info *hw_config)
>  
>  	if (!devc->share_irq)
>  		free_irq(devc->irq, devc);
> -	if (devc)
> -	{
> -		kfree(midi_devs[devc->my_dev]->converter);
> -		kfree(midi_devs[devc->my_dev]);
> -		kfree(devc);
> -		devc = NULL;
> -	}
> +	kfree(midi_devs[devc->my_dev]->converter);
> +	kfree(midi_devs[devc->my_dev]);
> +	kfree(devc);
> +
>  	/* This kills midi_devs[x] */
>  	sound_unload_mididev(hw_config->slots[4]);
>  }
> 
