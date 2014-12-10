From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 10 Dec 2014 13:45:42 +0000
Subject: Re: [patch] ALSA: pcxhr: NULL dereference on probe failure
Message-Id: <s5h61dj8vp5.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141210132620.GB18593@mwanda>
In-Reply-To: <20141210132620.GB18593@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Aya Mahfouz <mahfouz.saif.elyazal@gmail.com>, Benoit Taine <benoit.taine@lip6.fr>, Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

At Wed, 10 Dec 2014 16:26:21 +0300,
Dan Carpenter wrote:
> 
> "card" is NULL if snd_card_new() fails.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.


Takashi

> 
> diff --git a/sound/pci/pcxhr/pcxhr.c b/sound/pci/pcxhr/pcxhr.c
> index a602930..c6092e4 100644
> --- a/sound/pci/pcxhr/pcxhr.c
> +++ b/sound/pci/pcxhr/pcxhr.c
> @@ -1638,7 +1638,7 @@ static int pcxhr_probe(struct pci_dev *pci,
>  				   0, &card);
>  
>  		if (err < 0) {
> -			dev_err(card->dev, "cannot allocate the card %d\n", i);
> +			dev_err(&pci->dev, "cannot allocate the card %d\n", i);
>  			pcxhr_free(mgr);
>  			return err;
>  		}
> 
