From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 22 Aug 2017 20:16:12 +0000
Subject: Re: [PATCH] ALSA: via82xx: Use common error handling code in snd_via82xx_create()
Message-Id: <20170822201400.lw3bcjlvx4lzlq5d@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2332472c-61d2-8c21-bf46-5c80745d6380@users.sourceforge.net>
 <20170822190757.76e5edh5t6tgvzpu@mwanda>
 <d9b9dc7e-9c00-3f1d-f6f8-a2e67110c449@users.sourceforge.net>
In-Reply-To: <d9b9dc7e-9c00-3f1d-f6f8-a2e67110c449@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <Julia.Lawall@lip6.fr>

On Tue, Aug 22, 2017 at 10:05:37PM +0200, SF Markus Elfring wrote:
> >> @@ -1121,30 +1121,27 @@ static int snd_via82xx_create(struct snd_card *card,
> >>  
> >>  	if ((err = pci_request_regions(pci, card->driver)) < 0) {
> >>  		kfree(chip);
> >> -		pci_disable_device(pci);
> >> -		return err;
> >> +		goto disable_device;

Ah, you're right.  It's not leaking.  I thought you deleted the
kfree(chip);...

regards,
dan carpenter

