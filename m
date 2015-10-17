From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 17 Oct 2015 10:11:58 +0000
Subject: Re: [patch] ALSA: firewire-tascam: off by one in identify_model()
Message-Id: <s5hlhb1dcsx.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151015181828.GC3163@mwanda>
In-Reply-To: <20151015181828.GC3163@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Clemens Ladisch <clemens@ladisch.de>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org

On Thu, 15 Oct 2015 20:18:29 +0200,
Dan Carpenter wrote:
> 
> In the original code, we potentially put a NUL character in model[8] and
> it caused a static checker warning.  We can put the NUL in model[7]
> instead.

I guess it's better to expand model[] to 9 bytes instead.  The logic
is to retrieve the string from the config rom, and it's up to 8
letters.


thanks,

Takashi

> 
> Fixes: 53b3ffee7885 ('ALSA: firewire-tascam: change device probing processing')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/sound/firewire/tascam/tascam.c b/sound/firewire/tascam/tascam.c
> index c6747a4..6ef2bcc 100644
> --- a/sound/firewire/tascam/tascam.c
> +++ b/sound/firewire/tascam/tascam.c
> @@ -51,7 +51,7 @@ static int identify_model(struct snd_tscm *tscm)
>  	}
>  
>  	/* Pick up model name from certain addresses. */
> -	for (i = 0; i < 8; i++) {
> +	for (i = 0; i < 7; i++) {
>  		c = config_rom[28 + i / 4] >> (24 - 8 * (i % 4));
>  		if (c = '\0')
>  			break;
> 
