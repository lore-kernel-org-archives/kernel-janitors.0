From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 05 Mar 2014 11:11:31 +0000
Subject: Re: [patch] ALSA: lola: NULL deref on allocation error
Message-Id: <s5h61ns528s.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140305105225.GA3599@elgon.mountain>
In-Reply-To: <20140305105225.GA3599@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

At Wed, 5 Mar 2014 13:55:09 +0300,
Dan Carpenter wrote:
> 
> "chip" is NULL here.  We don't need a printk here because kmalloc() has
> it built in.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.


Takashi

> 
> diff --git a/sound/pci/lola/lola.c b/sound/pci/lola/lola.c
> index d63434d8c3fb..68824cdd137d 100644
> --- a/sound/pci/lola/lola.c
> +++ b/sound/pci/lola/lola.c
> @@ -586,7 +586,6 @@ static int lola_create(struct snd_card *card, struct pci_dev *pci,
>  
>  	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
>  	if (!chip) {
> -		dev_err(chip->card->dev, "cannot allocate chip\n");
>  		pci_disable_device(pci);
>  		return -ENOMEM;
>  	}
> 
