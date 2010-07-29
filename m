From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 29 Jul 2010 10:31:46 +0000
Subject: Re: [PATCH 10/10] ALSA: asihpi: check return value of get_user()
Message-Id: <s5h39v2tw8d.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280335316-23515-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280335316-23515-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: Eliot Blennerhassett <eblennerhassett@audioscience.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

At Wed, 28 Jul 2010 20:41:56 +0400,
Kulikov Vasiliy wrote:
> 
> get_user() may fail, if so return -EFAULT.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Thanks, applied this one, too.


Takashi

> ---
>  sound/pci/asihpi/hpioctl.c |   17 +++++++++++++----
>  1 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/pci/asihpi/hpioctl.c b/sound/pci/asihpi/hpioctl.c
> index 3114999..62895a7 100644
> --- a/sound/pci/asihpi/hpioctl.c
> +++ b/sound/pci/asihpi/hpioctl.c
> @@ -121,11 +121,17 @@ long asihpi_hpi_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  	phpi_ioctl_data = (struct hpi_ioctl_linux __user *)arg;
>  
>  	/* Read the message and response pointers from user space.  */
> -	get_user(puhm, &phpi_ioctl_data->phm);
> -	get_user(puhr, &phpi_ioctl_data->phr);
> +	if (get_user(puhm, &phpi_ioctl_data->phm) ||
> +	    get_user(puhr, &phpi_ioctl_data->phr)) {
> +		err = -EFAULT;
> +		goto out;
> +	}
>  
>  	/* Now read the message size and data from user space.  */
> -	get_user(hm->h.size, (u16 __user *)puhm);
> +	if (get_user(hm->h.size, (u16 __user *)puhm)) {
> +		err = -EFAULT;
> +		goto out;
> +	}
>  	if (hm->h.size > sizeof(*hm))
>  		hm->h.size = sizeof(*hm);
>  
> @@ -138,7 +144,10 @@ long asihpi_hpi_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  		goto out;
>  	}
>  
> -	get_user(res_max_size, (u16 __user *)puhr);
> +	if (get_user(res_max_size, (u16 __user *)puhr)) {
> +		err = -EFAULT;
> +		goto out;
> +	}
>  	/* printk(KERN_INFO "user response size %d\n", res_max_size); */
>  	if (res_max_size < sizeof(struct hpi_response_header)) {
>  		HPI_DEBUG_LOG(WARNING, "small res size %d\n", res_max_size);
> -- 
> 1.7.0.4
> 
