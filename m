From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Date: Wed, 28 May 2014 21:57:11 +0000
Subject: Re: [patch 1/2] ALSA: fireworks: remove some stray checks
Message-Id: <53865BB7.5020006@sakamocchi.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140528164202.GB1824@mwanda>
In-Reply-To: <20140528164202.GB1824@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Clemens Ladisch <clemens@ladisch.de>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

(May 29 2014 01:42), Dan Carpenter wrote:
> We checked "err" earlier.  These things seem to be left over code.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewd-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Tested-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

> diff --git a/sound/firewire/fireworks/fireworks.c b/sound/firewire/fireworks/fireworks.c
> index a354d26..8e856cc 100644
> --- a/sound/firewire/fireworks/fireworks.c
> +++ b/sound/firewire/fireworks/fireworks.c
> @@ -89,8 +89,6 @@ get_hardware_info(struct snd_efw *efw)
>  	snprintf(version, sizeof(version), "%u.%u",
>  		 (hwinfo->arm_version >> 24) & 0xff,
>  		 (hwinfo->arm_version >> 16) & 0xff);
> -	if (err < 0)
> -		goto end;
>  	efw->firmware_version = hwinfo->arm_version;
>  
>  	strcpy(efw->card->driver, "Fireworks");
> @@ -101,8 +99,6 @@ get_hardware_info(struct snd_efw *efw)
>  		 hwinfo->vendor_name, hwinfo->model_name, version,
>  		 hwinfo->guid_hi, hwinfo->guid_lo,
>  		 dev_name(&efw->unit->device), 100 << fw_dev->max_speed);
> -	if (err < 0)
> -		goto end;
>  
>  	if (hwinfo->flags & BIT(FLAG_RESP_ADDR_CHANGABLE))
>  		efw->resp_addr_changable = true;

