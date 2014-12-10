From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 10 Dec 2014 13:45:35 +0000
Subject: Re: [patch] ALSA: lola: NULL dereference on probe failure
Message-Id: <s5h7fxz8vpc.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141210130646.GA18593@mwanda>
In-Reply-To: <20141210130646.GA18593@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Benoit Taine <benoit.taine@lip6.fr>, Bjorn Helgaas <bhelgaas@google.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

At Wed, 10 Dec 2014 16:06:46 +0300,
Dan Carpenter wrote:
> 
> "card" is NULL if snd_card_new() fails.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.


Takashi

> 
> diff --git a/sound/pci/lola/lola.c b/sound/pci/lola/lola.c
> index a75c8dc..4cf4be5 100644
> --- a/sound/pci/lola/lola.c
> +++ b/sound/pci/lola/lola.c
> @@ -719,7 +719,7 @@ static int lola_probe(struct pci_dev *pci,
>  	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
>  			   0, &card);
>  	if (err < 0) {
> -		dev_err(card->dev, "Error creating card!\n");
> +		dev_err(&pci->dev, "Error creating card!\n");
>  		return err;
>  	}
>  
> 
