From: walter harms <wharms@bfs.de>
Date: Thu, 20 Oct 2011 07:39:23 +0000
Subject: Re: [patch] [ALSA] hwdep: silence integer overflow warning
Message-Id: <4E9FD02B.6030307@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111020060910.GA6101@elgon.mountain>
In-Reply-To: <20111020060910.GA6101@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 20.10.2011 08:09, schrieb Dan Carpenter:
> Smatch complains that if device is INT_MAX then device + 1 can
> overflow.  It just means we would have an annoying loop while we
> check all the devices from -2147483648 to SNDRV_MINOR_HWDEPS.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/sound/core/hwdep.c b/sound/core/hwdep.c
> index c7ceb28..edfdf6d 100644
> --- a/sound/core/hwdep.c
> +++ b/sound/core/hwdep.c
> @@ -273,7 +273,14 @@ static int snd_hwdep_control_ioctl(struct snd_card *card,
>  			if (get_user(device, (int __user *)arg))
>  				return -EFAULT;
>  			mutex_lock(&register_mutex);
> -			device = device < 0 ? 0 : device + 1;
> +
> +			if (device < 0)
> +				device = 0;
> +			else if (device > SNDRV_MINOR_HWDEPS)
> +				device = SNDRV_MINOR_HWDEPS;
> +			else
> +				device++;
> +
>  			while (device < SNDRV_MINOR_HWDEPS) {
>  				if (snd_hwdep_search(card, device))
>  					break;

I am not sure how SNDRV_MINOR_HWDEPS is used further but:
		else if (device < SNDRV_MINOR_HWDEPS)
				device++;
	        else
	              device = SNDRV_MINOR_HWDEPS;

that cuts the corner case device = SNDRV_MINOR_HWDEPS.

re,
 wh



> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
