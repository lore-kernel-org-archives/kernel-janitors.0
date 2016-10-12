From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 12 Oct 2016 18:11:16 +0000
Subject: Re: [patch] ALSA: line6: fix a crash in line6_hwdep_write()
Message-Id: <s5h37k1jv3v.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161012062140.GT12841@mwanda>
In-Reply-To: <20161012062140.GT12841@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrej Krutak <dev@andree.sk>, Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, kbuild test robot <fengguang.wu@intel.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, kernel-janitors@vger.kernel.org

On Wed, 12 Oct 2016 08:21:40 +0200,
Dan Carpenter wrote:
> 
> The error checking here is messed up so we could end up dereferencing
> -EFAULT.
> 
> Fixes: a16039cbf1a1 ('ALSA: line6: Add hwdep interface to access the POD control messages')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.


Takashi

> 
> diff --git a/sound/usb/line6/driver.c b/sound/usb/line6/driver.c
> index 14e587e..90009c0 100644
> --- a/sound/usb/line6/driver.c
> +++ b/sound/usb/line6/driver.c
> @@ -604,8 +604,8 @@ line6_hwdep_write(struct snd_hwdep *hwdep, const char __user *data, long count,
>  	}
>  
>  	data_copy = memdup_user(data, count);
> -	if (IS_ERR(ERR_PTR))
> -		return -ENOMEM;
> +	if (IS_ERR(data_copy))
> +		return PTR_ERR(data_copy);
>  
>  	rv = line6_send_raw_message(line6, data_copy, count);
>  
> 
