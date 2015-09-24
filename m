From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 24 Sep 2015 09:46:37 +0000
Subject: Re: ALSA: core: check for underflow in snd_pcm_sw_params()
Message-Id: <s5hk2rg5ev6.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150923094228.GA13867@mwanda>
In-Reply-To: <20150923094228.GA13867@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, kernel-janitors@vger.kernel.org

On Wed, 23 Sep 2015 11:42:28 +0200,
Dan Carpenter wrote:
> 
> As far as I can see, having an invalid ->tstamp_mode is harmless, but
> adding a check silences a static checker warning.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.


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
