From: Dan Rosenberg <drosenberg@vsecurity.com>
Date: Wed, 27 Jul 2011 12:55:02 +0000
Subject: Re: [patch] ALSA: asihpi - off by one in asihpi_hpi_ioctl()
Message-Id: <1311771302.2125.7.camel@osiris>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110727120226.GP3824@shale.localdomain>
In-Reply-To: <20110727120226.GP3824@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 2011-07-27 at 15:02 +0300, Dan Carpenter wrote:
> "adapter" is used as an array index in the adapters[] array so
> the off by one would make us read past the end.
> 

Agreed. I also don't like the fact that the "pa" pointer can be set to
an arbitrary address because the index isn't checked until after its
assignment. Even though the fix to the check prevents this pointer from
being dereferenced if it's out-of-bounds, it's still wrong.

> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> 1c073b67979 "ALSA: asihpi - Remove spurious adapter index check"
> reverted Dan Rosenburg's check that would have prevented the
> overflow here.
> 

If it's going in the commit log, s/Rosenburg/Rosenberg please. :-)

> Also it moved the initialization of "pa" down a couple lines so I'm
> concerned there may be a bogus derereference here when we check
> pa->type.  I don't have the hardware, so I can't test this.
> 

I agree.  This code seems to make assumptions in more than one place
that the adapters array is fully populated with non-NULL elements.  At a
glance, I can't see where such initialization occurs though.

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


