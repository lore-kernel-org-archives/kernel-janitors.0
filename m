From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 17 Jul 2015 20:30:29 +0000
Subject: Re: [PATCH] ALSA: sparc: Add missing kfree in error path
Message-Id: <s5hegk634t6.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1437158001-29890-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1437158001-29890-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: perex@perex.cz, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 17 Jul 2015 20:33:21 +0200,
Christophe JAILLET wrote:
> 
> If 'of_ioremap' fails, then 'amd' should be freed, otherwise, there is a
> memory leak.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks.


Takashi

> ---
>  sound/sparc/amd7930.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/sparc/amd7930.c b/sound/sparc/amd7930.c
> index 1b1a89e..784ceb8 100644
> --- a/sound/sparc/amd7930.c
> +++ b/sound/sparc/amd7930.c
> @@ -956,6 +956,7 @@ static int snd_amd7930_create(struct snd_card *card,
>  	if (!amd->regs) {
>  		snd_printk(KERN_ERR
>  			   "amd7930-%d: Unable to map chip registers.\n", dev);
> +		kfree(amd);
>  		return -EIO;
>  	}
>  
> -- 
> 2.1.4
> 
> 
