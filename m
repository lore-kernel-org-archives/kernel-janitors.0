From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 30 Dec 2015 21:51:12 +0000
Subject: Re: [PATCH] ALSA: dummy: constify dummy_timer_ops structures
Message-Id: <s5h7fjvtxkf.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1451474929-25424-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1451474929-25424-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 30 Dec 2015 12:28:49 +0100,
Julia Lawall wrote:
> 
> The dummy_timer_ops structures are never modified, so declare them as
> const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thanks.


Takashi

> 
> ---
>  sound/drivers/dummy.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
> index 016e451..75b7485 100644
> --- a/sound/drivers/dummy.c
> +++ b/sound/drivers/dummy.c
> @@ -351,7 +351,7 @@ static void dummy_systimer_free(struct snd_pcm_substream *substream)
>  	kfree(substream->runtime->private_data);
>  }
>  
> -static struct dummy_timer_ops dummy_systimer_ops = {
> +static const struct dummy_timer_ops dummy_systimer_ops = {
>  	.create =	dummy_systimer_create,
>  	.free =		dummy_systimer_free,
>  	.prepare =	dummy_systimer_prepare,
> @@ -475,7 +475,7 @@ static void dummy_hrtimer_free(struct snd_pcm_substream *substream)
>  	kfree(dpcm);
>  }
>  
> -static struct dummy_timer_ops dummy_hrtimer_ops = {
> +static const struct dummy_timer_ops dummy_hrtimer_ops = {
>  	.create =	dummy_hrtimer_create,
>  	.free =		dummy_hrtimer_free,
>  	.prepare =	dummy_hrtimer_prepare,
> 
> 
