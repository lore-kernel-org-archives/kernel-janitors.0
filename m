From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 27 Jul 2011 14:05:05 +0000
Subject: Re: [patch] ALSA: asihpi - off by one in asihpi_hpi_ioctl()
Message-Id: <s5h8vrjbyzy.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110727120226.GP3824@shale.localdomain>
In-Reply-To: <20110727120226.GP3824@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Eliot Blennerhassett <eblennerhassett@audioscience.com>, Dan Rosenberg <drosenberg@vsecurity.com>, kernel-janitors@vger.kernel.org, "open list:SOUND" <alsa-devel@alsa-project.org>

At Wed, 27 Jul 2011 15:02:26 +0300,
Dan Carpenter wrote:
> 
> "adapter" is used as an array index in the adapters[] array so
> the off by one would make us read past the end.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied now.  Thanks.


Takashi

> ---
> 1c073b67979 "ALSA: asihpi - Remove spurious adapter index check"
> reverted Dan Rosenburg's check that would have prevented the
> overflow here.
> 
> Also it moved the initialization of "pa" down a couple lines so I'm
> concerned there may be a bogus derereference here when we check
> pa->type.  I don't have the hardware, so I can't test this.
> 
> diff --git a/sound/pci/asihpi/hpioctl.c b/sound/pci/asihpi/hpioctl.c
> index 65fcf47..7ba7073 100644
> --- a/sound/pci/asihpi/hpioctl.c
> +++ b/sound/pci/asihpi/hpioctl.c
> @@ -183,7 +183,7 @@ long asihpi_hpi_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  		int wrflag = -1;
>  		u32 adapter = hm->h.adapter_index;
>  
> -		if ((adapter > HPI_MAX_ADAPTERS) || (!pa->type)) {
> +		if ((adapter >= HPI_MAX_ADAPTERS) || (!pa->type)) {
>  			hpi_init_response(&hr->r0, HPI_OBJ_ADAPTER,
>  				HPI_ADAPTER_OPEN,
>  				HPI_ERROR_BAD_ADAPTER_NUMBER);
> 
