From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 20 Mar 2009 12:14:29 +0000
Subject: Re: [PATCH] sound/ali5451: typo: s/resouces/resources/
Message-Id: <s5htz5o75ne.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1237540091-19359-1-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1237540091-19359-1-git-send-email-w.sang@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

At Fri, 20 Mar 2009 10:08:11 +0100,
Wolfram Sang wrote:
> 
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>

Applied now to sound git tree.
Thanks.

Takashi

> ---
>  sound/pci/ali5451/ali5451.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
> index 1a0fd65..9069c78 100644
> --- a/sound/pci/ali5451/ali5451.c
> +++ b/sound/pci/ali5451/ali5451.c
> @@ -2142,7 +2142,7 @@ static int __devinit snd_ali_resources(struct snd_ali *codec)
>  {
>  	int err;
>  
> -	snd_ali_printk("resouces allocation ...\n");
> +	snd_ali_printk("resources allocation ...\n");
>  	err = pci_request_regions(codec->pci, "ALI 5451");
>  	if (err < 0)
>  		return err;
> @@ -2154,7 +2154,7 @@ static int __devinit snd_ali_resources(struct snd_ali *codec)
>  		return -EBUSY;
>  	}
>  	codec->irq = codec->pci->irq;
> -	snd_ali_printk("resouces allocated.\n");
> +	snd_ali_printk("resources allocated.\n");
>  	return 0;
>  }
>  static int snd_ali_dev_free(struct snd_device *device)
> -- 
> 1.5.6.5
> 
