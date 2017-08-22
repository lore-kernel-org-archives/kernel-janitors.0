From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 22 Aug 2017 19:07:57 +0000
Subject: Re: [PATCH] ALSA: via82xx: Use common error handling code in snd_via82xx_create()
Message-Id: <20170822190757.76e5edh5t6tgvzpu@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2332472c-61d2-8c21-bf46-5c80745d6380@users.sourceforge.net>
In-Reply-To: <2332472c-61d2-8c21-bf46-5c80745d6380@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <Julia.Lawall@lip6.fr>

On Tue, Aug 22, 2017 at 07:43:08PM +0200, SF Markus Elfring wrote:
> @@ -1121,30 +1121,27 @@ static int snd_via82xx_create(struct snd_card *card,
>  
>  	if ((err = pci_request_regions(pci, card->driver)) < 0) {
>  		kfree(chip);
> -		pci_disable_device(pci);
> -		return err;
> +		goto disable_device;
>  	}

[ snip ]

> @@ -1153,6 +1150,14 @@ static int snd_via82xx_create(struct snd_card *card,
>  
>  	*r_via = chip;
>  	return 0;
> +
> +disable_device:
> +	pci_disable_device(pci);
> +	goto exit;

Why is this "goto exit" here?  It's leaking now.

> +free_chip:
> +	snd_via82xx_free(chip);
> +exit:
> +	return err;
>  }

regards,
dan carpenter
