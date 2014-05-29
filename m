From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 29 May 2014 13:57:55 +0000
Subject: Re: [patch 2/2] ALSA: fireworks: small leak on error path
Message-Id: <s5hr43cadr0.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140528164246.GC1824@mwanda>
In-Reply-To: <20140528164246.GC1824@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

At Wed, 28 May 2014 19:42:46 +0300,
Dan Carpenter wrote:
> 
> There was a typo here so we return directly instead of freeing "hwinfo".
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.


Takashi

> 
> diff --git a/sound/firewire/fireworks/fireworks.c b/sound/firewire/fireworks/fireworks.c
> index 8e856cc..996fdc4 100644
> --- a/sound/firewire/fireworks/fireworks.c
> +++ b/sound/firewire/fireworks/fireworks.c
> @@ -157,7 +157,7 @@ get_hardware_info(struct snd_efw *efw)
>  	/* Hardware metering. */
>  	if (hwinfo->phys_in_grp_count  > HWINFO_MAX_CAPS_GROUPS ||
>  	    hwinfo->phys_out_grp_count > HWINFO_MAX_CAPS_GROUPS) {
> -		return -EIO;
> +		err = -EIO;
>  		goto end;
>  	}
>  	efw->phys_in = hwinfo->phys_in;
> 
