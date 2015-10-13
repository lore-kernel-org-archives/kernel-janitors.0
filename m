From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 13 Oct 2015 09:39:41 +0000
Subject: Re: [patch] ALSA: pcm: harmless underflow issue in snd_pcm_sw_params()
Message-Id: <s5heggzksyq.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151013070756.GA31537@mwanda>
In-Reply-To: <20151013070756.GA31537@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

On Tue, 13 Oct 2015 09:07:56 +0200,
Dan Carpenter wrote:
> 
> "params->tstamp_mode" is a user supplied int.  We cap the maximum but
> allow negative values by mistake.  It's harmless but static checkers
> complain.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

You already sent the same fix and it was applied in the commit
145d92e77e6f.


thanks,

Takashi

> 
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 75888dd..4863af5 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -650,7 +650,8 @@ static int snd_pcm_sw_params(struct snd_pcm_substream *substream,
>  	}
>  	snd_pcm_stream_unlock_irq(substream);
>  
> -	if (params->tstamp_mode > SNDRV_PCM_TSTAMP_LAST)
> +	if (params->tstamp_mode < 0 ||
> +	    params->tstamp_mode > SNDRV_PCM_TSTAMP_LAST)
>  		return -EINVAL;
>  	if (params->proto >= SNDRV_PROTOCOL_VERSION(2, 0, 12) &&
>  	    params->tstamp_type > SNDRV_PCM_TSTAMP_TYPE_LAST)
> 
