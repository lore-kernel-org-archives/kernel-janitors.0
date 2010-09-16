From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 16 Sep 2010 21:11:47 +0000
Subject: Re: [patch] ALSA: usb/mixer: remove bogus cast
Message-Id: <s5hhbhpieb0.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100916181347.GC7867@bicker>
In-Reply-To: <20100916181347.GC7867@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

At Thu, 16 Sep 2010 20:13:47 +0200,
Dan Carpenter wrote:
> 
> "uinfo->value.enumerated.item" is an unsigned int.  If it's negative
> when we do the comparison:
> 	if ((int)uinfo->value.enumerated.item >= cval->max)
> then we would read past the end of the array on the next line.

This cast was for the old crappy gcc who spews bogus warnings when
compared with signed and unsigned ints.  The kernel sets a compile flag
for avoiding this since long time ago, so we can get rid of such
cast gracefully now, indeed.

> I also changed the strcpy() to strlcpy() out of paranoia.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied now.  Thanks.


Takashi

> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> index 3ed3901..93c95c5 100644
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
> @@ -1642,9 +1642,10 @@ static int mixer_ctl_selector_info(struct snd_kcontrol *kcontrol, struct snd_ctl
>  	uinfo->type = SNDRV_CTL_ELEM_TYPE_ENUMERATED;
>  	uinfo->count = 1;
>  	uinfo->value.enumerated.items = cval->max;
> -	if ((int)uinfo->value.enumerated.item >= cval->max)
> +	if (uinfo->value.enumerated.item >= cval->max)
>  		uinfo->value.enumerated.item = cval->max - 1;
> -	strcpy(uinfo->value.enumerated.name, itemlist[uinfo->value.enumerated.item]);
> +	strlcpy(uinfo->value.enumerated.name, itemlist[uinfo->value.enumerated.item],
> +		sizeof(uinfo->value.enumerated.name));
>  	return 0;
>  }
>  
> 
