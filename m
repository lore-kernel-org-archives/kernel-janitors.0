From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 19 Apr 2007 13:23:57 +0000
Subject: Re: [KJ][PATCH] sound: SPIN_LOCK_UNLOCKED cleanup
Message-Id: <s5hlkgoa45u.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070419114444.GA12114@arun.site>
In-Reply-To: <20070419114444.GA12114@arun.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Milind Arun Choudhary <milindchoudhary@gmail.com>
Cc: Kernel Janitors <kernel-janitors@lists.osdl.org>, Andrw Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, liam.girdwood@wolfsonmicro.com

At Thu, 19 Apr 2007 17:14:44 +0530,
Milind Arun Choudhary wrote:
> 
> SPIN_LOCK_UNLOCKED cleanup,use __SPIN_LOCK_UNLOCKED instead 
> 
> Signed-off-by: Milind Arun Choudhary <milindchoudhary@gmail.com>

Thanks, applied to ALSA tree now.  (The file was renamed to
at91-ssc.c, so I applied it manually.)


Takashi


> 
> ---
> 
>  soc/at91/at91-i2s.c          |    6 +++---
>  1 file changed, 3  insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/at91/at91-i2s.c b/sound/soc/at91/at91-i2s.c
> index 9fc0c03..d65a47d 100644
> --- a/sound/soc/at91/at91-i2s.c
> +++ b/sound/soc/at91/at91-i2s.c
> @@ -151,20 +151,20 @@ static struct at91_ssc_info {
>  } ssc_info[NUM_SSC_DEVICES] = {
>  	{
>  	.name		= "ssc0",
> -	.lock		= SPIN_LOCK_UNLOCKED,
> +	.lock		= __SPIN_LOCK_UNLOCKED(ssc_info[0].lock),
>  	.dir_mask	= 0,
>  	.initialized	= 0,
>  	},
>  #if NUM_SSC_DEVICES = 3
>  	{
>  	.name		= "ssc1",
> -	.lock		= SPIN_LOCK_UNLOCKED,
> +	.lock		= __SPIN_LOCK_UNLOCKED(ssc_info[1].lock),
>  	.dir_mask	= 0,
>  	.initialized	= 0,
>  	},
>  	{
>  	.name		= "ssc2",
> -	.lock		= SPIN_LOCK_UNLOCKED,
> +	.lock		= __SPIN_LOCK_UNLOCKED(ssc_info[2].lock),
>  	.dir_mask	= 0,
>  	.initialized	= 0,
>  	},
> -- 
> Milind Arun Choudhary
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
