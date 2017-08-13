From: Joe Perches <joe@perches.com>
Date: Sun, 13 Aug 2017 01:08:18 +0000
Subject: Re: [PATCH 2/3] ALSA: mpu401: Use common error handling code in snd_mpu401_uart_new()
Message-Id: <1502586498.3099.27.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <47947226-bd09-5d15-c0d2-a9f4a659e1b4@users.sourceforge.net>
         <06592078-5382-5f6a-f9aa-c85f293e1734@users.sourceforge.net>
In-Reply-To: <06592078-5382-5f6a-f9aa-c85f293e1734@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, 2017-08-12 at 21:12 +0200, SF Markus Elfring wrote:
> Add a jump target so that a bit of exception handling can be better
> reused at the end of this function.
[]
> diff --git a/sound/drivers/mpu401/mpu401_uart.c b/sound/drivers/mpu401/mpu401_uart.c
[]
> @@ -612,6 +612,9 @@ int snd_mpu401_uart_new(struct snd_card *card, int device,
>  	if (rrawmidi)
>  		*rrawmidi = rmidi;
>  	return 0;
> +free_device:
> +	snd_device_free(card, rmidi);
> +	return err;
>  }
>  
>  EXPORT_SYMBOL(snd_mpu401_uart_new);

It may be more common and better to leave a blank line
between a single line return and a label.

It separates logical points in the function a bit more.
