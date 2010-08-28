From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 28 Aug 2010 10:02:22 +0000
Subject: Re: [patch] ALSA: pcm: add more format names
Message-Id: <s5hfwxz9hsh.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100827200215.GA15220@bicker>
In-Reply-To: <20100827200215.GA15220@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: alsa-devel@alsa-project.org, markgross <mgross@linux.intel.com>, Clemens Ladisch <clemens@ladisch.de>, kernel-janitors@vger.kernel.org, Ben Collins <bcollins@bluecherry.net>

At Fri, 27 Aug 2010 22:02:15 +0200,
Dan Carpenter wrote:
> 
> There were some new formats added in commit 15c0cee6c809 "ALSA: pcm:
> Define G723 3-bit and 5-bit formats".  That commit increased
> SNDRV_PCM_FORMAT_LAST as well.  My concern is that there are a couple
> places which do:
> 
>         for (i = 0; i < SNDRV_PCM_FORMAT_LAST; i++) {
>                 if (dummy->pcm_hw.formats & (1ULL << i))
>                         snd_iprintf(buffer, " %s", snd_pcm_format_name(i));
>         }
> 
> I haven't tested these but it looks like if "i" were equal to
> SNDRV_PCM_FORMAT_G723_24 or higher then we might read past the end of
> the array. 
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> Resending because I screwed up the CC lis on my first mail.

Applied now.  Thanks.


Takashi

> 
> diff --git a/sound/core/pcm.c b/sound/core/pcm.c
> index cbe815d..204af48 100644
> --- a/sound/core/pcm.c
> +++ b/sound/core/pcm.c
> @@ -203,10 +203,16 @@ static char *snd_pcm_format_names[] = {
>  	FORMAT(S18_3BE),
>  	FORMAT(U18_3LE),
>  	FORMAT(U18_3BE),
> +	FORMAT(G723_24),
> +	FORMAT(G723_24_1B),
> +	FORMAT(G723_40),
> +	FORMAT(G723_40_1B),
>  };
>  
>  const char *snd_pcm_format_name(snd_pcm_format_t format)
>  {
> +	if (format >= ARRAY_SIZE(snd_pcm_format_names))
> +		return "Unknown";
>  	return snd_pcm_format_names[format];
>  }
>  EXPORT_SYMBOL_GPL(snd_pcm_format_name);
> 
