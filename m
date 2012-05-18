From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 18 May 2012 13:47:32 +0000
Subject: Re: [patch] ALSA: hda - unlock on error in azx_interrupt()
Message-Id: <s5h4nrdbnyj.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120518073611.GA4136@elgon.mountain>
In-Reply-To: <20120518073611.GA4136@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, David Henningsson <david.henningsson@canonical.com>

At Fri, 18 May 2012 10:36:11 +0300,
Dan Carpenter wrote:
> 
> There is an spin_unlock() missing on this error path.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This was added recently in a82d51ed2 "ALSA: hda - Support
> VGA-switcheroo".  I don't have the hardware so I haven't tested it.

Good catch.  Applied now.
Thanks.

Takashi

> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index bbf953f..2b6392b 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -1268,8 +1268,10 @@ static irqreturn_t azx_interrupt(int irq, void *dev_id)
>  
>  	spin_lock(&chip->reg_lock);
>  
> -	if (chip->disabled)
> +	if (chip->disabled) {
> +		spin_unlock(&chip->reg_lock);
>  		return IRQ_NONE;
> +	}
>  
>  	status = azx_readl(chip, INTSTS);
>  	if (status = 0) {
> 
