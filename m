From: Joe Perches <joe@perches.com>
Date: Tue, 30 May 2017 10:22:33 +0000
Subject: Re: [PATCH] ALSA: sound/core/pcm_timer.c: include pcm_local.h and remove some extraneous tabs
Message-Id: <1496139753.2618.21.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170530095830.31534-1-colin.king@canonical.com>
In-Reply-To: <20170530095830.31534-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2017-05-30 at 10:58 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> We need to include pcm_local.h to clean up some smatch warnings:
> 
> symbol 'snd_pcm_timer_done' was not declared. Should it be static?
> symbol 'snd_pcm_timer_init' was not declared. Should it be static?
> symbol 'snd_pcm_timer_resolution_change' was not declared. Should
>   it be static?
> 
> Also remove some extraneous tabs on empty lines.

Thanks.  trivia:

> diff --git a/sound/core/pcm_timer.c b/sound/core/pcm_timer.c
[]
> @@ -33,7 +35,7 @@ void snd_pcm_timer_resolution_change(struct snd_pcm_substream *substream)
>  {
>  	unsigned long rate, mult, fsize, l, post;
>  	struct snd_pcm_runtime *runtime = substream->runtime;
> -	
> +
>          mult = 1000000000;
>  	rate = runtime->rate;

Maybe fix the mult indentation too?

