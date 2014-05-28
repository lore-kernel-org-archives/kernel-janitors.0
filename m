From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Date: Wed, 28 May 2014 21:57:55 +0000
Subject: Re: [alsa-devel] [patch 2/2] ALSA: fireworks: small leak on error path
Message-Id: <53865BE3.3010602@sakamocchi.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140528164246.GC1824@mwanda>
In-Reply-To: <20140528164246.GC1824@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Clemens Ladisch <clemens@ladisch.de>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

(May 29 2014 01:42), Dan Carpenter wrote:
> There was a typo here so we return directly instead of freeing "hwinfo".
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewd-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Tested-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

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

