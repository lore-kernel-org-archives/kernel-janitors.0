From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 22 Mar 2010 14:46:06 +0000
Subject: Re: [patch] cx231xx: card->driver "Conexant cx231xx Audio" too long
Message-Id: <s5hr5ncxvm9.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100319114957.GQ5331@bicker>
In-Reply-To: <20100319114957.GQ5331@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Srinivasa Deevi <srinivasa.deevi@conexant.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

At Fri, 19 Mar 2010 14:49:57 +0300,
Dan Carpenter wrote:
> 
> card->driver is 15 characters and a NULL, the original code could 
> cause a buffer overflow.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

This should rather a string without spaces because this string is used
as an identifier in alsa-lib.
Better to use "Cx231xx" or "Cx231xx-Audio".


Takashi

> 
> diff --git a/drivers/media/video/cx231xx/cx231xx-audio.c b/drivers/media/video/cx231xx/cx231xx-audio.c
> index 7793d60..b3282ae 100644
> --- a/drivers/media/video/cx231xx/cx231xx-audio.c
> +++ b/drivers/media/video/cx231xx/cx231xx-audio.c
> @@ -495,7 +495,7 @@ static int cx231xx_audio_init(struct cx231xx *dev)
>  	pcm->info_flags = 0;
>  	pcm->private_data = dev;
>  	strcpy(pcm->name, "Conexant cx231xx Capture");
> -	strcpy(card->driver, "Conexant cx231xx Audio");
> +	strcpy(card->driver, "Cx231xx Audio");
>  	strcpy(card->shortname, "Cx231xx Audio");
>  	strcpy(card->longname, "Conexant cx231xx Audio");
>  
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
