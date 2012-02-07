From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 07 Feb 2012 09:59:48 +0000
Subject: Re: [patch] ALSA: hda ca0132 - remove unused error handling code
Message-Id: <s5hobtbotez.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120207071932.GA21047@elgon.mountain>
In-Reply-To: <20120207071932.GA21047@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, alsa-devel@alsa-project.org, Ian Minett <ian_minett@creativelabs.com>, kernel-janitors@vger.kernel.org

At Tue, 7 Feb 2012 10:19:32 +0300,
Dan Carpenter wrote:
> 
> We never save the return value from chipio_write() so "err" is always
> zero here, not less than zero.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> The other option would be to save the return value. 

Yes, this should be a better option.  chipio_write() may fail indeed.

But then your report spotted another bug.  It doesn't handle
snd_hda_power_up|down() correctly in the error path.  It must be fixed
as well.

I'll fix these all up.

> I don't have the
> hardware and I worried that there was a reason we don't save it.  The
> current code is misleading because it looks like it's checked until
> you notice that the "err = " bit is missing.


thanks,

Takashi

> 
> diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
> index 35abe3c..92f1f0c 100644
> --- a/sound/pci/hda/patch_ca0132.c
> +++ b/sound/pci/hda/patch_ca0132.c
> @@ -733,8 +733,6 @@ static int ca0132_hp_switch_put(struct snd_kcontrol *kcontrol,
>  	/* *valp 0 is mute, 1 is unmute */
>  	data = (data & 0x7f) | (*valp ? 0 : 0x80);
>  	chipio_write(codec, REG_CODEC_MUTE, data);
> -	if (err < 0)
> -		return err;
>  
>  	spec->curr_hp_switch = *valp;
>  
> @@ -775,8 +773,6 @@ static int ca0132_speaker_switch_put(struct snd_kcontrol *kcontrol,
>  	/* *valp 0 is mute, 1 is unmute */
>  	data = (data & 0xef) | (*valp ? 0 : 0x10);
>  	chipio_write(codec, REG_CODEC_MUTE, data);
> -	if (err < 0)
> -		return err;
>  
>  	spec->curr_speaker_switch = *valp;
>  
> @@ -824,14 +820,10 @@ static int ca0132_hp_volume_put(struct snd_kcontrol *kcontrol,
>  	val = 31 - left_vol;
>  	data = (data & 0xe0) | val;
>  	chipio_write(codec, REG_CODEC_HP_VOL_L, data);
> -	if (err < 0)
> -		return err;
>  
>  	val = 31 - right_vol;
>  	data = (data & 0xe0) | val;
>  	chipio_write(codec, REG_CODEC_HP_VOL_R, data);
> -	if (err < 0)
> -		return err;
>  
>  	spec->curr_hp_volume[0] = left_vol;
>  	spec->curr_hp_volume[1] = right_vol;
> 
