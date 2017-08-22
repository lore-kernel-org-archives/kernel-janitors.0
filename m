From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 22 Aug 2017 12:16:25 +0000
Subject: Re: [PATCH] ALSA: pcsp: Use common error handling code in snd_card_pcsp_probe()
Message-Id: <20170822121625.syvr64kwyh5xjexg@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <08ee0d6b-788b-2845-6964-e1e55c2d2292@users.sourceforge.net>
In-Reply-To: <08ee0d6b-788b-2845-6964-e1e55c2d2292@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

  	err = snd_card_register(card);
> -	if (err < 0) {
> +	if (err) {
> +free_card:
>  		snd_card_free(card);
>  		return err;
>  	}

I thought we agreed, yesterday, to never use this style of error
handling?

regards,
dan carpenter

