From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 25 Jul 2015 06:20:39 +0000
Subject: Re: [patch] ALSA: hda - fix cs4210_spdif_automute()
Message-Id: <s5hsi8cvjuw.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <s5hoaj1v89z.wl-tiwai@suse.de>
	<20150725000337.GA14581@mwanda>
In-Reply-To: <20150725000337.GA14581@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

On Sat, 25 Jul 2015 02:03:38 +0200,
Dan Carpenter wrote:
> 
> Smatch complains that we have nested checks for "spdif_present".  It
> turns out the current behavior isn't correct, we should remove the first
> check and keep the second.
> 
> Fixes: 1077a024812d ('ALSA: hda - Use generic parser for Cirrus codec driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.


Takashi

> 
> diff --git a/sound/pci/hda/patch_cirrus.c b/sound/pci/hda/patch_cirrus.c
> index 25ccf78..584a034 100644
> --- a/sound/pci/hda/patch_cirrus.c
> +++ b/sound/pci/hda/patch_cirrus.c
> @@ -999,9 +999,7 @@ static void cs4210_spdif_automute(struct hda_codec *codec,
>  
>  	spec->spdif_present = spdif_present;
>  	/* SPDIF TX on/off */
> -	if (spdif_present)
> -		snd_hda_set_pin_ctl(codec, spdif_pin,
> -				    spdif_present ? PIN_OUT : 0);
> +	snd_hda_set_pin_ctl(codec, spdif_pin, spdif_present ? PIN_OUT : 0);
>  
>  	cs_automute(codec);
>  }
> 
