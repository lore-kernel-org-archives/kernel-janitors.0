From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 09 Feb 2015 13:58:09 +0000
Subject: Re: [patch v2] ALSA: off by one bug in snd_riptide_joystick_probe()
Message-Id: <s5hh9uvtcem.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <s5hy4ogfvc2.wl-tiwai@suse.de>
	<20150209135139.GA26866@mwanda>
In-Reply-To: <20150209135139.GA26866@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Lars-Peter Clausen <lars@metafoo.de>, Hans Wennborg <hans@hanshq.net>, Benoit Taine <benoit.taine@lip6.fr>, Bjorn Helgaas <bhelgaas@google.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

At Mon, 9 Feb 2015 16:51:40 +0300,
Dan Carpenter wrote:
> 
> The problem here is that we check:
> 
> 	if (dev >= SNDRV_CARDS)
> 
> Then we increment "dev".
> 
>        if (!joystick_port[dev++])
> 
> Then we use it as an offset into a array with SNDRV_CARDS elements.
> 
> 	if (!request_region(joystick_port[dev], 8, "Riptide gameport")) {
> 
> This has 3 effects:
> 1) If you use the module option to specify the joystick port then it has
>    to be shifted one space over.
> 2) The wrong error message will be printed on failure if you have over
>    32 cards.
> 3) Static checkers will correctly complain that are off by one.
> 
> Fixes: db1005ec6ff8 ('ALSA: riptide - Fix joystick resource handling')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: In the original patch I just made the array larger.

Applied, thanks.


Takashi

> 
> diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
> index 29f2827..94639d6 100644
> --- a/sound/pci/riptide/riptide.c
> +++ b/sound/pci/riptide/riptide.c
> @@ -2011,32 +2011,43 @@ snd_riptide_joystick_probe(struct pci_dev *pci, const struct pci_device_id *id)
>  {
>  	static int dev;
>  	struct gameport *gameport;
> +	int ret;
>  
>  	if (dev >= SNDRV_CARDS)
>  		return -ENODEV;
> +
>  	if (!enable[dev]) {
> -		dev++;
> -		return -ENOENT;
> +		ret = -ENOENT;
> +		goto inc_dev;
>  	}
>  
> -	if (!joystick_port[dev++])
> -		return 0;
> +	if (!joystick_port[dev]) {
> +		ret = 0;
> +		goto inc_dev;
> +	}
>  
>  	gameport = gameport_allocate_port();
> -	if (!gameport)
> -		return -ENOMEM;
> +	if (!gameport) {
> +		ret = -ENOMEM;
> +		goto inc_dev;
> +	}
>  	if (!request_region(joystick_port[dev], 8, "Riptide gameport")) {
>  		snd_printk(KERN_WARNING
>  			   "Riptide: cannot grab gameport 0x%x\n",
>  			   joystick_port[dev]);
>  		gameport_free_port(gameport);
> -		return -EBUSY;
> +		ret = -EBUSY;
> +		goto inc_dev;
>  	}
>  
>  	gameport->io = joystick_port[dev];
>  	gameport_register_port(gameport);
>  	pci_set_drvdata(pci, gameport);
> -	return 0;
> +
> +	ret = 0;
> +inc_dev:
> +	dev++;
> +	return ret;
>  }
>  
>  static void snd_riptide_joystick_remove(struct pci_dev *pci)
> 
