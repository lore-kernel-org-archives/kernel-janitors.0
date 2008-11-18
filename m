From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 18 Nov 2008 16:14:43 +0000
Subject: Re: [PATCH] sound: Fix warnings relating to ignored return value in snd_card_register
Message-Id: <s5hej19dn9o.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <154e089b0811180759x4db4ba61k467fa2275710938f@mail.gmail.com>
In-Reply-To: <154e089b0811180759x4db4ba61k467fa2275710938f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

At Tue, 18 Nov 2008 16:59:03 +0100,
Hannes Eder wrote:
> 
> Do not ignore the return of 'device_create_file' in
> 'snd_card_register' and thereby fixing the following warnings:
> 
> sound/core/init.c: In function 'snd_card_register':
> sound/core/init.c:640: warning: ignoring return value of
> 'device_create_file', declared with attribute warn_unused_result
> sound/core/init.c:641: warning: ignoring return value of
> 'device_create_file', declared with attribute warn_unused_result

The changes look good, but please run checkpatch.pl to your patch and
fix the coding style issues suggested there.


thanks,

Takashi

> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
>  sound/core/init.c |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/core/init.c b/sound/core/init.c
> index af1e407..814d834 100644
> --- a/sound/core/init.c
> +++ b/sound/core/init.c
> @@ -637,8 +637,10 @@ int snd_card_register(struct snd_card *card)
>  #endif
>  #ifndef CONFIG_SYSFS_DEPRECATED
>  	if (card->card_dev) {
> -		device_create_file(card->card_dev, &card_id_attrs);
> -		device_create_file(card->card_dev, &card_number_attrs);
> +		if ((err = device_create_file(card->card_dev, &card_id_attrs)) < 0)
> +			return err;
> +		if ((err = device_create_file(card->card_dev, &card_number_attrs)) < 0)
> +			return err;
>  	}
>  #endif
>  	return 0;
> 
