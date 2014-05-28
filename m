From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Date: Wed, 28 May 2014 21:58:25 +0000
Subject: Re: [alsa-devel] [patch] ALSA: bebob: sizeof() vs ARRAY_SIZE() typo
Message-Id: <53865C01.3040400@sakamocchi.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140528164330.GD1824@mwanda>
In-Reply-To: <20140528164330.GD1824@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Clemens Ladisch <clemens@ladisch.de>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

(May 19 2014 01:43), Dan Carpenter wrote:
> ARRAY_SIZE() was intended here instead of sizeof().  The
> "bridgeco_freq_table" array holds integers so the original condition is
> never true.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewd-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Tested-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

> diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
> index 514c7c9..bc4f827 100644
> --- a/sound/firewire/bebob/bebob_stream.c
> +++ b/sound/firewire/bebob/bebob_stream.c
> @@ -749,7 +749,7 @@ parse_stream_formation(u8 *buf, unsigned int len,
>  		if (buf[2] = bridgeco_freq_table[i])
>  			break;
>  	}
> -	if (i = sizeof(bridgeco_freq_table))
> +	if (i = ARRAY_SIZE(bridgeco_freq_table))
>  		return -ENOSYS;
>  
>  	/* Avoid double count by different entries for the same rate. */

