From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 05 Mar 2015 12:02:20 +0000
Subject: Re: [patch] ALSA: msnd: add some missing curly braces
Message-Id: <s5htwxz64ab.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150305112637.GB13378@mwanda>
In-Reply-To: <20150305112637.GB13378@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

At Thu, 5 Mar 2015 14:26:37 +0300,
Dan Carpenter wrote:
> 
> There were some curly braces intended here.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.


Takashi

> 
> diff --git a/sound/isa/msnd/msnd_pinnacle_mixer.c b/sound/isa/msnd/msnd_pinnacle_mixer.c
> index 17e49a0..b408540 100644
> --- a/sound/isa/msnd/msnd_pinnacle_mixer.c
> +++ b/sound/isa/msnd/msnd_pinnacle_mixer.c
> @@ -306,11 +306,12 @@ int snd_msndmix_new(struct snd_card *card)
>  	spin_lock_init(&chip->mixer_lock);
>  	strcpy(card->mixername, "MSND Pinnacle Mixer");
>  
> -	for (idx = 0; idx < ARRAY_SIZE(snd_msnd_controls); idx++)
> +	for (idx = 0; idx < ARRAY_SIZE(snd_msnd_controls); idx++) {
>  		err = snd_ctl_add(card,
>  				  snd_ctl_new1(snd_msnd_controls + idx, chip));
>  		if (err < 0)
>  			return err;
> +	}
>  
>  	return 0;
>  }
> 
