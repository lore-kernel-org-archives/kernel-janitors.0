From: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Date: Wed, 27 Apr 2016 10:31:59 +0000
Subject: Re: [patch] [media] tw686x: off by one bugs in tw686x_fields_map()
Message-Id: <20160427073159.041490f8@recife.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160427080928.GC22469@mwanda>
In-Reply-To: <20160427080928.GC22469@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

Em Wed, 27 Apr 2016 11:09:28 +0300
Dan Carpenter <dan.carpenter@oracle.com> escreveu:

> The > ARRAY_SIZE() should be >= ARRAY_SIZE(). 

I actually did this fix when I produced the patch, just I forgot to fold
it when merging. Anyway, this was fixed upstream by this patch:
	https://git.linuxtv.org/media_tree.git/commit/?idEc175c4ae9695d6d2f30a45ab7f3866cfac184b

> Also this is a slightly
> unrelated cleanup but I replaced the magic numbers 30 and 25 with
> ARRAY_SIZE() - 1.

I don't like magic numbers, but, in this very specific case, setting
frames per second (fps) var to 25 or 30 makes much more sense. The
rationale is that:

The V4L2_STD_525_60 macro is for the Countries where the power line 
uses 60Hz, and V4L2_STD_625_50 for the Countries where the power line
is 50Hz.

The broadcast TV sends frames in half of this frequency, so, for
V4L2_STD_525_60, fps = 30, while, for V4L2_STD_625_50, fps = 25.

So, in this very specific case, IMHO, it is better to see 25 or 30 there,
instead of ARRAY_SIZE().

That's said, I guess one improvement would be to get rid of those two
arrays and replacing them by a formula, like:

               	i = (max_fps / 2 + 15 * fps) / max_fps;
                if (i > 14)
                        i = 0;

I'll propose such patch for evaluation.

Regards,
Mauro

> 
> Fixes: 363d79f1d5bd ('[media] tw686x: Don't go past array')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/media/pci/tw686x/tw686x-video.c b/drivers/media/pci/tw686x/tw686x-video.c
> index d2a0147..7b87f27 100644
> --- a/drivers/media/pci/tw686x/tw686x-video.c
> +++ b/drivers/media/pci/tw686x/tw686x-video.c
> @@ -64,12 +64,12 @@ static unsigned int tw686x_fields_map(v4l2_std_id std, unsigned int fps)
>  	unsigned int i;
>  
>  	if (std & V4L2_STD_525_60) {
> -		if (fps > ARRAY_SIZE(std_525_60))
> -			fps = 30;
> +		if (fps >= ARRAY_SIZE(std_525_60))
> +			fps = ARRAY_SIZE(std_525_60) - 1;
>  		i = std_525_60[fps];
>  	} else {
> -		if (fps > ARRAY_SIZE(std_625_50))
> -			fps = 25;
> +		if (fps >= ARRAY_SIZE(std_625_50))
> +			fps = ARRAY_SIZE(std_625_50) - 1;
>  		i = std_625_50[fps];
>  	}
>  


-- 
Thanks,
Mauro
